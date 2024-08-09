// 对artifical的修改

#include "ros/ros.h"
#include <stdio.h>
#include <iostream>
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/LaserScan.h>
#include <math.h>
#include <algorithm>
#include <robot_msgs/dgps.h>
#include <robot_msgs/nav_goal.h>
#include <eigen3/Eigen/Dense>
#include <robot_msgs/IoStatus.h>

using namespace std;
using namespace Eigen;

#define PI 3.1415
#define MAX 100
#define k 6
#define c 12
#define p 2.5

double x;
double y;
double z;
double alpha;
double alpha_by;

double a;
double b;
double reqalpha;
double reqalpha_by;

double attractangle;
double attractive;
double xattractive;
double yattractive;

double conpulsive;
double xconpulsive;
double yconpulsive;
double conangle;

double xsum;
double ysum;
double Fsum;
double angle;
double newspeed;
double newturnrate;

double xsum_by_k;
double ysum_by_k;
double Fsum_by_k;
double angle_by_k;
double newspeed_by_k;
double newturnrate_by_k;

double newturnrate_by;

double max_speed = 0.9;
double max_turning_speed_rad = 1;

ros::Publisher cmd_vel_pub; // 全局变量
geometry_msgs::Twist cmd_vel;
sensor_msgs::LaserScan laser;

void autonomous_behave(const sensor_msgs::LaserScan &laser1)
{
    laser = laser1;
}

double limit(double n, double min, double max)
{
	if (n < min)
		return min;
	else if (n > max)
		return max;
	else
		return n;
}

// 提取当前小车相对于基站的GPS数据，x, y, z, yaw
// 回调函数，用于处理名为robot_msgs::dgps的消息
void callback(const robot_msgs::dgps::ConstPtr &msg)
{
    x = msg->x; // 提取x、y、z坐标和偏航角（yaw）
    y = msg->y;
    z = msg->z;
    alpha = msg->yaw;

    alpha = (alpha / 180) * PI; // 将偏航角转换为弧度制

    if (alpha > PI)
    { // 将偏航角取反
        alpha = alpha - 2 * PI;
        alpha = -alpha;
    }
    else
    {
        alpha = -alpha;
    }
    alpha_by = alpha; // 将转换后的偏航角赋值给变量alpha_by
}

// 计算雷达探测的最小距离并计算所对应激光的索引
double get_min_distance_in_range(sensor_msgs::LaserScan laser, float min_degree, float max_degree, int &num)
{                                                          // -90, +90
    float limit_degrees = abs(laser.angle_min * 180 / PI); // 弧度转角度,得到最小角的角度值
    //                    abs(-pi * 180 / pi) = 180
    if (min_degree > max_degree) // 最大角度与最小角度的判断,如果最小角度大于最大角度，它们会交换
    {
        float aux = max_degree;
        max_degree = min_degree;
        min_degree = aux;
    }

    min_degree += limit_degrees; // 180 + (-90) = 90
    max_degree += limit_degrees; // 180 + (90) = 270
    // 将最小角度和最大角度转换为弧度
    float min_rad = min_degree / 180 * PI; // pi/2
    float max_rad = max_degree / 180 * PI; // 3pi/2

    // 根据激光扫描数据的角增量计算相应的偏移量
    int min_offset = (int)(min_rad / laser.angle_increment); // laser.angle_increment 接近1°? result ~= 90
    int max_offset = (int)(max_rad / laser.angle_increment); // result ~= 270

    float min = MAX;
    for (int i = min_offset; i < max_offset; i++) // 函数遍历从最小偏移量到最大偏移量的范围内的激光扫描数据的距离值
    {
        if (laser.ranges[i] < min) // 找到最小距离值及其对应的索引
        {
            min = laser.ranges[i];
            num = i;
        }
    }
    return min; // 函数返回找到的最小距离值
}

