#include <ros/ros.h>    //ROS基本库
#include <robot_msgs/alarm_srv.h>
#include <iostream>

using namespace std;

class ALARM_CONTROL
{
private:
    ros::ServiceClient alarm_client;
    robot_msgs::alarm_srv alarm_srvs;
public:
    ALARM_CONTROL(ros::NodeHandle &nh);
    ~ALARM_CONTROL();
    void alarm_control(int name, int volume, int loop_mode);
    void alarm_control();
    void datas_init();
};

inline ALARM_CONTROL::ALARM_CONTROL(ros::NodeHandle &nh)
{
    alarm_client = nh.serviceClient<robot_msgs::alarm_srv>("alarm_service");
    datas_init();
}

ALARM_CONTROL::~ALARM_CONTROL()
{
    alarm_client.shutdown();
}

inline void ALARM_CONTROL::alarm_control(int name, int volume, int loop_mode)
{
    alarm_srvs.request.filename = name;
    alarm_srvs.request.loop_mode = loop_mode;
    alarm_srvs.request.volume = volume;
    alarm_client.call(alarm_srvs);
    datas_init();
}

inline void ALARM_CONTROL::alarm_control()
{
    alarm_srvs.request.loop_mode = 2;
    alarm_client.call(alarm_srvs);
    datas_init();
}

inline void ALARM_CONTROL::datas_init()
{
    alarm_srvs.request.filename = 0;
    alarm_srvs.request.fileorder = 0;
    alarm_srvs.request.loop_mode = 2;
    alarm_srvs.request.volume = 20;
}
