#include <string>                     //字符串容器包
#include <vector>                     //向量容器包
#include <sstream>                    //将数据存入缓存区或从中读取的包
#include <cmath>                      //数学基础公式包
#include <cstdlib>                    //string转化为double包
#include <iomanip>                    //保留有效小数包
#include <ros/ros.h>                  //ROS包
#include <serial/serial.h>            //ROS已经内置了的串口包
#include <tf/transform_broadcaster.h> //tf坐标转换包
#include <robot_msgs/dgps.h>          //自定义话题数据包
#include <iostream>

#include "nav_msgs/Odometry.h"
#include "tf/tf.h"
#include "geometry_msgs/Twist.h"

#define PI 3.1415
#define SULUTION_STATE(str1, str2) printf("%s error => %s\n", str1, str2)
#define ERROR_DISTANCE 0.1

using namespace std;

serial::Serial ser_by;
double pose[4] = {0};

double  x, y, z;
double roll, pitch, yaw;

struct Result
{
    double by_pose0;
    double by_pose1;
    double by_r;
    double sin_th_q1;
    double cos_th_q1;
    double sin_th;
    double cos_th;
    double bbyyy;
};

void analysis0(std::string s)
{
    std::vector<std::string> v;
    std::string::size_type pos1, pos2;
    pos2 = s.find(",");
    pos1 = 0;

    while (std::string::npos != pos2)
    {
        v.push_back(s.substr(pos1, pos2 - pos1));
        pos1 = pos2 + 1;
        pos2 = s.find(",", pos1);
    }

    if (pos1 != s.length())
        v.push_back(s.substr(pos1));

    // if (v.max_size() >= 9 && v[2] == "5")
    if (v.max_size() >= 9)
    {
        if (v[4] != "")
            pose[0] = std::atof(v[4].c_str());
        else
            SULUTION_STATE("$GPNTR", "[X] don't have data");
        if (v[5] != "")
            pose[1] = std::atof(v[5].c_str());
        else
            SULUTION_STATE("$GPNTR", "[Y] don't have data");
        if (v[6] != "")
            pose[2] = std::atof(v[6].c_str());
        else
            SULUTION_STATE("$GPNTR", "[Z] don't have data");
        cout << "pos012 : " << pose[0] << pose[1] << pose[2] << endl;
    }
    else if (v[2] == "1")
        SULUTION_STATE("$GPNTR", "Insufficient observational data...");
    else if (v[2] == "2")
        SULUTION_STATE("$GPNTR", "Unable to convergence...");
    else if (v[2] == "4")
        SULUTION_STATE("$GPNTR", "The trace of the covariance matrix is >1000m...");
    else if (v[2] == "13")
        SULUTION_STATE("$GPNTR", "In the base station state, the residual error is large and the positioning result is not credible...");
    else if (v[2] == "19")
        SULUTION_STATE("$GPNTR", "The param [fix] is config error...");
    else if (v[2] == "20")
        SULUTION_STATE("$GPNTR", "The location type does not have the correct authorization...");
    else
        SULUTION_STATE("$GPNTR", "Error code is...");
}

Result coordinate_deal(double x, double y, double th)
{
    Result ret;
    double adjust_angle = th;
    double by_pose_x, by_pose_y;
    by_pose_x = x + sin(adjust_angle) * ERROR_DISTANCE;
    by_pose_y = y + cos(adjust_angle) * ERROR_DISTANCE;
    ret.by_pose0 = by_pose_y;
    ret.by_pose1 = by_pose_x;
    ret.by_r = th;
    ret.sin_th_q1 = 0;
    ret.cos_th_q1 = 0;
    ret.sin_th = 0;
    ret.cos_th = 0;
    ret.bbyyy = 0;
    return ret;
}

void analysis1(std::string s)
{
    std::vector<std::string> v;
    std::string::size_type pos1, pos2;
    pos2 = s.find(",");
    pos1 = 0; // 初始下标

    while (std::string::npos != pos2)
    {
        v.push_back(s.substr(pos1, pos2 - pos1));
        pos1 = pos2 + 1;
        pos2 = s.find(",", pos1);
    }

    if (pos1 != s.length())
        v.push_back(s.substr(pos1));

    if (v.max_size() >= 3)
    {
        if (v[1] != "")
            pose[3] = std::atof(v[1].c_str());
        double bby = pose[3];
        cout << "gps_pose3:" << pose[3] << endl;
        if (bby > 90)
        {
            bby = bby - 90;
        }
        else
        {
            bby = bby + 270;
        }

        pose[3] = bby;
        cout << "pose3 : " << pose[3] << endl;
    }
    else
        SULUTION_STATE("$GNHDT", "Navigation Angle has some problems...");
}

