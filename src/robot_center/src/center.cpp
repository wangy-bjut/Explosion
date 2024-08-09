#include <yaml-cpp/yaml.h>  //调用yaml文件执行参数服务器
#include <fstream>  //文件输入输出流
#include <sstream>  //数据缓存输入输出流
#include <cstdlib>
#include <stdio.h>  //c语言基本库
#include <stddef.h>
#include <time.h>   //时间库
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>
#include <dirent.h>
#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>

#include <robot_msgs/nav_goal.h>    //自定义目标点服务

#include "actionlib/server/simple_action_server.h"  //动作通讯机制服务
#include "robot_msgs/centerAction.h"    //自定义中心调度动作机制
#include "robot_msgs/setint16.h"    //自定义暂停中心调度(悬停)
#include "robot_msgs/Float64.h"     //自定义单精度服务
#include "robot_msgs/PtzPreset.h"   //自定义控制云台服务
#include "robot_msgs/recognition_scale.h"   //识别服务
#include "robot_msgs/Gas_alarm.h"   //气体报警装置
#include "robot_msgs/temp_detection.h"
#include "robot_msgs/Integrator.h"
#include "alarm_control.h"


// #define IMG_BASE_PATH "/home/hhy/Explosion_proof_robot/Pucture_datas/"

/***************************************************************************
//中心调度节点

//输入包括一个调用调度的action和暂停的service

***************************************************************************/

typedef actionlib::SimpleActionServer<robot_msgs::centerAction> center_server;  

using namespace std;

template<typename T>
T getParam(const string& name,const T& defaultValue)
{
    T v;
    if(ros::param::get(name,v))
    {
        //ROS_INFO_STREAM("Found parameter: "<<name<<",\tvalue: "<<v);
        //cout << name << " : " << v <<endl;
        return v;
    }
    else 
        ROS_WARN_STREAM("Cannot find value for parameter: --"<<name<<"-- ,\tassigning default: "<<defaultValue);
    return defaultValue;
}

typedef struct {
    float pose[3];
}Pose;

typedef struct{
    double yaw;
    double pitch;
} Angle;

typedef struct {
    int fun;
    int num;
    vector<float> parameter;
} Action;

typedef struct {
    string name;
    Pose pose;
    Angle angle;
    int setp;
    vector<Action> action;
} Point;

typedef struct {
    string prior;
    string next;
    string point_name;
    int number;
    Point point;
}Path;
vector<Path> path;

typedef struct{
    string point_name;
    string time;
    vector<float> pose;
    vector<float> cmd;
    vector<float> angle;
    string direction;
    vector<bool> control;
    float gas_result;
    float reco_result;
    float temp;
    string picture_path;
} Integrate;


const string param_str="/center";   
const string name_str="/name";     
const string pose_str="/pose";      
const string angle_str = "/angle";
const string xyth_str[3]={"/x","/y","/th"};     
const string yaw_str = "/yaw";
const string pitch_str = "/pitch";
const string setp_str="/setp";          
const string action_str="/action";  
const string fun_str="/fun";            
const string num_str="/num";        
const string parameter_str="/parameter";    
string path_str;

bool readpoint(string point_name,Point *point1)
{
        stringstream ss;
        string str="";
        cout << "point :" << point_name << endl;

        //name
        for(int j=0;j<1;j++)
        {
            ss<<param_str<<point_name<<name_str;
            ss>>str;
            const string &str1=str;
            (*point1).name = getParam<string>(str1,"");
            str="";
            ss.str("");
            ss.clear();
        }

        //pose
        for(int j=0;j<3;j++)
        {
            ss<<param_str<<point_name<<pose_str<<xyth_str[j];
            ss>>str;
            const string &str0=str;
            (*point1).pose.pose[j]=getParam<float>(str0,0.0);
            str="";
            ss.str("");
            ss.clear();
        }

        //angle
        for(int j = 0; j < 1; j++)
        {
            ss<<param_str<<point_name<<angle_str<<yaw_str;
            ss>>str;
            const string &str1 = str;
            (*point1).angle.yaw = getParam<double>(str1, 0.0);
            str = "";
            ss.str("");
            ss.clear();
            
            ss<<param_str<<point_name<<angle_str<<pitch_str;
            ss>>str;
            const string &str0 = str;
            (*point1).angle.pitch = getParam<double>(str0, 0.0);
            str = "";
            ss.str("");
            ss.clear();
        }

        //setp
        for(int j=0;j<1;j++)
        {
            ss<<param_str<<point_name<<setp_str;
            ss>>str;
            const string &str1=str;
            (*point1).setp=getParam<int>(str1,0);
            str="";
            ss.str("");
            ss.clear();
        }

        //action
        for(int j=0;j<(*point1).setp;j++)
        {
            Action action1;
            //fun
            for(int k=0;k<1;k++)
            {
                ss<<param_str<<point_name<<action_str<<j<<fun_str;
                ss>>str;
                const string &str1=str;
                action1.fun=getParam<int>(str1,0);
                str="";
                ss.str("");
                ss.clear();
            }

            //num
            for(int k=0;k<1;k++)
            {
                ss<<param_str<<point_name<<action_str<<j<<num_str;
                ss>>str;
                const string &str1=str;
                action1.num=getParam<int>(str1,0);
                str="";
                ss.str("");
                ss.clear();
            }

            //parameter
            for(int k=0;k<action1.num;k++)
            {
                ss<<param_str<<point_name<<action_str<<j<<parameter_str<<k;
                ss>>str;
                const string &str1=str;
                action1.parameter.push_back(getParam<float>(str1,0));
                str="";
                ss.str("");
                ss.clear();
            }
            (*point1).action.push_back(action1);
        }
    return true;
}

