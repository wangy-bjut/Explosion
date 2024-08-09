/*
 * @Description: 
 * @Author: chaohui_chen
 * @Date: 2022-09-30 17:23:55
 * @LastEditTime: 2022-11-07 18:06:10
 * @LastEditors: chaohui_chen
 */

#include <robot_msgs/ackerman_control.h>
#include <robot_msgs/camera.h>
#include <robot_msgs/dgps.h>
#include <yaml-cpp/yaml.h>
#include <sensor_msgs/Joy.h>
#include "boost/bind.hpp"
#include "boost/thread/thread.hpp"
#include "boost/thread/mutex.hpp" 
#include <fstream>
#include<alarm_control.h>

using namespace std;


struct JoyData
{
    double a_1, a_2, a_3, a_5, a_6, a_7;
    vector<int> b_x;
    vector<bool> flag_x;
    vector<bool> b_datas;
    JoyData(): b_x(vector<int>(9, 0)), flag_x(vector<bool>(9, true)), b_datas(vector<bool>(9, false)) {}
};


struct PointDatas
{
    double x, y, th, yaw, pitch;
    int setp;
    vector<int> fun;
    PointDatas():x(.0), y(.0), th(.0), yaw(.0), pitch(.0), setp(0)   {}
};


struct Pose
{
    double x;
    double y;
    double th;

    string x_nm;
    string y_nm;
    string th_nm;
    Pose(): x_nm("x"), y_nm("y"), th_nm("th") {}
};

struct Action
{
    int fun;
    int num;
    double parameter;

    string fun_nm;
    string num_nm;
    string parameter_nm;
    Action(): fun(0), num(1), parameter(5.0), fun_nm("fun"), num_nm("num"), parameter_nm("parameter0") {}
    Action(int fun_num): fun(fun_num), num(1), parameter(5.0), fun_nm("fun"), num_nm("num"), parameter_nm("parameter0") {}
};

struct Angle
{
    double yaw;
    double pitch;

    string yaw_nm;
    string pitch_nm;
    Angle(): yaw_nm("yaw"), pitch_nm("pitch") {}
};

struct Point
{
    string name;
    Pose pose;
    Angle angle;
    int setp;
    vector<Action> action;

    string name_nm;
    string pose_nm;
    string angle_nm;
    string setp_nm;
    vector<string> action_nm;

    Point(int point_num, PointDatas* datas);
};

Point::Point(int point_num, PointDatas* datas): name("'" + to_string(point_num) + "'"),\
name_nm("name"), pose_nm("pose"), angle_nm("angle"), setp_nm("setp")
{
    pose.x = datas->x;
    pose.y = datas->y;
    pose.th = datas->th;
    angle.yaw = datas->yaw;
    angle.pitch = datas->pitch;
    setp = datas->setp;
    action.clear();
    action_nm.clear();
    for(int i = 0; i < setp; i++)
    {
        Action actionx(datas->fun[i]);
        action.push_back(actionx);
        action_nm.push_back("action" + to_string(i));
    }
}

class PointSeter
{
public:
    vector<string> point_nm;
    vector<Point> point;
    PointSeter();
    bool push_back(int point_num, PointDatas* datas);
    bool close(string file_path);
    bool pop_back();
    bool clear();
    ~PointSeter();
};

PointSeter::PointSeter()
{
    for(int i = 0; i < point.size(); i++)
        point[i].action.clear();
    point.clear();
    point_nm.clear();
}

bool PointSeter::push_back(int point_num, PointDatas* datas)
{
    Point pointx(point_num, datas);
    point.push_back(pointx);
    point_nm.push_back("point" + to_string(point_num));
    ROS_WARN("Target point [%s] writes successfully !", ("point" + to_string(point_num)).c_str());
    return true;
}