// odomcallback
void odomCallback(const nav_msgs::Odometry::ConstPtr &msg)
{
    
    x = msg->pose.pose.position.x;
    y = msg->pose.pose.position.y;
    z = msg->pose.pose.position.z;

    ROS_INFO("Position: x=%f, y=%fpos, z=%f",  x, y, z);

   // pose[0] = x;
   // pose[1] = y;
    //pose[2] = 0;

    tf::Quaternion quaternion(
        msg->pose.pose.orientation.x,
        msg->pose.pose.orientation.y,
        msg->pose.pose.orientation.z,
        msg->pose.pose.orientation.w);

    double roll, pitch, yaw;
    tf::Matrix3x3(quaternion).getRPY(roll, pitch, yaw); // quaternion change to euler-angles
    
    yaw = yaw * 180 / M_PI;

    ROS_INFO("roll = %.0f, pitch = %.0f, yaw = %.0f", roll, pitch, yaw);
    //pose[3] = yaw;

}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "robot_gps");
    // 声明节点句柄
    ros::NodeHandle n("~");
    ros::NodeHandle nh;
    

    ros::Subscriber odom_sub = nh.subscribe<nav_msgs::Odometry>("odom", 10, odomCallback);

    // 注册Publisher到话题GPS
    ros::Publisher dgps_pub = nh.advertise<robot_msgs::dgps>("ZGPS", 1000);
    try
    {
        string port_param = "";
        n.param<string>("ser_by", port_param, "/dev/ttyUSB1");
        ser_by.setPort(port_param.c_str());                        // 串口设置
        ser_by.setBaudrate(115200);                                // 波特率设置
        serial::Timeout to = serial::Timeout::simpleTimeout(1000); // 串口访问延迟设置
        ser_by.setTimeout(to);
        ser_by.open(); // 打开串口
    }
    catch (serial::IOException &e)
    {
        ROS_ERROR_STREAM("Unable to open Serial Port !");
        return -1;
    }

    // 判断串口是否打开成功
    if (ser_by.isOpen())
    {
        ROS_INFO_STREAM("Serial Port initialized");
    }
    else
    {
        return -1;
    }

    ros::Rate loop_rate(20); // 设置话题发布延迟
    while (ros::ok())
    {
        // 判断是否通讯成功
        if (ser_by.available())
        {
            std::string strRece[2] = {"", ""};

            ROS_INFO_STREAM("Reading from serial port\n");
            int n = 0;
            n = ser_by.readline(strRece[0], 65536, "\n");
            std::cout << "size is" << n << "\n";
            n = ser_by.readline(strRece[1], 65536, "\n");
            std::cout << "size is" << n << "\n";
            ser_by.flushInput();
            std::cout << "strRece:" << strRece[0] << ',' << strRece[1] << "\n";

            if (strRece[0].size() < strRece[1].size())
            {
                std::string t;
                t = strRece[0];
                strRece[0]= strRece[1];
                strRece[1] =t ;
            }
            std::string gstart[2]={"$GPNTR","$GNHDT"};
            // std::string gstart0 = "$GPNTR";
            // std::string gstart1 = "$GNHDT";
            std::string gend = "\r\n";
            int i = 0, start = -1, end = -1, m_mode = 0;

            for (int i = 0; i < 2; i++)
            {
                start = strRece[i].find(gstart[i]);
                m_mode += 1;

                if (m_mode == 1 && start == -1)
                {
                    cout << " Can't find GPNTR : " << i << endl;
                    break;

                    // start = strRece[i].find(gstart[i]);
                    // m_mode = 2;
                    // if (start == -1)
                    // {
                    //     cout << " Can't find GNHDT : " << i << endl;
                    //     continue;
                    // }
                }
                
                 if (m_mode == 2  && start == -1)
                {
                    cout << " Can't find GNHDT : " << i << endl;
                    continue;
                }

                {
                    end = strRece[i].find(gend);
                    if (end == -1)
                    {
                        cout << " Can't find end : " << i << endl;
                        continue;
                    }
                    else
                    {
                        cout << "mode : " << m_mode << endl;
                        if (m_mode == 1)
                            analysis0(strRece[i]);
                        else if (m_mode == 2)
                            analysis1(strRece[i]);
                        else
                            continue;
                    }
                }
            }
            Result res;

            robot_msgs::dgps gps; // 设置gps话题数据

            double by_pose20;
            double by_pose21;
            double by_rrr, sin_th_q1, cos_th_q1, sin_th, cos_th, bbyyy;

            res = coordinate_deal(pose[1], pose[0], pose[3]);

            by_pose20 = res.by_pose0;
            by_pose21 = -res.by_pose1;
            by_rrr = res.by_r;
            sin_th_q1 = res.sin_th_q1;
            cos_th_q1 = res.cos_th_q1;
            sin_th = res.sin_th;
            cos_th = res.cos_th;
            bbyyy = res.bbyyy;

            ROS_INFO("by_pose20: %f", by_pose20);
            ROS_INFO("by_pose21: %f", by_pose21);

            gps.x = by_pose20;
            gps.y = by_pose21;
            gps.z = 0;
            gps.roll = 0;
            gps.pitch = 0;
            gps.yaw = by_rrr;
            gps.by_pose0 = by_pose20;
            gps.by_pose1 = by_pose21;
            gps.sin_th_q1 = sin_th_q1;
            gps.cos_th_q1 = cos_th_q1;
            gps.sin_th = sin_th;
            gps.cos_th = cos_th;
            gps.bbyyy = bbyyy;

            //获取odm 数据替换gps 数据
            //odom 传递的数据类型是什么
            ROS_INFO("odom: %f", x);

            ros::spinOnce();
            gps.x = x;
            gps.y = y;
            gps.yaw = yaw;

            dgps_pub.publish(gps); // 发布话题
            cout << res.by_pose0 << "\t" << res.by_pose1 << "\n";
        }
        loop_rate.sleep(); // 等待延时
    }
    return 0;
}