bool readpath(const string path_name)
{
    const string param_str="/center";
        //const string path_str="/path";
    string point_str="/point0";
    const string prior_str="/prior";
    const string next_str="/next";

    path.clear();

    stringstream ss;
    string str="";
    int i=0;
    while (ros::ok())
    {
        /* code for loop body */
        Path temp;

        //prior
        ss<<param_str<<path_name<<point_str<<prior_str;
        ss>>str;
        const string &str0=str;
        temp.prior = getParam<string>(str0,"end");
        str="";
        ss.str("");
        ss.clear();

        //next
        ss<<param_str<<path_name<<point_str<<next_str;
        ss>>str;
        const string &str1=str;
        temp.next = getParam<string>(str1,"end");
        str="";
        ss.str("");
        ss.clear();      

        //point
        if(temp.prior=="start")
            temp.point_name="/point0";
        else
            temp.point_name=path[i-1].next;

        //number
        temp.number=i;

        //point
        readpoint(temp.point_name,&(temp.point));

        path.push_back(temp);

        if(temp.next=="end")break;
        else if(temp.next=="ring")break;
        point_str=temp.next;
        i++;
    }
    cout << path_name <<" : ";
    for(int i=0;i<path.size();i++)
        cout << path[i].point_name << " --> ";
    cout << path[path.size()-1].next << endl;
    return true;
}

                                   
class CENTRALCONTROLLING
{
public:
    CENTRALCONTROLLING();   
    ~CENTRALCONTROLLING();
    ros::NodeHandle nh;     
    ros::NodeHandle n;

private:
    ros::Subscriber sub_chasis;
    ros::Subscriber sub_camera;

    ros::ServiceClient client_terrace;
    ros::ServiceClient client_nav;
    ros::ServiceClient client_recognition;
    ros::ServiceClient client_gas;
    ros::ServiceClient client_temp;

    ros::Publisher pub;
    
    ros::ServiceServer server_suspend;  
    center_server centerserver;     
    Integrate integrator;

    ALARM_CONTROL* alarm_controler;

    std::vector<string> route;      
    int suspend, alarm_volume;    
    string time_sec;
    string time_day;
    string IMG_BASE_PATH;
    string FOLDER_BASE_PATH;

    
    void delay_s(float time);   
    int action(int number, int fun,int num,vector<float> parameter, string action_name);    
    void execute(const robot_msgs::centerGoalConstPtr &goal, center_server *as);    
    bool suspend_callback(robot_msgs::setint16::Request &req,   
                          robot_msgs::setint16::Response &res); 
    bool hover_function(center_server* as);
    bool createfile(int start); //声明创建文件夹函数

    void chasis_callback(const robot_msgs::chasis::ConstPtr &chasis);
    void cloud_callback(const robot_msgs::camera::ConstPtr &cloud);
    void integrator_init();
};

