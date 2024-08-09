/*
 * @Description: 
 * @Author: chaohui_chen
 * @Date: 2022-09-30 17:23:55
 * @LastEditTime: 2022-11-07 18:06:10
 * @LastEditors: chaohui_chen
 */

#include<ros/ros.h>
#include<geometry_msgs/Twist.h>
#include<sensor_msgs/Joy.h>
#include<iostream>

using namespace std;

//手柄类
class TeleopJoy
{
public:
    TeleopJoy();
private:
    //手柄话题数据订阅回调函数
    void callBack(const sensor_msgs::Joy::ConstPtr& joy);
    ros::NodeHandle n;  //命名空间/节点名下的ROS句柄
    ros::NodeHandle nh; //命名空间下的ROS句柄
    ros::Publisher pub; //发布者，发布速度数据
    ros::Subscriber sub;    //订阅者，订阅手柄数据
    int i_velLinear_x, i_velLinear_y, i_velAngular; //axes number
    double f_velLinearMax, f_velAngularMAx; //最大线速度、角速度设置
};

//手柄构造函数
TeleopJoy::TeleopJoy():n("~")
{
    n.param<int>("axis_linear_x",i_velLinear_x,i_velLinear_x);
    n.param<int>("axis_linear_y",i_velLinear_y,i_velLinear_y);
    n.param<int>("axis_angular",i_velAngular,i_velAngular);
    n.param<double>("linear_max", f_velLinearMax, 1);
    n.param<double>("angular_max", f_velAngularMAx, 1);
    pub = nh.advertise<geometry_msgs::Twist>("cmd_vel",1);
    sub = nh.subscribe<sensor_msgs::Joy>("joy", 10, &TeleopJoy::callBack, this);
}

void TeleopJoy::callBack(const sensor_msgs::Joy::ConstPtr& joy)
{
    geometry_msgs::Twist vel;
    vel.angular.z = joy->axes[i_velAngular]*f_velAngularMAx;
    vel.linear.x = joy->axes[i_velLinear_x]*f_velLinearMax;
    vel.linear.y = joy->axes[i_velLinear_y]*f_velLinearMax;
    pub.publish(vel);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "teleopJoy");
    TeleopJoy teleop_bobac;
    ros::spin();
    return 0;
}