bool PointSeter::close(string file_path)
{
    
    ofstream fout(file_path.c_str());
    for(int i = 0; i < point.size(); i++)
    {
        YAML::Node config;
        config[point_nm[i].c_str()][point[i].name_nm.c_str()] = point[i].name;
        config[point_nm[i].c_str()][point[i].pose_nm.c_str()][point[i].pose.x_nm.c_str()] = point[i].pose.x;
        config[point_nm[i].c_str()][point[i].pose_nm.c_str()][point[i].pose.y_nm.c_str()] = point[i].pose.y;
        config[point_nm[i].c_str()][point[i].pose_nm.c_str()][point[i].pose.th_nm.c_str()] = point[i].pose.th;
        config[point_nm[i].c_str()][point[i].angle_nm.c_str()][point[i].angle.yaw_nm.c_str()] = point[i].angle.yaw;
        config[point_nm[i].c_str()][point[i].angle_nm.c_str()][point[i].angle.pitch_nm.c_str()] = point[i].angle.pitch;
        config[point_nm[i].c_str()][point[i].setp_nm.c_str()] = point[i].setp;
        for(int j = 0; j < point[i].setp; j++)
        {
            config[point_nm[i].c_str()][point[i].action_nm[j].c_str()][point[i].action[j].fun_nm.c_str()] = point[i].action[j].fun;
            config[point_nm[i].c_str()][point[i].action_nm[j].c_str()][point[i].action[j].num_nm.c_str()] = point[i].action[j].num;
            config[point_nm[i].c_str()][point[i].action_nm[j].c_str()][point[i].action[j].parameter_nm.c_str()] = point[i].action[j].parameter;
        }

        fout << config;
        fout << "\n" <<endl;
    }
    fout.close();
    ROS_WARN("The file saved successfully: %s !\nAnd it has %d points.", file_path.c_str(), point.size());
    return true;
}

bool PointSeter::pop_back()
{
    if(point.size() && point_nm.size())
    {
        point.pop_back();
        point_nm.pop_back();
        ROS_WARN("Successfully deleted: [%s] !", ("point" + to_string(point.size())).c_str());
    }
    else
        ROS_WARN("The point is empty !");
    return true;
}

bool PointSeter::clear()
{
    point_nm.clear();
    point.clear();
    return true;
}

PointSeter::~PointSeter()
{
    for(int i = 0; i < point.size(); i++)
        point[i].action.clear();
    point.clear();
    point_nm.clear();
}

//手柄类
class TeleopJoy
{
public:
    TeleopJoy();
    ~TeleopJoy();
private:
    //手柄话题数据订阅回调函数
    void joycallBack(const sensor_msgs::Joy::ConstPtr& joy);
    void cameracallBack(const robot_msgs::camera::ConstPtr& camera);
    void dgpscallBack(const robot_msgs::dgps::ConstPtr& dgps);
    void pubcallBack();
    void ros_init();
    bool buttonPress(int b_i);

    ros::NodeHandle n;  //命名空间/节点名下的ROS句柄
    ros::NodeHandle nh; //命名空间下的ROS句柄
    ros::Publisher pub_chasis; //发布者，发布速度数据
    ros::Publisher pub_cloud; //发布者，发布云台数据
    ros::Subscriber sub_joy, sub_pose, sub_angle;    //订阅者，订阅手柄数据
    boost::thread pub_button;

    ALARM_CONTROL* alarm_controler;

    robot_msgs::cloud_control cloud;
    int a_linear_x, a_angular, a_cloud_pitch, a_cloud_yaw, a_fun1, a_fun0;   //axes number
    int b_cloud_scrub, b_cloud_light, b_cloud_zero, b_openfile, b_record, b_clear, b_savefile, b_action1, b_action0;  //button number
    double f_velLinearMax, f_velAngularMAx, angular_percent; //最大线速度、角速度设置
    string file_path;
    
    PointDatas pointdatas;
    JoyData joydatas;
    PointSeter file_writer;
    bool flag;
    int point_num;
    int fun_max;
    int alarm_volume;
    bool alarm_flag;
};