CENTRALCONTROLLING::CENTRALCONTROLLING():centerserver(nh,"center_server",boost::bind(&CENTRALCONTROLLING::execute,this,_1,&centerserver),false), n("~")
{
    integrator.angle = vector<float>(2, .0);
    integrator.cmd = vector<float>(2, .0);
    integrator.control = vector<bool>(3, false);
    integrator.pose = vector<float>(3, .0);
    integrator_init();

    alarm_controler = new ALARM_CONTROL(nh);

    n.param<string>("folder_base_path", FOLDER_BASE_PATH, "/home/hhy/Explosion_proof_robot/datas/");
    nh.param("/models_joy/alarm_volume", alarm_volume, 20);
    
    centerserver.start();   
    suspend = 0;  
    server_suspend=nh.advertiseService("center_suspend",&CENTRALCONTROLLING::suspend_callback,this);    //实例化悬停服务器对象，并绑定服务回调函数suspend_callback
    
    client_nav=nh.serviceClient<robot_msgs::nav_goal>("artificial"); //artificial 中定义了service, 此处定义请求client    
    client_terrace= nh.serviceClient<robot_msgs::PtzPreset>("cloud_terrace");   
    client_gas = nh.serviceClient<robot_msgs::Gas_alarm>("gas_alarm");  
    client_recognition = nh.serviceClient<robot_msgs::recognition_scale>("recognition_scale");    
    client_temp = nh.serviceClient<robot_msgs::temp_detection>("temperature");
    pub = nh.advertise<robot_msgs::Integrator>("Integrator", 1);

    sub_camera = nh.subscribe<robot_msgs::camera>("cloud_info", 1, &CENTRALCONTROLLING::cloud_callback, this);
    sub_chasis = nh.subscribe<robot_msgs::chasis>("chasis_info", 1, &CENTRALCONTROLLING::chasis_callback, this);
}

CENTRALCONTROLLING::~CENTRALCONTROLLING()
{
    delete alarm_controler;
}

bool CENTRALCONTROLLING::createfile(int start)
{
    time_t timer;
    struct tm *tblock;
    timer = time(NULL);
    tblock = localtime(&timer);
    cout << "time : " << asctime(tblock) <<endl;
     
    stringstream ss;
    string str="";
    ss<< FOLDER_BASE_PATH << asctime(tblock)<< path_str;
 
    str=ss.str();
    
    int ret=0;
    ret = mkdir(str.c_str(), 0775);
    printf("creat dir '/%s'/\n", str.c_str());
    if(ret < 0)
    {
        printf("Could not create directory \'%s\' \n",str.c_str());
        return EXIT_FAILURE;
    }

    for(int i=start;i<path.size();i++)
    {
        stringstream ss1;
        string str1="";
	
        if(path[i].point_name=="") continue;
        ss1<< ss.str() <<"/"<< path[i].point_name << " : " << path[i].point.name;
        str1=ss1.str();
        ret = mkdir(str1.c_str(), 0775);    
        route.push_back(str1);  

        printf("creat dir '/%s'/\n", str1.c_str());

        if(ret < 0)
        {
            printf("Could not create directory \'%s\' \n",str1.c_str());
            return 0;
        }
    }
    return 1;
}

void CENTRALCONTROLLING::chasis_callback(const robot_msgs::chasis::ConstPtr &chasis)
{
    integrator.pose[0] = chasis->pose.x;
    integrator.pose[1] = chasis->pose.y;
    integrator.pose[2] = chasis->pose.yaw;

    integrator.cmd[0] = chasis->cmd.linear;
    integrator.cmd[1] = chasis->cmd.angular;
}

void CENTRALCONTROLLING::cloud_callback(const robot_msgs::camera::ConstPtr &cloud)
{
    integrator.angle[0] = cloud->angle.pitch;
    integrator.angle[1] = cloud->angle.yaw;

    integrator.direction = cloud->control.direction;
    integrator.control[0] = cloud->control.zero;
    integrator.control[1] = cloud->control.scrub;
    integrator.control[2] = cloud->control.light;
}

void CENTRALCONTROLLING::integrator_init()
{
    integrator.direction = "";
    integrator.gas_result = 0;
    integrator.picture_path = "";
    integrator.point_name = "";
    integrator.reco_result = 0.0;
    integrator.temp = 0.0;
    integrator.time = "";
}

void CENTRALCONTROLLING::delay_s(float time)
{

    usleep((int)(time*1000.0*1000.0));
}

bool CENTRALCONTROLLING::suspend_callback(robot_msgs::setint16::Request &req,
                      robot_msgs::setint16::Response &res)
{
    if (suspend == -1)
    {
        res.message = "The Program is in a safe state !";
        res.success = true;
        suspend = 0;
    }
    else if(suspend == 1)
    {
        res.message = "The Program is in an error state !";
        res.success = false;
        suspend = 0;
    }
    else
    {
        res.message = "The Program is in a safe state !";
        res.success = true;
        suspend = -1;
    }
    return true;
}

