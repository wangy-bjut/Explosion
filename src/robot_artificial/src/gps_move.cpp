#include "ros/ros.h"
#include <stdio.h>
#include <iostream>
#include <geometry_msgs/Twist.h>
#include <math.h>
#include <algorithm>
#include <robot_msgs/dgps.h>
#include <robot_msgs/nav_goal.h>
#include <eigen3/Eigen/Dense>
#include <robot_msgs/IoStatus.h>

using namespace std;
using namespace Eigen;

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

double newturnrate_by;

double max_turning_speed_rad = 1;

ros::Publisher cmd_vel_pub; // 全局变量
geometry_msgs::Twist cmd_vel;

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

void check_distance(double x_goal, double y_goal, double x0, double y0)
{
    double distance = sqrt((x_goal - x0) * (x_goal - x0) + (y_goal - y0) * (y_goal - y0));
    if (distance < 0.1)
    {
        cmd_vel.linear.x = 0.0;
        cmd_vel.linear.y = 0.0;
        cmd_vel.linear.z = 0.0;
        cmd_vel.angular.x = 0.0;
        cmd_vel.angular.y = 0.0;
        cmd_vel.angular.z = 0.0;
    }
    else if (distance >= 0.1 && distance < 1)
    {
        cmd_vel.linear.x = 0.2;
        cmd_vel.linear.y = 0.0;
        cmd_vel.linear.z = 0.0;
        cmd_vel.angular.x = 0.0;
        cmd_vel.angular.y = 0.0;
        cmd_vel.angular.z = (reqalpha_by - alpha_by);
    }
    else
    {
        cmd_vel.linear.x = 0.8;
        cmd_vel.linear.y = 0.0;
        cmd_vel.linear.z = 0.0;
        cmd_vel.angular.x = 0.0;
        cmd_vel.angular.y = 0.0;
        cmd_vel.angular.z = (reqalpha_by - alpha_by);
    }
    cmd_vel_pub.publish(cmd_vel);
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
    while (sqrt((a - x) * (a - x) + (b - y) * (b - y)) > 0.1)
    {
        ROS_INFO("theta: %f distance: %f", reqalpha, sqrt((a - x) * (a - x) + (b - y) * (b - y)));
        check_distance(a, b, x, y);
        rate.sleep();
    }

    while ((reqalpha - alpha) > 0.175 || (reqalpha - alpha) < -0.175)
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
    ros::Subscriber acml_sub = nh.subscribe<robot_msgs::dgps>("ZGPS", 1, callback);

    ros::ServiceServer service = nh.advertiseService("artificial1", checkpose);

    // publish object -> vel_pub
    cmd_vel_pub = n.advertise<geometry_msgs::Twist>("cmd_vel", 10);

    // 启动一个异步事件循环
    // 通常在ROS节点的主函数中使用，以确保节点能够持续运行并处理回调函数，直到ROS系统关闭
    // 创建了一个名为spinner的异步事件循环对象，参数3表示该事件循环可以同时处理的最大回调数
    ros::AsyncSpinner spinner(3);
    spinner.start();        // 启动事件循环
    ros::waitForShutdown(); // 使程序阻塞，直到ROS被关闭或者收到终止信号

    return 0;
}