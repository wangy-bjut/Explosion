/*
 * @Description: 
 * @Author: chaohui_chen
 * @Date: 2022-09-30 17:23:55
 * @LastEditTime: 2022-11-07 18:06:10
 * @LastEditors: chaohui_chen
 */

#include<sensor_msgs/Joy.h>
#include<alarm_control.h>


struct ModelControl
{
    sensor_msgs::Joy::ConstPtr center_joy;
    sensor_msgs::Joy::ConstPtr get_points_joy;
    sensor_msgs::Joy::ConstPtr creat_map_joy;

    bool center, get_points, creat_map;
    ModelControl(): center_joy(NULL), get_points_joy(NULL), creat_map_joy(NULL),\
    center(true), get_points(true), creat_map(true) {}
};


class ModelsJoy
{
private:
    ModelControl joy_msg;
    ros::NodeHandle nh;
    ros::Publisher model1_pub;  //模式发布者1
    ros::Publisher model2_pub;  //模式发布者2
    ros::Publisher model3_pub;  //模式发布者3

    int alarm_volume;
    
    ros::Subscriber joy_sub;    //订阅者，订阅手柄数据

    ALARM_CONTROL *alarm_controler;

    void callBack(const sensor_msgs::Joy::ConstPtr& Joy);
public:
    ModelsJoy(/* args */);
    ~ModelsJoy();
};

ModelsJoy::ModelsJoy(/* args */)
{
    joy_sub = nh.subscribe<sensor_msgs::Joy>("joy", 10, &ModelsJoy::callBack, this);

    model1_pub = nh.advertise<sensor_msgs::Joy>("get_points_joy",10);
    model2_pub = nh.advertise<sensor_msgs::Joy>("center_joy",10);
    model3_pub = nh.advertise<sensor_msgs::Joy>("creat_map_joy",10);

    nh.param("/models_joy/alarm_volume", alarm_volume, 20);

    alarm_controler = new ALARM_CONTROL(nh);
}

void ModelsJoy::callBack(const sensor_msgs::Joy::ConstPtr &Joy)
{
    if(Joy->axes.size() == 8 && Joy->buttons.size() == 11)
    {
        joy_msg.get_points_joy = Joy;
        model1_pub.publish(*joy_msg.get_points_joy);
        if (joy_msg.get_points)
        {
            ROS_WARN("Switch to the GET-POINTS mode !");
            joy_msg.get_points = false;
            joy_msg.center = true;
            joy_msg.creat_map = true;
            alarm_controler->alarm_control(1, alarm_volume, 2);
        }
    }
    else if(Joy->axes.size() == 6 && Joy->buttons.size() == 15)
    {
        joy_msg.center_joy = Joy;
        model2_pub.publish(*joy_msg.center_joy);
        if (joy_msg.center)
        {
            ROS_WARN("Switch to the CENTER mode !");
            joy_msg.get_points = true;
            joy_msg.center = false;
            joy_msg.creat_map = true;
            alarm_controler->alarm_control(5, alarm_volume, 2);
        }
    }
    else if(Joy->axes.size() == 8 && Joy->buttons.size() == 16)
    {
        joy_msg.creat_map_joy = Joy;
        model3_pub.publish(*joy_msg.creat_map_joy);
        if (joy_msg.creat_map)
        {
            ROS_WARN("Switch to the CREAT-MAP mode !");
            joy_msg.get_points = true;
            joy_msg.center = true;
            joy_msg.creat_map = false;
            alarm_controler->alarm_control(10, alarm_volume, 2);
        }
    }
    else{}
}

ModelsJoy::~ModelsJoy()
{
    delete alarm_controler;
}


int main(int argc, char**argv)
{
    ros::init(argc, argv, "models_control_node");
    ModelsJoy models_joy;
    ros::spin();
    return 0;
}