//手柄构造函数
TeleopJoy::TeleopJoy():n("~"), a_angular(3), a_linear_x(1), a_cloud_pitch(6), a_cloud_yaw(7), a_fun1(2), a_fun0(5),\
b_cloud_scrub(3), b_cloud_light(2), b_cloud_zero(1), b_openfile(0), b_record(7), b_clear(6), b_savefile(8), b_action1(4), b_action0(5)
{
    alarm_controler = new ALARM_CONTROL(nh);
    n.param<int>("axis_linear_x",a_linear_x,a_linear_x);
    n.param<int>("axis_angular",a_angular,a_angular);
    n.param<int>("axis_cloud_pitch",a_cloud_pitch,a_cloud_pitch);
    n.param<int>("axis_cloud_yaw",a_cloud_yaw,a_cloud_yaw);
    n.param<int>("axis_fun1",a_fun1,a_fun1);
    n.param<int>("axis_fun0",a_fun0,a_fun0);

    n.param<int>("btn_cloud_scrub",b_cloud_scrub,b_cloud_scrub);
    n.param<int>("btn_cloud_light",b_cloud_light,b_cloud_light);
    n.param<int>("btn_cloud_zero",b_cloud_zero,b_cloud_zero);
    n.param<int>("btn_openfile",b_openfile,b_openfile);
    n.param<int>("btn_record",b_record,b_record);
    n.param<int>("btn_clear",b_clear,b_clear);
    n.param<int>("btn_savefile",b_savefile,b_savefile);
    n.param<int>("btn_action1",b_action1,b_action1);
    n.param<int>("btn_action0",b_action0,b_action0);
    
    n.param<int>("fun_max",fun_max,5);
    n.param<double>("linear_max", f_velLinearMax, 1);
    n.param<double>("angular_max", f_velAngularMAx, 1);
    n.param<double>("angular_percent", angular_percent, 30);
    nh.param("/models_joy/alarm_volume", alarm_volume, 20);
    n.param<string>("file_path", file_path, "/home/robot/Explosion_proof_robot/src/robot_center/param/point.yaml");
    flag = true;
    point_num = 0;
    alarm_flag = true;
    ros_init();
    pointdatas.fun = vector<int>(1000, -1);
    pub_chasis = nh.advertise<robot_msgs::ackerman_control>("transform_joy",1);
    pub_cloud = nh.advertise<robot_msgs::cloud_control>("cloud_control", 1);
    pub_button = boost::thread(boost::bind(&TeleopJoy::pubcallBack, this));
    sub_joy = nh.subscribe<sensor_msgs::Joy>("get_points_joy", 10, &TeleopJoy::joycallBack, this);
    sub_pose = nh.subscribe<robot_msgs::dgps>("ZGPS", 1, &TeleopJoy::dgpscallBack, this);
    sub_angle = nh.subscribe<robot_msgs::camera>("cloud_info", 1, &TeleopJoy::cameracallBack, this);
}

TeleopJoy::~TeleopJoy()
{
    delete alarm_controler;
}

void TeleopJoy::joycallBack(const sensor_msgs::Joy::ConstPtr &joy)
{
    joydatas.a_1 = joy->axes[a_linear_x];
    joydatas.a_3 = joy->axes[a_angular];
    joydatas.a_6 = joy->axes[a_cloud_pitch];
    joydatas.a_7 = joy->axes[a_cloud_yaw];
    joydatas.a_2 = joy->axes[a_fun1];
    joydatas.a_5 = joy->axes[a_fun0];


    joydatas.b_x[3] = joy->buttons[b_cloud_scrub];
    joydatas.b_x[2] = joy->buttons[b_cloud_light];
    joydatas.b_x[1] = joy->buttons[b_cloud_zero];
    joydatas.b_x[0] = joy->buttons[b_openfile];
    joydatas.b_x[7] = joy->buttons[b_record];
    joydatas.b_x[6] = joy->buttons[b_clear];
    joydatas.b_x[8] = joy->buttons[b_savefile];
    joydatas.b_x[4] = joy->buttons[b_action1];
    joydatas.b_x[5] = joy->buttons[b_action0];

    robot_msgs::ackerman_control vel;
    vel.speed = joydatas.a_1 * f_velLinearMax;
    vel.turn = joydatas.a_3 * f_velAngularMAx;
    pub_chasis.publish(vel);
}

void TeleopJoy::cameracallBack(const robot_msgs::camera::ConstPtr &camera)
{
    pointdatas.pitch = camera->angle.pitch;
    pointdatas.yaw = camera->angle.yaw;

    if(joydatas.a_6 == 1)
        cloud.direction = "left";
    else if(joydatas.a_6 == -1)
        cloud.direction = "right";
    else if(joydatas.a_7 == 1)
        cloud.direction = "up";
    else if(joydatas.a_7 == -1)
        cloud.direction = "down";
    else
        cloud.direction = "stop";
    if(!joydatas.b_datas[0] && joydatas.b_x[4] && cloud.angular_percent < 100)
        cloud.angular_percent++;
    if(!joydatas.b_datas[0] && joydatas.b_x[5] && cloud.angular_percent > 0)
        cloud.angular_percent--;
}

void TeleopJoy::dgpscallBack(const robot_msgs::dgps::ConstPtr &dgps)
{
    pointdatas.x = dgps->x;
    pointdatas.y = dgps->y;
    pointdatas.th = dgps->yaw;
}

