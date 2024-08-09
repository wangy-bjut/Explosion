/*
 * @Description: 
 * @Author: chaohui_chen
 * @Date: 2022-09-30 17:23:55
 * @LastEditTime: 2022-11-07 18:06:10
 * @LastEditors: chaohui_chen
 */

#include<sensor_msgs/Joy.h>
#include<robot_msgs/setint16.h>
#include<robot_msgs/ackerman_control.h>
#include "boost/thread/thread.hpp"
#include<alarm_control.h>


struct JoyDatas
{
    float a_1, a_2;
    int b_1, b_3, b_4, b_10, b_11;
    bool btn_1, btn_3, btn_4, btn_10, btn_11;
    JoyDatas(): a_1(.0), a_2(.0), b_1(0), b_3(0), b_4(0), b_10(0), b_11(0),\
    btn_1(true), btn_3(true), btn_4(true), btn_10(true), btn_11(true)   {}
};


class CreatMapJoy
{
private:
    ros::NodeHandle n;
    ros::NodeHandle nh;
    ros::Publisher pub_power;
    ros::Subscriber sub_joy;
    boost::thread client_thread;
    boost::thread node_thread;


    int linear, angular, startup, timesave, buffersave, nosave, shut;
    double linear_max, angular_max;
    JoyDatas joydatas;
    int alarm_volume;
    ALARM_CONTROL *alarm_controler;

    void joycallback(const sensor_msgs::Joy::ConstPtr &Joy);
    void open_node();
    void ifshutdown();
    void savetype_client();
    void node_master();
    bool buttonPress(int b_x, bool &btn_x);
public:
    CreatMapJoy(/* args */);
    ~CreatMapJoy();
};

void CreatMapJoy::joycallback(const sensor_msgs::Joy::ConstPtr &Joy)
{
    robot_msgs::ackerman_control power;
    joydatas.a_1 = Joy->axes[linear];
    joydatas.a_2 = Joy->axes[angular];

    joydatas.b_1 = Joy->buttons[nosave];
    joydatas.b_3 = Joy->buttons[buffersave];
    joydatas.b_4 = Joy->buttons[timesave];
    joydatas.b_10 = Joy->buttons[shut];
    joydatas.b_11 = Joy->buttons[startup];

    power.speed = joydatas.a_1 * linear_max;
    power.turn = joydatas.a_2 * angular_max;
    pub_power.publish(power);
}

void CreatMapJoy::open_node()
{
    while(ros::ok())
        if(buttonPress(joydatas.b_11, joydatas.btn_11))
        {
            ROS_INFO("Try to start the mapping program !");
            alarm_controler->alarm_control(11, alarm_volume, 2);
            system("source devel/setup.bash");
            system("roslaunch lego_loam run.launch");
        }
}

void CreatMapJoy::ifshutdown()
{
    if(buttonPress(joydatas.b_10, joydatas.btn_10))
    {
        ROS_INFO("Try to shut the mapping program !");
        system("rosnode kill /camera_init_to_map \
                                                    /featureAssociation \
                                                    /imageProjection \
                                                    /mapOptmization \
                                                    /cloud_node \
                                                    /rviz \
                                                    /transformFusion \
                                                    /odom_to_map \
                                                    /rs_to_velodyne \
                                                    /rslidar_node\
                        ");
        alarm_controler->alarm_control(12, alarm_volume, 2);
    }
    else    {}
}

void CreatMapJoy::savetype_client()
{
    int data = -1;
    if(buttonPress(joydatas.b_4, joydatas.btn_4))
    {
        data = 1;
        ROS_INFO("The map saved type is: [time-pcd]");
        ros::param::set("/lego_loam/pcd_maptype", data);
    }
    else if(buttonPress(joydatas.b_1, joydatas.btn_1))
    {
        data = 0;
        ROS_INFO("The map saved type is: [no-pcd]");
        ros::param::set("/lego_loam/pcd_maptype", data);
    }
    else if(buttonPress(joydatas.b_3, joydatas.btn_3))
    {
        data = -1;
        ROS_INFO("The map saved type is: [buffer-pcd]");
        ros::param::set("/lego_loam/pcd_maptype", data);
    }
}

void CreatMapJoy::node_master()
{
    while(ros::ok())
    {
        ifshutdown();
        savetype_client();
    }
}

bool CreatMapJoy::buttonPress(int b_x, bool &btn_x)
{
    if(b_x && btn_x)
    {
        btn_x = false;
        return true;
    }
    else if(!b_x)
    {
        btn_x = true;
        return false;
    }
    else
        return false;
}

CreatMapJoy::CreatMapJoy(/* args */) : n("~"), linear(1), angular(2), startup(11), timesave(4), buffersave(3), nosave(0), shut(10)
{
    alarm_controler = new ALARM_CONTROL(nh);
    nh.param("/models_joy/alarm_volume", alarm_volume, 20);
    n.param<int>("axis_linear",linear,linear);
    n.param<int>("axis_angular",angular,angular);
    n.param<int>("btn_startup",startup,startup);
    n.param<int>("btn_timesave",timesave,timesave);
    n.param<int>("buffersave",buffersave,buffersave);
    n.param<int>("btn_nosave",nosave,nosave);
    n.param<int>("btn_shut",shut,shut);

    n.param<double>("linear_max", linear_max, 1);
    n.param<double>("angular_max", angular_max, 1);

    sub_joy = nh.subscribe<sensor_msgs::Joy>("creat_map_joy", 10, &CreatMapJoy::joycallback, this);
    pub_power = nh.advertise<robot_msgs::ackerman_control>("transform_joy",1);
    client_thread = boost::thread(boost::bind(&CreatMapJoy::open_node, this));
    node_thread = boost::thread(boost::bind(&CreatMapJoy::node_master, this));
}

CreatMapJoy::~CreatMapJoy()
{
    node_thread.join();
    client_thread.join();
    delete alarm_controler;
}


int main(int argc, char** argv)
{
    ros::init(argc, argv, "creat_map_node");
    CreatMapJoy creatmapjoy;
    ros::spin();
    return 0;
}