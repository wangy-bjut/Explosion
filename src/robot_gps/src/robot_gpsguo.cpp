#include "ros/ros.h"
#include "nav_msgs/Odometry.h"
#include "tf/tf.h"
#include "geometry_msgs/Twist.h"
#include <string>
#include <vector>
#include <sstream>
#include <cmath>
#include <cstdlib>
#include <iomanip>
#include <serial/serial.h>
#include <tf/transform_broadcaster.h>
#include <robot_msgs/dgps.h>
#include <iostream>

#define PI 3.1415
double x, y, z;
 double roll, pitch, yaw;
 
void odomCallback(const nav_msgs::Odometry::ConstPtr &msg)
{
   
    x = msg->pose.pose.position.x;
    y = msg->pose.pose.position.y;
    z = msg->pose.pose.position.z;

    ROS_INFO("Position11: x=%f, y=%f, z=%f", x, y, z);

    tf::Quaternion quaternion(
        msg->pose.pose.orientation.x,
        msg->pose.pose.orientation.y,
        msg->pose.pose.orientation.z,
        msg->pose.pose.orientation.w);

    
    tf::Matrix3x3(quaternion).getRPY(roll, pitch, yaw); // quaternion change to euler-angles

    yaw = yaw * 180 / M_PI;

    ROS_INFO("roll = %.0f, pitch = %.0f, yaw = %.0f", roll, pitch, yaw);

}

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "robot_odom");
    ros::NodeHandle n("~");
    ros::NodeHandle nh;
    ros::Subscriber sub_camera;

    ros::Subscriber odom_sub = nh.subscribe("odom", 10, odomCallback);
    ros::Publisher dgps_pub = nh.advertise<robot_msgs::dgps>("ZGPS", 1000);

    robot_msgs::dgps gps; // 设置gps话题数据

    double by_pose0;
    double by_pose1;
    double sin_th_q1, cos_th_q1, sin_th, cos_th, bbyyy;

    gps.x = x;
    gps.y = y;
    gps.z = 0;
    gps.roll = 0;
    gps.pitch = 0;
    gps.yaw = yaw;
    gps.by_pose0 = 0;
    gps.by_pose1 = 0;
    gps.sin_th_q1 = 0;
    gps.cos_th_q1 = 0;
    gps.sin_th = 0;
    gps.cos_th = 0;
    gps.bbyyy = 0;
    dgps_pub.publish(gps);

    ros::spin();

    return 0;
}