// 检查前方是否有障碍物
// bool check_front_obstacle(sensor_msgs::LaserScan laser, float x_region, float y_region)
// {
//     int offset = 0;               // 偏移量，用于调整扫描范围的起始位置
//     float min = MAX;              // 初始化最小距离为最大值
//     float x_min, y_min = 0.0;     // 初始化最小距离对应的x和y坐标
//     float angle, angle_min = 0.0; // 初始化角度和最小角度

//     // 遍历激光扫描数据
//     for (int i = offset; i < laser.ranges.size() - offset; i++)
//     {
//         // 如果距离在有效范围内（大于0.05米且小于1.0米）
//         if (laser.ranges[i] > 0.05 && laser.ranges[i] < 1.0)
//         {
//             // 计算当前角度
//             angle = laser.angle_min + i * laser.angle_increment;
//             // 计算当前距离对应的x和y坐标
//             double x = laser.ranges[i] * sin(angle);
//             double y = laser.ranges[i] * cos(angle);
//             // 如果x坐标的绝对值小于x_region且y坐标小于y_region
//             if ((fabs(x) < x_region) && (y < y_region))
//             {
//                 // 发现障碍物，返回true
//                 return true;
//             }
//         }
//     }
//     // 未发现障碍物，返回false
//     return false;
// }

