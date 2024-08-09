#include<ros/ros.h>
#include<geometry_msgs/Twist.h>
#include<robot_msgs/ackerman_control.h>

#define L 0.975

class transducer
{
private:
    ros::NodeHandle n;
    ros::Subscriber sub;
    ros::Publisher pub;
    
public:
    transducer();
    ~transducer();
    void callback(const geometry_msgs::Twist &cmd_vel);
};

transducer::transducer()
{
    sub = n.subscribe("cmd_vel", 1, &transducer::callback, this);
    pub = n.advertise<robot_msgs::ackerman_control>("transform_joy", 1);
}

transducer::~transducer()
{
}

void transducer::callback(const geometry_msgs::Twist &cmd_vel)
{
    robot_msgs::ackerman_control tfer;
    tfer.speed = cmd_vel.linear.x;
    if(cmd_vel.linear.x != 0)
        tfer.turn = atan(L * cmd_vel.angular.z/cmd_vel.linear.x);
    else
        tfer.turn = 0;
    pub.publish(tfer);
}

int main(int argc, char ** argv)
{
    ros::init(argc, argv, "transducer");
    transducer transfrom;
    ros::spin();
    ros::shutdown();
    return 0;
}
