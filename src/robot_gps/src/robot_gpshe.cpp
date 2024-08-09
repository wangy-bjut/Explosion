#include <string>   //字符串容器包
#include <vector>   //向量容器包
#include <sstream>  //将数据存入缓存区或从中读取的包
#include <cmath>    //数学基础公式包
#include <cstdlib>  //string转化为double包
#include <iomanip>  //保留有效小数包
#include <ros/ros.h>    //ROS包
#include <serial/serial.h>  //ROS已经内置了的串口包
#include <tf/transform_broadcaster.h>   //tf坐标转换包
#include <robot_msgs/dgps.h>    //自定义话题数据包
#include <iostream>     

#define PI 3.1415   
#define SULUTION_STATE(str1, str2) printf("%s error => %s\n",  str1, str2)  
#define ERROR_DISTANCE 0.1  

using namespace std;

serial::Serial ser_by;
double pose[4] = {0}; // 声明了一个名为pose的double类型数组，并初始化所有元素为0,数组的大小为4，因此它可以存储4个double类型的值

struct Result // C++结构体定义，名为Result, 包含8个double类型的成员变量
{
    double by_pose0;    
    double by_pose1;     
    double by_r;     
    double sin_th_q1;
    double cos_th_q1;
    double sin_th;
    double cos_th;
    double bbyyy;
};

// 这个函数的作用是将一个字符串s按照逗号分隔，并将分隔后的子字符串存储到一个向量v中
// 定义了一个名为 analysis0 的函数，它接受一个 std::string 类型的参数 s
void analysis0(std::string s)
{
    std::vector<std::string> v;        // 声明了一个名为 v 的 std::vector 对象，用于存储分割后的子字符串
    std::string::size_type pos1, pos2; // 声明了两个 std::string::size_type 类型的变量 pos1 和 pos2，用于存储字符串中的位置索引
    pos2 = s.find(",");                // 使用 std::string 的 find 方法查找字符串 s 中第一个逗号的位置，并将结果赋值给 pos2
    pos1 = 0;                          // 将 pos1 初始化为0，表示字符串的起始位置

    while (std::string::npos != pos2) // 开始一个循环，条件是 pos2 不等于 std::string::npos，后者是一个特殊的值，表示没有找到逗号
    {
        v.push_back(s.substr(pos1, pos2 - pos1)); // 从字符串 s 中提取从 pos1 到 pos2 之间的子字符串，并使用 push_back 方法将其添加到向量 v 的末尾
        pos1 = pos2 + 1;                          // 更新 pos1 的值，使其指向当前逗号之后的位置
        pos2 = s.find(",", pos1);                 // 再次使用 find 方法查找下一个逗号的位置，但这次从 pos1 指定的位置开始搜索
    }

    if (pos1 != s.length()) // 检查是否还有剩余的字符串没有被处理（即在最后一个逗号之后的部分）
        v.push_back(s.substr(pos1)); // 如果有剩余的字符串，这一行将其添加到向量 v 的末尾

    if (v.max_size() >= 9 && v[2] == "4") // $GPNTR 这个值不应该是0吗？??按照报文里，表24解的状态
    {
	    if (v[4] != "")
            pose[0] = std::atof(v[4].c_str()); // 如果v[4]不为空，则将pose[0]的值设置为v[4]的浮点数值
        else
            SULUTION_STATE("$GPNTR", "[Y] don't have data"); // 否则，调用SULUTION_STATE函数并传递参数"$GPNTR"和"[Y] don't have data"
        if (v[5] != "")
            pose[1] = std::atof(v[5].c_str()); // 如果v[5]不为空，则将pose[1]的值设置为v[5]的浮点数值
        else SULUTION_STATE("$GPNTR", "[X] don't have data"); // 否则，调用SULUTION_STATE函数并传递参数"$GPNTR"和"[X] don't have data"
        if (v[6] != "")
            pose[2] = std::atof(v[6].c_str()); // 如果v[6]不为空，则将pose[2]的值设置为v[6]的浮点数值
        else
            SULUTION_STATE("$GPNTR", "[Z] don't have data"); // 否则，调用SULUTION_STATE函数并传递参数"$GPNTR"和"[Z] don't have data"
        cout << "pos012 : " << pose[0] << pose[1] << pose[2] << endl; // 输出pose[0]、pose[1]和pose[2]的值
    }
    else if(v[2] == "1")    SULUTION_STATE("$GPNTR", "Insufficient observational data...");
    else if(v[2] == "2")    SULUTION_STATE("$GPNTR", "Unable to convergence...");
    else if(v[2] == "4")    SULUTION_STATE("$GPNTR", "The trace of the covariance matrix is >1000m...");
    else if(v[2] == "13")    SULUTION_STATE("$GPNTR", "In the base station state, the residual error is large and the positioning result is not credible...");
    else if(v[2] == "19")    SULUTION_STATE("$GPNTR", "The param [fix] is config error...");
    else if(v[2] == "20")    SULUTION_STATE("$GPNTR", "The location type does not have the correct authorization...");
    else    SULUTION_STATE("$GPNTR", 'Error code is' + v[2].c_str());
}

