#include<sensor_msgs/Joy.h>
#include<robot_msgs/setint16.h>
#include "boost/thread/thread.hpp"
#include<alarm_control.h>


struct JoyDatas
{
    int b_4, b_5, b_6, b_7, b_8, b_9;
    JoyDatas(): b_4(0), b_5(0), b_6(0), b_7(0), b_8(0), b_9(0)  {}
};

class CenterJoy
{
private:
    ros::NodeHandle n;
    ros::NodeHandle nh;
    ros::ServiceClient action_client, suspend_client;
    ros::Subscriber sub_joy;

    JoyDatas joydatas;
    boost::thread client_thread;

    ALARM_CONTROL* alarm_controler;
    int begin1, begin0, path1, path0, action, toswitch;
    int begin_point, path;

    int alarm_volume;

    bool hover;

    void joycallback(const sensor_msgs::Joy::ConstPtr &Joy);
    void client_callback();
    bool center_client();
public:
    CenterJoy(/* args */);
    ~CenterJoy();
};

void CenterJoy::joycallback(const sensor_msgs::Joy::ConstPtr &Joy)
{
    joydatas.b_4 = Joy->buttons[begin1];
    joydatas.b_5 = Joy->buttons[begin0];
    joydatas.b_6 = Joy->buttons[path1];
    joydatas.b_7 = Joy->buttons[path0];
    joydatas.b_8 = Joy->buttons[action];
    joydatas.b_9 = Joy->buttons[toswitch];

    if(joydatas.b_6)
        ROS_INFO("Changing to %d th path !", ++path);
    if(joydatas.b_7)
        if(path > 0)
            ROS_INFO("Changing to %d th path !", --path);
        else
            ROS_INFO("Changing to %d th path !", path);
    
    if(joydatas.b_8)
    {
        robot_msgs::setint16 hover_client;
        hover_client.request.data = hover;
        nh.setParam("center/PATH", ("/Path" + std::to_string(path)).c_str());
        if(suspend_client.call(hover_client))
            ROS_INFO("Result: [%s]", hover_client.response.message.c_str());
        else
            ROS_INFO("Hover is not executed correctly !");
    }
}

bool CenterJoy::center_client()
{
    while (ros::ok())
    {
        if(joydatas.b_4)
            ROS_INFO("point is %d", ++begin_point);
        if(joydatas.b_5)
        {
            if(begin_point > 0)
                ROS_INFO("point is %d", --begin_point);
            else
                ROS_INFO("point is %d", begin_point);
        }
        if(joydatas.b_9)
        {
            alarm_controler->alarm_control(6, alarm_volume, 2);
            robot_msgs::setint16 actor;
            system("roslaunch robot_center robot_readpath.launch");
            ROS_INFO("center_server is beginning !");
            actor.request.data = begin_point;
            if(action_client.call(actor) && actor.response.success)
            {
                alarm_controler->alarm_control(9, alarm_volume, 2);
                ROS_INFO("This phase of the navigation is complete !\nAnd the result is [%s]", actor.response.message.c_str());
                return true;
            }
            else
            {
                ROS_WARN("This phase of the navigation is in the rough !\nAnd the result is [%s]", actor.response.message.c_str());
                return false;
            }
        }
    }
}

CenterJoy::CenterJoy(/* args */): begin1(4), begin0(5), path1(6), path0(7), action(8), toswitch(9), n("~")
{
    n.param<int>("begin1",begin1,begin1);
    n.param<int>("begin0",begin0,begin0);
    n.param<int>("path1",path1,path1);
    n.param<int>("path0",path0,path0);
    n.param<int>("action",action,action);
    n.param<int>("toswitch",toswitch,toswitch);
    nh.param("/models_joy/alarm_volume", alarm_volume, 20);

    alarm_controler = new ALARM_CONTROL(nh);
    hover = path = 0;

    action_client = nh.serviceClient<robot_msgs::setint16>("center_client");
    suspend_client = nh.serviceClient<robot_msgs::setint16>("center_suspend");
    sub_joy = nh.subscribe<sensor_msgs::Joy>("center_joy", 10, &CenterJoy::joycallback, this);

    client_thread = boost::thread(boost::bind(&CenterJoy::client_callback, this));
}

void CenterJoy::client_callback()
{
    while(ros::ok())
    {
        begin_point = 0;
        if(!center_client())    break;
    }
}

CenterJoy::~CenterJoy()
{
    client_thread.join();
    delete alarm_controler;
}


int main(int argc, char** argv)
{
    ros::init(argc, argv, "center_control_node");
    CenterJoy centerjoy;
    ros::spin();
    return 0;
}