bool CENTRALCONTROLLING::hover_function(center_server* as)
{
    int record = suspend;
    
    if(record == 1) 
    {
        sleep(1);
        alarm_controler->alarm_control(8, alarm_volume, 2);
    }
    else if(record == -1) 
    {
        sleep(1);
        alarm_controler->alarm_control(7, alarm_volume, 2);
    }
    else{}
    if(suspend) ROS_INFO("The robot goes in an hover !");
    while (suspend && ros::ok())
    {
        sleep(1.0);
    }
    
    path_str = getParam<string>("/center/PATH","/Path0");
    readpath(path_str);

    if(record == -1)
    {
        robot_msgs::centerResult result_;
        result_.result = 0;
        as->setPreempted(result_);
        return true;
    }
    else if(record == 1)
    {
        robot_msgs::centerResult result_;
        result_.result = 0;
        as->setAborted(result_);
        return true;
    }
    else    return false;
}

const string function_name[] = {"delay", "recognition", "gas_alarm", "make_zero", "", "temperature"};
int CENTRALCONTROLLING::action(int number,int fun,int num,vector<float> parameter, string action_name)
{
    int value=0;
    integrator.point_name = action_name;
    if(fun<=5||fun>=0)
    {
        ROS_INFO(" fun : %s",function_name[fun].c_str());
    }
    else
    {
        ROS_ERROR(" Please check the error here. It should be fun parameter error.");
        return false;
    }

    if(fun==0)
    {
        delay_s(parameter[0]);
        ROS_INFO(" fun : %s succeed!",function_name[fun].c_str());
	    value=true;
    }
    else if(fun==1)
    {
        robot_msgs::recognition_scale identifier;
        identifier.request.start = true;
        alarm_controler->alarm_control(18, alarm_volume, 2);
        if(client_recognition.call(identifier) && identifier.response.result != -1)
        {
            integrator.time = identifier.response.time;
            integrator.reco_result = identifier.response.result;
            integrator.picture_path = identifier.response.image_path;
            alarm_controler->alarm_control(19, alarm_volume, 2);
            ROS_INFO("Instrumentation recognition success !");
            value = true;
        }
        else if(identifier.response.result == -1)
        {
            ROS_ERROR("Instrumentation recognition fail !");
            value = true;
        }
        else
        {
            ROS_ERROR("The identification system is not started !");
            value = false;
        }
    }
    else if(fun==2)
    {
        robot_msgs::Gas_alarm monitor;
        monitor.request.start = true;
        if(client_gas.call(monitor))
        {
            integrator.gas_result = monitor.response.result;
            ROS_INFO("Found alarm value: %e !", integrator.gas_result);
            value = true;
        }
        else
        {
            ROS_ERROR("The gas alarm system is not turned on !");
            value = false;
        }
    }
    else if(fun==3)
    {
        robot_msgs::PtzPreset reducer;
        reducer.request.pitch = 0.0;
        reducer.request.yaw = 0.0;
        if(client_terrace.call(reducer) && reducer.response.result)
        {
            ROS_INFO("Success to zero !");
            value = true;
        }
        else
        {
            ROS_ERROR("Fail to zero !");
            value = false;
        }
    }
    else if (fun==4)
    {
        
    }
    else if(fun == 5)
    {
        robot_msgs::temp_detection temp;
        temp.request.start = true;
        if(client_temp.call(temp))
        {
            integrator.temp = temp.response.temp;
            ROS_INFO("Found alarm value: %e !", integrator.temp);
            value = true;
        }
        else
        {
            ROS_ERROR("The temperature system is not turned on !");
            value = false;
        }
    }
    else
    {
        ROS_ERROR("There is no such function !");
        value = false;
    }
    return value;
}