Result coordinate_deal(double x , double y, double th){
    // 定义了一个名为coordinate_deal的函数，它接收三个double类型的参数：x、y和th
    // 函数的目的是根据输入的坐标(x, y)和角度th，计算出一个新的坐标点，并将结果存储在一个名为Result的结构体中
    Result ret; // 函数创建了一个名为ret的Result结构体实例
    double adjust_angle = th;
    double by_pose_x, by_pose_y; //它计算了新的坐标点的x和y值，分别存储在by_pose_x和by_pose_y变量中
    by_pose_x = x + sin(adjust_angle) * ERROR_DISTANCE; //使用了三角函数sin和cos，以及一个名为ERROR_DISTANCE的常量，该常量表示需要调整的距离
    by_pose_y = y + cos(adjust_angle) * ERROR_DISTANCE;
    ret.by_pose0 = by_pose_y; //函数将计算出的新坐标点的y值赋给ret.by_pose0
    ret.by_pose1 = by_pose_x;
    ret.by_r = th;
    ret.sin_th_q1 = 0; // 其余的成员变量都被初始化为0
    ret.cos_th_q1 = 0;
    ret.sin_th = 0;
    ret.cos_th = 0;
    ret.bbyyy = 0;
    return ret; //函数返回填充好的ret结构体
}
// 这个函数的作用是将一个字符串s按照逗号分隔，并将分隔后的子字符串存储到一个向量v中
// 定义了一个名为 analysis1 的函数，它接受一个 std::string 类型的参数 s
void analysis1(std::string s)
{
    std::vector<std::string> v;        // 声明了一个名为 v 的 std::vector 对象，用于存储分割后的子字符串
    std::string::size_type pos1, pos2; // 声明了两个 std::string::size_type 类型的变量 pos1 和 pos2，用于存储字符串中的位置索引
    pos2 = s.find(",");                // 使用 std::string 的 find 方法查找字符串 s 中第一个逗号的位置，并将结果赋值给 pos2
    pos1 = 0;                          // 将 pos1 初始化为0，表示字符串的起始位置

    while (std::string::npos != pos2) // 开始一个循环，条件是 pos2 不等于 std::string::npos，后者是一个特殊的值，表示没有找到逗号
    {
        v.push_back(s.substr(pos1, pos2 - pos1)); // 从字符串 s 中提取从 pos1 到 pos2 之间的子字符串，并使用 push_back 方法将其添加到向量 v 的末尾
        pos1 = pos2 + 1;                          // 更新 pos1 的值，使其指向当前逗号之后的位置
        pos2 = s.find(",", pos1);                 // 再次使用 find 方法查找下一个逗号的位置，但这次从 pos1 指定的位置开始搜索
    }

    if (pos1 != s.length()) // 检查是否还有剩余的字符串没有被处理（即在最后一个逗号之后的部分）
        v.push_back(s.substr(pos1)); // 如果有剩余的字符串，这一行将其添加到向量 v 的末尾

    if (v.max_size() >= 3) // $GNHDT 
    {
	    if (v[1] != "")
            pose[3] = std::atof(v[1].c_str()); // 将pose[3]的值设置为v[1]的浮点数值（如果v[1]不为空）
        double bby = pose[3];                  // 计算bby的值，如果pose[3]大于90，则将其减去90，否则将其加上270
        if(bby > 90){                          
            bby = bby - 90;
        }else{
            bby = bby + 270;
        }
        
        pose[3] = bby; //更新pose[3]的值为bby
        cout << "pose3 : " << pose[3] <<endl; //输出pose[3]的值
    }
    else
        SULUTION_STATE("$GNHDT", "Navigation Angle has some problems..."); // 如果v的最大大小小于3，
        //则调用SULUTION_STATE函数并传递两个参数："$GNHDT"和"Navigation Angle has some problems..."
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "robot_gps");
    //声明节点句柄
    ros::NodeHandle n("~"); // 私有命名空间。这意味着节点的所有参数和话题都将在私有命名空间下进行管理，而不是全局命名空间
    ros::NodeHandle nh;

    //注册Publisher到话题GPS
    ros::Publisher dgps_pub = nh.advertise<robot_msgs::dgps>("ZGPS",1000);
    try
    {
        string port_param = "";
        n.param<string>("ser_by",port_param, "/dev/ttyUSB1");
        ser_by.setPort(port_param.c_str());   //串口设置
        ser_by.setBaudrate(115200);   //波特率设置
        serial::Timeout to = serial::Timeout::simpleTimeout(1000);    //串口访问延迟设置
        ser_by.setTimeout(to);
        ser_by.open();    //打开串口
    }
    catch (serial::IOException& e)
    {
        ROS_ERROR_STREAM("Unable to open Serial Port !");
        return -1;
    }

    //判断串口是否打开成功
    if (ser_by.isOpen())
    {
        ROS_INFO_STREAM("Serial Port initialized");
    }
    else
    {
        return -1;
    }

    ros::Rate loop_rate(20);    //设置话题发布延迟
    while (ros::ok())
    {
        //判断是否通讯成功
        if (ser_by.available())
        {
            std::string strRece[2]={"", ""};    

            ROS_INFO_STREAM("Reading from serial port\n");
		    int n = 0 ; //定义了一个整数变量n并将其初始化为0
            n = ser_by.readline(strRece[0], 65536, "\n"); // 使用ser_by对象的readline方法从串口读取数据，
            // 将读取到的数据存储在strRece数组的第一个元素中，最多读取65536个字符，直到遇到换行符"\n"为止
            std::cout << "size is" << n << "\n"; // 输出读取到的字符数
            n = ser_by.readline(strRece[1], 65536, "\n"); // 使用readline方法从串口读取数据，
            // 将读取到的数据存储在strRece数组的第二个元素中，同样最多读取65536个字符，直到遇到换行符"\n"为止
            std::cout << "size is" << n << "\n"; // 输出读取到的字符数
            ser_by.flushInput(); // 调用ser_by对象的flushInput方法清空输入缓冲区
            std::cout << "strRece:" << strRece[0] << ',' << strRece[1] << "\n"; // 输出strRece数组的两个元素

            // 在一个字符串数组 strRece 中查找特定的字符串
            std::string gstart0 = "$GPNTR"; // 定义了三个字符串变量：gstart0、gstart1 和 gend
            std::string gstart1 = "$GNHDT"; 
            std::string gend = "\r\n";
            int i = 0, start = -1, end = -1, m_mode = 0; // 定义了一个整数变量 i 和两个整数变量 start 和 end，以及一个名为 m_mode 的整数变量，初始值为 0。
            // 使用 for 循环遍历字符串数组 strRece 的前两个元素
            for(int i=0;i<2;i++)
            {
                start = strRece[i].find(gstart0);
                m_mode = 1;

                if ( start == -1)
                {
                    cout << " Can't find GPNTR : " << i << endl;
                    start = strRece[i].find(gstart1);
                    m_mode = 2;
                    if(start == -1)
                    {
                        cout << " Can't find GNHDT : " << i << endl;
                        continue;
                    }
                }
		
                {
                    end = strRece[i].find(gend);
                    if (end == -1)
                    {
                        cout << " Can't find end : " << i << endl;
                        continue;
                    }
                    else
                    {
                        cout << "mode : " << m_mode << endl;
                        if(m_mode==1)
                            analysis0(strRece[i]); //$GPNTR 
                        else if(m_mode==2)
                            analysis1(strRece[i]); //$GNHDT
                        else
                            continue;
                    }
                }
            }
            Result res;
            
            robot_msgs::dgps gps;   //设置gps话题数据
            
            double by_pose20;
            double by_pose21;
	        double by_rrr,sin_th_q1,cos_th_q1,sin_th,cos_th,bbyyy;

            res = coordinate_deal(pose[1], pose[0], pose[3]); // 传的是[1],[0],[3],不是[0],[1],[3]，因为pose0是distance in north, pose1是distance in east

            by_pose20 = res.by_pose0;
            by_pose21 = -res.by_pose1;
	        by_rrr = res.by_r;
            sin_th_q1 = res.sin_th_q1;
            cos_th_q1 = res.cos_th_q1;
            sin_th = res.sin_th;
            cos_th = res.cos_th;
            bbyyy = res.bbyyy;

            ROS_INFO("by_pose20: %f",by_pose20);
            ROS_INFO("by_pose21: %f",by_pose21);

            gps.x = by_pose20;
            gps.y = by_pose21;
	        gps.z = 0;
            gps.roll = 0;
            gps.pitch = 0;
            gps.yaw = by_rrr;
            gps.by_pose0 = by_pose20;
            gps.by_pose1 = by_pose21;
            gps.sin_th_q1 = sin_th_q1;
            gps.cos_th_q1 = cos_th_q1;
            gps.sin_th = sin_th;
            gps.cos_th = cos_th;
            gps.bbyyy = bbyyy;
            dgps_pub.publish(gps);  //发布话题
            cout<<res.by_pose0<<"\t"<<res.by_pose1<<"\n";
        }
        loop_rate.sleep();  //等待延时
    }
    return 0;
}