void zby_k(double x_goal, double y_goal, double x0, double y0)
{
    // 计算目标点与小车之间的角度
    double a1 = atan2(y_goal, x_goal);
    double a2 = atan2(y0, x0);
    double a3 = cos(alpha);
    double a4 = sin(alpha);
    // 目标点相对基站坐标转换为小车坐标系下,坐标系变换矩阵（旋转）
    MatrixXd temp1(3, 3);
    temp1 << a3, -a4, 0, a4, a3, 0, 0, 0, 1;
    MatrixXd temp2(3, 3);
    temp2 = temp1.inverse();
    MatrixXd temp3(3, 1);
    temp3 << x_goal, y_goal, a1;
    MatrixXd temp4(3, 1);
    temp4 << x0, y0, a2;
    MatrixXd temp5(3, 1); // 3行1列
    temp5 = temp2 * (temp3 - temp4);
    double aaa = temp5(0, 0); // 第一行第一列
    double bbb = temp5(1, 0); // 第二行第一列
    double rEndx = fabs(aaa);
    double rEndy = fabs(bbb);
    // 计算向量的长度,两点之间距离（平移）
    double rEnd = sqrt((rEndx * rEndx) + (rEndy * rEndy));
    if (rEndx == 0) //  目标点在垂直方向上
    {
        if (bbb > y)
        {
            attractangle = PI / 2; // 目标点在正前方的情况
        }
        else
        {
            attractangle = -(PI / 2); // 目标点在正后方的情况
        }
    }
    else
    {
        attractangle = atan2((bbb), (aaa)); // 范围是[-π， π]
    }

    // 计算引力
    attractive = k * rEnd;
    xattractive = k * rEnd * cos(attractangle);
    yattractive = k * rEnd * sin(attractangle);

    // 计算斥力
    int num;
    // 获取激光雷达在-90到90度范围内的最小距离
    double aa = get_min_distance_in_range(laser, -90, 90, num);
    int num1 = num;
    if (aa > p) // 如果最小距离大于阈值p
    {
        xconpulsive = 0; // x方向的斥力设为0
        yconpulsive = 0; // y方向的斥力设为0
        conpulsive = 0;  // 总斥力设为0
    }
    else // 如果最小距离小于等于阈值p
    {
        if (aa > (p / 2)) // 如果最小距离大于阈值p的一半
        {
            conpulsive = c * ((1 / aa) - (1 / p)) * (1 / (aa * aa));   // 计算斥力大小
            conangle = laser.angle_min + num1 * laser.angle_increment; // 计算斥力角度
            if (conangle > PI)                                         // 如果角度大于π
            {
                conangle -= 2 * PI; // 将角度减去2π
            }
            else if (conangle < -PI) // 如果角度小于-π
            {
                conangle += 2 * PI; // 将角度加上2π
            }
            xconpulsive = -conpulsive * cos(conangle); // 计算x方向的斥力分量
            yconpulsive = -conpulsive * sin(conangle); // 计算y方向的斥力分量
        }
        if (aa > 0.6 && aa < (p / 2)) // 如果最小距离大于0.6且小于阈值p的一半
        {
            conpulsive = c * c * ((1 / aa) - (1 / p)) * (1 / (aa * aa)); // 计算斥力大小
            conangle = laser.angle_min + num1 * laser.angle_increment;   // 计算斥力角度
            if (conangle > PI)                                           // 如果角度大于π
            {
                conangle -= 2 * PI; // 将角度减去2π
            }
            else if (conangle < -PI) // 如果角度小于-π
            {
                conangle += 2 * PI; // 将角度加上2π
            }
            xconpulsive = -conpulsive * cos(conangle); // 计算x方向的斥力分量
            yconpulsive = -conpulsive * sin(conangle); // 计算y方向的斥力分量
        }
    }

    // 计算合力(引力与斥力的合力)激光雷达可避障；
    xsum = xattractive + xconpulsive;
    ysum = yattractive + yconpulsive;
    angle = atan2(ysum, xsum);
    Fsum = xsum / cos(angle);
    Fsum = limit(Fsum, 0, max_speed);
    newspeed = Fsum;
    newturnrate = angle;
    newturnrate = limit(newturnrate, -max_turning_speed_rad, max_turning_speed_rad);
    // 计算合力(引力的合力)激光雷达不可避障；
    xsum_by_k = xattractive;
    ysum_by_k = yattractive;
    angle_by_k = atan2(ysum_by_k, xsum_by_k);
    Fsum_by_k = xsum_by_k / cos(angle_by_k);
    Fsum_by_k = limit(Fsum_by_k, 0, max_speed);
    newspeed_by_k = Fsum_by_k;
    newturnrate_by_k = angle_by_k;
    newturnrate_by_k = limit(newturnrate_by_k, -max_turning_speed_rad, max_turning_speed_rad);

    if (sqrt((x_goal - x) * (x_goal - x) + (y_goal - y) * (y_goal - y)) < 0.3) //||(status_slow==0&&status_stop==0))
    {
        cmd_vel.linear.x = 0.0;
        cmd_vel.linear.y = 0.0;
        cmd_vel.linear.z = 0.0;
        cmd_vel.angular.x = 0.0;
        cmd_vel.angular.y = 0.0;
        cmd_vel.angular.z = 0.0;
    }
    else if (sqrt((x_goal - x) * (x_goal - x) + (y_goal - y) * (y_goal - y)) >= 0.3 && sqrt((x_goal - x) * (x_goal - x) + (y_goal - y) * (y_goal - y)) < 2.8)
    {
        cmd_vel.linear.x = newspeed;
        cmd_vel.linear.y = 0.0;
        cmd_vel.linear.z = 0.0;
        cmd_vel.angular.x = 0.0;
        cmd_vel.angular.y = 0.0;
        cmd_vel.angular.z = newturnrate;
    }
    else
    {
        cmd_vel.linear.x = newspeed_by_k;
        cmd_vel.linear.y = 0.0;
        cmd_vel.linear.z = 0.0;
        cmd_vel.angular.x = 0.0;
        cmd_vel.angular.y = 0.0;
        cmd_vel.angular.z = newturnrate_by_k;
    }
    cmd_vel_pub.publish(cmd_vel);
    ROS_INFO("当前线速度为:%.3lf ; 角速度为:%.3lf", cmd_vel.linear.x, cmd_vel.angular.z)
}