void TeleopJoy::pubcallBack()
{
    ros::Rate loop(10); //设置循环发布延时
    while(ros::ok())
    {
        if(buttonPress(3))
            joydatas.b_datas[3] = !joydatas.b_datas[3];
        if(buttonPress(2))
            joydatas.b_datas[2] = !joydatas.b_datas[2];
        if(buttonPress(1))
            joydatas.b_datas[1] = !joydatas.b_datas[1];

        cloud.zero = joydatas.b_datas[3];
        cloud.light = joydatas.b_datas[2];
        cloud.scrub = joydatas.b_datas[1];
        pub_cloud.publish(cloud);

        if(buttonPress(0))
            joydatas.b_datas[0] = true;
        if(buttonPress(7))
            joydatas.b_datas[7] = true;
        if(buttonPress(6))
            joydatas.b_datas[6] = true;
        if(buttonPress(8))
            joydatas.b_datas[8] = true;
        if(buttonPress(4))
            joydatas.b_datas[4] = true;
        if(buttonPress(5))
            joydatas.b_datas[5] = true;

        
        if(joydatas.b_datas[0])
        {
            if(alarm_flag)
            {
                alarm_controler->alarm_control(2, alarm_volume, 2);
                ROS_WARN("Start recording points !");
                alarm_flag = false;
            }
            else {}
            cloud.angular_percent = angular_percent;
            if(joydatas.b_datas[4])
            {
                pointdatas.setp++;
                bool flag_2, flag_5;
                flag_2 = flag_5 = true;
                while (joydatas.b_x[4])
                {
                    if(joydatas.a_2 == -1 && flag_2)
                    {
                        if(pointdatas.fun[pointdatas.setp - 1] < fun_max)
                            ROS_WARN("Fun is %d", ++pointdatas.fun[pointdatas.setp - 1]);
                        else
                            ROS_WARN("Fun is max !");
                        flag_2 = false;
                    }
                    else if(joydatas.a_2 != -1)    flag_2 = true;
                    else    {}
                    if(joydatas.a_5 == -1 && flag_5)
                    {
                        if(pointdatas.fun[pointdatas.setp - 1] > 0)
                            ROS_WARN("Fun is %d", --pointdatas.fun[pointdatas.setp - 1]);
                        else
                            ROS_WARN("Fun is 0 !");
                        flag_5 = false;
                    }
                    else if(joydatas.a_5 != -1)    flag_5 = true;
                    else    {}
                }
                joydatas.b_datas[4] = false;
                ROS_WARN("Successful addition of action: [%s]", ("action" + to_string(pointdatas.setp - 1)).c_str());
            }
            if(joydatas.b_datas[5] && pointdatas.setp)
            {
                pointdatas.setp--;
                joydatas.b_datas[5] = false;
                pointdatas.fun[pointdatas.setp] = -1;
                ROS_WARN("Successful delete of action: [%s]", ("action" + to_string(pointdatas.setp)).c_str());
            }
            else
                joydatas.b_datas[5] = false;
            if(joydatas.b_datas[7])
            {
                file_writer.push_back(point_num++, &pointdatas);
                pointdatas.setp = 0;
                pointdatas.fun = vector<int>(1000, -1);
                joydatas.b_datas[7] = false;
                alarm_controler->alarm_control(3, alarm_volume, 2);
            }
            if(joydatas.b_datas[6])
            {
                file_writer.pop_back();
                pointdatas.setp = 0;
                pointdatas.fun = vector<int>(1000, -1);
                joydatas.b_datas[6] = false;
                if(point_num > 0)
                {
                    alarm_controler->alarm_control(17, alarm_volume, 2);
                    point_num--;
                }
                else    {};
            }
            if(joydatas.b_datas[8])
            {
                file_writer.close(file_path);
                joydatas.b_datas[0] = false;
                alarm_flag = true;
                file_writer.clear();
                point_num = 0;
                pointdatas.setp = 0;
                pointdatas.fun = vector<int>(1000, -1);
                alarm_controler->alarm_control(4, alarm_volume, 2);
            }
        }
        else
        {
            alarm_flag = true;
            joydatas.b_datas[4] = false;
            joydatas.b_datas[5] = false;
            joydatas.b_datas[7] = false;
            joydatas.b_datas[6] = false;
            joydatas.b_datas[8] = false;
        }
        loop.sleep();
    }
}

void TeleopJoy::ros_init()
{
    cloud.direction = "stop";
    cloud.light = false;
    cloud.scrub = false;
    cloud.zero = false;
    cloud.angular_percent = angular_percent;
}

bool TeleopJoy::buttonPress(int b_i)
{
    if(joydatas.b_x[b_i] && joydatas.flag_x[b_i])
    {
        joydatas.flag_x[b_i] = false;
        return true;
    }
    else if(!joydatas.b_x[b_i])
    {
        joydatas.flag_x[b_i] = true;
        return false;
    }
    else
        return false;
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "set_points_node");
    TeleopJoy teleop_bobac;
    ros::spin();
    return 0;
}
