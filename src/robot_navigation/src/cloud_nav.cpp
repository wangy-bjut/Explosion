#include <ros/ros.h>
#include <iostream>
#include <robot_msgs/camera.h>
#include <robot_msgs/PtzPreset.h>

using namespace std;


class Cloud_Planner
{
private:
    bool planner_callback(robot_msgs::PtzPreset::Request &req, robot_msgs::PtzPreset::Response &res);
    void sub_callback(const robot_msgs::camera::ConstPtr &camera);
    ros::Publisher cloudcontrol_pub;
    ros::Subscriber cloudpose_sub;
    ros::ServiceServer planner_service;

    robot_msgs::cloud_angletims cloudpose;
    robot_msgs::cloud_control cloudcontrol;
    ros::NodeHandle nh;

    double angular_percent;
public:
    Cloud_Planner();
    ~Cloud_Planner();
};

Cloud_Planner::Cloud_Planner()
{
    cloudpose.pitch = 0.0;
    cloudpose.yaw = 0.0;

    nh.param<double>("/get_points_joy/angular_percent", angular_percent, 30);
    planner_service = nh.advertiseService("cloud_terrace", &Cloud_Planner::planner_callback, this);
    cloudpose_sub = nh.subscribe<robot_msgs::camera>("cloud_info", 1, &Cloud_Planner::sub_callback, this);
    cloudcontrol_pub = nh.advertise<robot_msgs::cloud_control>("cloud_control", 1);  
}

Cloud_Planner::~Cloud_Planner()
{
}

bool Cloud_Planner::planner_callback(robot_msgs::PtzPreset::Request &req, robot_msgs::PtzPreset::Response &res)
{
    ros::Rate loop_rate(10);
    while ((abs(req.pitch - cloudpose.pitch) >= 0.1 || abs(req.yaw - cloudpose.yaw)  >= 0.1) && ros::ok())
    {
        if((req.pitch - cloudpose.pitch) > 0.2) cloudcontrol.direction = "down";
        else if((req.pitch - cloudpose.pitch) < -0.2) cloudcontrol.direction = "up";
        else if((req.yaw - cloudpose.yaw) > 0.2) cloudcontrol.direction = "left";
        else if((req.yaw - cloudpose.yaw) < -0.2) cloudcontrol.direction = "right";
        else cloudcontrol.direction = "stop";

        cloudcontrol.light = false;
        cloudcontrol.scrub = false;
        cloudcontrol.zero = false;
        cloudcontrol.angular_percent = angular_percent;
        cloudcontrol_pub.publish(cloudcontrol);
        loop_rate.sleep();
        if(cloudcontrol.direction == "stop")
        {
            res.result = true;
            return true;
        }
        else
            continue;
    }
    ROS_INFO("Finish...");
    res.result = true;
    return true;
}

void Cloud_Planner::sub_callback(const robot_msgs::camera::ConstPtr &camera)
{
    cloudpose.pitch = camera->angle.pitch;
    cloudpose.yaw = camera->angle.yaw;
}


int main(int argc, char **argv)
{
    ros::init(argc, argv, "cloud_planner");
    Cloud_Planner planner;
    ros::spin();
    return 0;
}