bool checkpose(robot_msgs::nav_goal::Request &req,
               robot_msgs::nav_goal::Response &res)
{
    a = req.x;
    b = req.y;
    // 将角度转换为弧度
    double reqalpha = req.th / 180 * PI;
    // 如果弧度大于π，则将其减去2π并取负值
    if (reqalpha > PI)
    {
        reqalpha = reqalpha - 2 * PI;
        reqalpha = -reqalpha;
    }
    else
    {
        // 否则直接取负值
        reqalpha = -reqalpha;
    }
    // 将处理后的弧度值赋给reqalpha_by
    reqalpha_by = reqalpha;

    ros::Rate rate(30);
    // 距离大于0.3开始进行障碍物检测和避障
    while (sqrt((a - x) * (a - x) + (b - y) * (b - y)) > 0.3)
    {
        ROS_INFO("th : %f distance: %f", reqalpha, sqrt((a - x) * (a - x) + (b - y) * (b - y)));
        zby_k(a, b, x, y);
        rate.sleep();
    }

    //
    while ((reqalpha - alpha) > 0.175 || (reqalpha - alpha) < -0.175) //
    {
        if (reqalpha_by > PI / 2 || reqalpha_by < -PI / 2)
        {
            if (alpha_by < 0)
            {
                alpha_by = alpha_by + 2 * PI;
            }
            else
            {
                alpha_by = alpha_by;
            }

            if (reqalpha_by < 0)
            {
                reqalpha_by = reqalpha_by + 2 * PI;
            }
            else
            {
                reqalpha_by = reqalpha_by;
            }
        }
        else
        {
            alpha_by = alpha_by + PI;
            reqalpha_by = reqalpha_by + PI;
        }

        // 设置cmd_vel的速度为0
        cmd_vel.linear.x = 0.0;
        cmd_vel.linear.y = 0.0;
        cmd_vel.linear.z = 0.0;
        cmd_vel.angular.x = 0.0;
        cmd_vel.angular.y = 0.0;
        // 计算新的转向速率newturnrate_by
        newturnrate_by = (reqalpha_by - alpha_by) * 1.7;
        // 限制newturnrate_by的范围在-max_turning_speed_rad到max_turning_speed_rad之间
        newturnrate_by = limit(newturnrate_by, -max_turning_speed_rad, max_turning_speed_rad);
        // 设置cmd_vel的角速度为newturnrate_by
        cmd_vel.angular.z = newturnrate_by;
        // 发布cmd_vel消息
        cmd_vel_pub.publish(cmd_vel);
    }

    cmd_vel.linear.x = 0.0;
    cmd_vel.linear.y = 0.0;
    cmd_vel.linear.z = 0.0;
    cmd_vel.angular.x = 0.0;
    cmd_vel.angular.y = 0.0;
    cmd_vel.angular.z = 0.0;
    cmd_vel_pub.publish(cmd_vel);
    res.success = 1;
    ROS_INFO("*******END-SUCCEED********");
    return 1;
}

int main(int argc, char *argv[])
{
    setlocale(LC_ALL, "");
    ros::init(argc, argv, "robot_artificial");

    ros::NodeHandle n;
    ros::Subscriber lidar_sub = n.subscribe("scan", 1, autonomous_behave);
    ros::Subscriber acml_sub = nh.subscribe<robot_msgs::dgps>("ZGPS", 1, callback);

    ros::ServiceServer service = nh.advertiseService("artificial1", checkpose);

    // publish object -> vel_pub
    cmd_vel_pub = n.advertise<geometry_msgs::Twist>("cmd_vel", 1);

    // 启动一个异步事件循环
    // 通常在ROS节点的主函数中使用，以确保节点能够持续运行并处理回调函数，直到ROS系统关闭
    // 创建了一个名为spinner的异步事件循环对象，参数3表示该事件循环可以同时处理的最大回调数
    ros::AsyncSpinner spinner(3);
    spinner.start();        // 启动事件循环
    ros::waitForShutdown(); // 使程序阻塞，直到ROS被关闭或者收到终止信号

    return 0;
}