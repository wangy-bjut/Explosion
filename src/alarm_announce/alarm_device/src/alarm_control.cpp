#include "alarm_control.h"
#include "robot_msgs/Integrator.h"

void integrator_callback(const robot_msgs::Integrator::ConstPtr &Integrator, ALARM_CONTROL* alarm, ros::NodeHandle* n);

int main(int argc, char** argv)
{
    ros::init(argc,argv,"alarm_control_node");  //初始化节点名
    ros::NodeHandle nh;
    ros::NodeHandle n("~");
    ALARM_CONTROL alarm(nh);

    ros::Subscriber Integrator = nh.subscribe<robot_msgs::Integrator>("Integrator", 10, boost::bind(&integrator_callback, _1, &alarm, &n));

    ros::spin();
    return 0;
}


void integrator_callback(const robot_msgs::Integrator::ConstPtr &Integrator, ALARM_CONTROL* alarm, ros::NodeHandle* n)
{
    int gas_limit, temp_limit;
    int alarm_volume;
    bool alarm_loop;

    n->param("gas_limit", gas_limit, 10);
    n->param("temp_limit", temp_limit, 60);
    n->param("alarm_volume", alarm_volume, 10);
    
    if(Integrator->gas.result >= gas_limit)
        alarm->alarm_control(14, alarm_volume, 2);
    if(Integrator->temp.result >= temp_limit)
        alarm->alarm_control(13, alarm_volume, 1);
    else
        alarm->alarm_control(0, alarm_volume, 2);
}