void CENTRALCONTROLLING::execute(const robot_msgs::centerGoalConstPtr &goal, center_server *as)
{
    robot_msgs::centerFeedback feedback;    
    robot_msgs::centerResult result_;   
    
    path_str = getParam<string>("/center/PATH","/Path0");
    readpath(path_str);

    if(path[path.size()-1].next=="ring"){
        createfile(0);
    }else{
        createfile(goal->point_number);
    }

    for(int i= goal->point_number; i<path.size() && ros::ok(); i++)
    {
        cout << "\n\n" << path[i].point_name << " : " << path[i].point.name << " start"<< endl;
        cout<< "x : " << path[i].point.pose.pose[0] <<endl;
        cout<< "y : " << path[i].point.pose.pose[1] <<endl;

        robot_msgs::nav_goal art;
        art.request.x = path[i].point.pose.pose[0];
        art.request.y = path[i].point.pose.pose[1];
	    art.request.th =path[i].point.pose.pose[2];
        //cout << "art_result:"<< art.request.x << art.request.y << art.request.th << endl;

        //cout << client_nav.call(art) << endl;

        if(!client_nav.call(art))
        {
            ROS_ERROR(" Navigation error !");
            suspend=1;
        }
        
        stringstream ss;
        ss<< path[i].point_name << "  x:" << path[i].point.pose.pose[0] << "  y:" << path[i].point.pose.pose[1] << endl;
        feedback.message=ss.str();
        cout << ss.str() << endl;
        as->publishFeedback(feedback);
        cout << "Navigation success !" <<endl;

        robot_msgs::PtzPreset hunter;
        hunter.request.pitch = path[i].point.angle.pitch;
        hunter.request.yaw = path[i].point.angle.yaw;
        if(client_terrace.call(hunter) && hunter.response.result)
        {
            stringstream ss;
            ss<< path[i].point_name << "  yaw:" << path[i].point.angle.yaw << "  pitch:" << path[i].point.angle.pitch << endl;
            feedback.message=ss.str();
            cout << ss.str() << endl;
            as->publishFeedback(feedback);//导航成功反馈
            cout << "Cloud platform success !" <<endl;
        }
        else
        {
            ROS_ERROR("Cloud platform error !");
            suspend=1;
        }

        if(path[i].point.setp>0)
        {
            for(int j=0;j<path[i].point.setp;j++)
            {
                
                if(hover_function(as))  goto end;

                cout<< "fun : " << path[i].point.action[j].fun << " \tnum : " << path[i].point.action[j].num<<endl;
                if(!action(path[i].number, path[i].point.action[j].fun,path[i].point.action[j].num, path[i].point.action[j].parameter, path[i].point.name))
                {
                    ROS_ERROR("%s is error !",function_name[path[i].point.action[j].fun].c_str());
                    suspend=1;
                }
                else
                    ROS_INFO("%s is succeed !",function_name[path[i].point.action[j].fun].c_str());
            }//end for
		    cout << "end for" <<endl;
        }//end if
        //如果是环状路径，则继续执行第一个点；
        if(i==(path.size()-1)&&path[i].next=="ring")
        {
            i = -1;
            cout << "if ring "<< endl;
        }

        robot_msgs::Integrator integrators;
        integrators.point_name = integrator.point_name;
        integrators.time = integrator.time;

        integrators.chasis.pose.x = integrator.pose[0];
        integrators.chasis.pose.y = integrator.pose[1];
        integrators.chasis.pose.yaw = integrator.pose[2];
        integrators.chasis.cmd.linear = integrator.cmd[0];
        integrators.chasis.cmd.angular = integrator.cmd[1];

        integrators.camera.angle.yaw = integrator.angle[0];
        integrators.camera.angle.pitch = integrator.angle[1];
        integrators.camera.control.direction = integrator.direction;
        integrators.camera.control.zero = integrator.control[0];
        integrators.camera.control.scrub = integrator.control[1];
        integrators.camera.control.light = integrator.control[2];
        integrators.gas.result = integrator.gas_result;
        integrators.recognition.result = integrator.reco_result;
        integrators.recognition.picture_path = integrator.picture_path;
        integrators.temp.result = integrator.temp;

        pub.publish(integrators);
        sleep(1);
        //在导航前判断是否暂停
        if(hover_function(as))  goto end;
        else {}
    }//end for
	cout << "end for ------" <<endl;
    result_.result = 1;
    as->setSucceeded(result_);  //反馈动作执行结果
end:
	cout << "end end end "<< endl;
}

//主函数
int main(int argc,char** argv)
{
    ros::init(argc,argv,"center");  //初始化节点名

    CENTRALCONTROLLING central;     //实例化对象：中央控制器（中心调度）
	//readpath("/PATH1");

    //开启多线程接收
    ros::AsyncSpinner spinner(3);
    spinner.start();    //开启线程
    ros::waitForShutdown();     //等待线程关闭
}
