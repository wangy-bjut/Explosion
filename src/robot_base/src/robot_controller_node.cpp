#include "robot_manager.h"


#define MAX_ANGLE 0.576
#define MAX_LINE_VEL 1.5
#define PI 3.1416
#define CMD_ROLL 1.0
#define JOINT_NUM 9
#define WHEEL_R 0.15

class Robot_Con
{
private:
  RobotManager *manager;  
  std::vector<signed int> rpm;
	void chasis_callback(const robot_msgs::ackerman_control &control);   
	void cloud_callback(const robot_msgs::cloud_control &control);
  ros::NodeHandle m_handle; 
	ros::NodeHandle m_private_handle; 
	ros::Subscriber m_chasis_sub;    //实例化速度订阅
  ros::Subscriber m_cloud_sub;
	ros::Publisher m_odom_pub;  //实例化里程计信息发布者
  ros::Publisher m_chasis_pub;
  ros::Publisher m_cloud_pub;
  ros::Publisher m_joint_pub;

	boost::thread pub_workThread, pub_jointThread;  //发布者线程
	bool m_workFlag, m_jointFlag;  //标杆，判断是否结束已经开启的发布者线程
	double m_vel_x, m_vel_y, m_vel_th, cmd_yaw_max, cmd_pitch_max;  //速度数据，x,y,yaw

  robot_msgs::camera camera;
  robot_msgs::ackerman_control g_control;
	ros::Time m_currentTime;  //当前时间点
	ros::Time m_lastTime; //过去的时间点
  ros::Time currentTime;
	ros::Time lastTime;

	double m_pos_x, m_pos_y, m_pos_th, m_yaw0, m_yaw1, m_pitch0, m_pitch1;  //基于里程计坐标位置的x,y,yaw坐标信息
	tf::TransformBroadcaster m_broadcaster; //tf坐标转换树
	geometry_msgs::TransformStamped m_odom_trans; //tf坐标树中的实时odom节点数据
	nav_msgs::Odometry m_odom;  //实时odom数据
	std::string m_port; //机器人底盘串口名
  void pub_work();  //发布话题数据
  void pub_jointstate();
  void limiting(std::vector<signed int> &rpm);
  void robot_angle_pitch(double &angle);
  void robot_angle_yaw(double &angle);
  void ros_init();
public:
	Robot_Con(std::string port="/dev/ttybase"); //构造函数
	virtual ~Robot_Con(); //析构函数
};

/*定义机器人控制者构造函数*/
Robot_Con::Robot_Con(std::string port)
{
  m_private_handle=ros::NodeHandle("~");  //设置句柄为私有句柄
  rpm = std::vector<signed int>(2, 0);
  //从launch文件中获取串口，如果没找到就使用默认的USB0
  if(!m_private_handle.getParam("serialport", m_port))
  {
    m_port="/dev/ttybase";
    ROS_INFO("cannot find param in launch file,try to open defaulte port /dev/ttyUSB0 ");
  }
  manager = new RobotManager(m_port); //实例化机器人管理者对象

  if(!manager)
    throw RobotException("open error on port:" + m_port);
  
  m_private_handle.param<double>("cmd_yaw_max", cmd_yaw_max, 0.5);
  m_private_handle.param<double>("cmd_pitch_max", cmd_pitch_max, 0.5);

  m_chasis_sub = m_handle.subscribe("transform_joy", 1, &Robot_Con::chasis_callback, this);  
  m_cloud_sub = m_handle.subscribe("cloud_control", 1, &Robot_Con::cloud_callback, this); 
  
  m_odom_pub = m_handle.advertise<nav_msgs::Odometry>("odom", 1); 
  m_chasis_pub = m_handle.advertise<robot_msgs::chasis>("chasis_info", 1);
  m_cloud_pub = m_handle.advertise<robot_msgs::camera>("cloud_info", 1);
  m_joint_pub = m_handle.advertise<sensor_msgs::JointState>("joint_states", 1);
  
  m_workFlag = true;  //将线程是否运行的标杆初始化成true
  m_jointFlag = true;
  m_pos_x = m_pos_y = m_pos_th = 0; 
  m_yaw0 = m_pitch0 = m_yaw1 = m_pitch1 = 0;
  m_vel_x = m_vel_y = m_vel_th = 0; 
  ros_init();

  pub_workThread = boost::thread(boost::bind(&Robot_Con::pub_work, this)); //绑定并开启发布者线程
  pub_jointThread = boost::thread(boost::bind(&Robot_Con::pub_jointstate, this));

  lastTime = ros::Time::now();
  m_lastTime = ros::Time::now();  //将当前时间戳赋值给m_lastTime
}

void Robot_Con::ros_init()
{
  camera.angle.pitch = 0.0;
  camera.angle.yaw = 0.0;
  camera.control.direction = "stop";
  camera.control.light = false;
  camera.control.scrub = false;
  camera.control.zero = false;

  g_control.speed = 0.0;
  g_control.turn = 0.0;
}

void Robot_Con::chasis_callback(const robot_msgs::ackerman_control &control)
{

  double vel_x = control.speed;
  double ang_z = control.turn;
  g_control.speed = control.speed;
  g_control.turn = control.turn;

  double ang_num=0.0, line_vel=0.0;

  m_private_handle.param<double>("ang_multiply", ang_num, 1.0);
  m_private_handle.param<double>("linear_multiply", line_vel, 1.0);
  rpm[0] = (ang_z*1000*ang_num); 
  rpm[1] = (vel_x*1000*line_vel); 
  limiting(rpm);  

  manager->set_goal_rpm(rpm); 
}

void Robot_Con::cloud_callback(const robot_msgs::cloud_control &control)
{
  manager->set_goal_control(control);
  double yaw, pitch;
  currentTime = ros::Time::now(); 
  double dt = (currentTime - lastTime).toSec();
  lastTime = currentTime;

  std::string direntation = control.direction;
  if (direntation == "up")
    pitch = -cmd_yaw_max * control.angular_percent / 100.0;
  else if(direntation == "down")
    pitch = cmd_yaw_max * control.angular_percent / 100.0;
  else if(direntation == "left")
    yaw = cmd_pitch_max * control.angular_percent / 100.0;
  else if(direntation == "right")
    yaw = -cmd_pitch_max * control.angular_percent / 100.0;
  else
    yaw = pitch = 0.0;
  

  m_yaw0 += yaw * dt;
  m_pitch0 += pitch * dt;
  robot_angle_yaw(m_yaw0);
  robot_angle_pitch(m_pitch0);

  camera.angle.yaw = m_yaw0;
  camera.angle.pitch = m_pitch0;
  camera.control.direction = direntation;
  camera.control.light = control.light;
  camera.control.scrub = control.scrub;
  camera.control.zero = control.zero;
  camera.control.angular_percent = control.angular_percent;
  
  robot_msgs::camera cam;
  if (direntation == "up")
    pitch = -1;
  else if(direntation == "down")
    pitch = 1;
  else if(direntation == "left")
    yaw = 1;
  else if(direntation == "right")
    yaw = -1;
  else
    yaw = pitch = 0.0;
  
  m_yaw1 += yaw * dt;
  m_pitch1 += pitch * dt;
  cam.angle.yaw = m_yaw1;
  cam.angle.pitch = m_pitch1;
  cam.control.direction = direntation;
  cam.control.light = control.light;
  cam.control.scrub = control.scrub;
  cam.control.zero = control.zero;
  cam.control.angular_percent = control.angular_percent;
  m_cloud_pub.publish(cam);
}

void Robot_Con::pub_jointstate()
{
  sensor_msgs::JointState joint_state;
  std::vector<std::string> joint(JOINT_NUM, "");
  joint_state.name.resize(JOINT_NUM);
  joint_state.position.resize(JOINT_NUM);
  m_private_handle.param<std::string>("joint1", joint[0], "joint1");
  m_private_handle.param<std::string>("joint2", joint[1], "joint2");
  m_private_handle.param<std::string>("joint3", joint[2], "joint3");
  m_private_handle.param<std::string>("joint4", joint[3], "joint4");
  m_private_handle.param<std::string>("joint5", joint[4], "joint5");
  m_private_handle.param<std::string>("joint6", joint[5], "joint6");
  m_private_handle.param<std::string>("joint7", joint[6], "joint7");
  m_private_handle.param<std::string>("joint8", joint[7], "joint8");
  m_private_handle.param<std::string>("joint9", joint[8], "joint9");

  for(int i = 0; i < JOINT_NUM; i++)
  {
    joint_state.name[i] = joint[i];
    joint_state.effort.push_back(500);
    joint_state.velocity.push_back(1);
  }
  joint_state.header.seq = 0;
  ros::Rate loop(10); //设置循环发布延时
  while(m_jointFlag && ros::ok())
  {
    double radian = pow(pow(m_pos_x, 2) +pow(m_pos_y, 2), 0.5) / WHEEL_R;
    robot_angle_yaw(radian);

    joint_state.position[0] = camera.angle.yaw;
    joint_state.position[1] = camera.angle.pitch;
    joint_state.position[2] = -g_control.turn;
    joint_state.position[3] = radian;
    joint_state.position[4] = g_control.turn;
    joint_state.position[5] = -radian;
    joint_state.position[6] = radian;
    joint_state.position[7] = -radian;
    joint_state.position[8] = 0;

    joint_state.header.stamp = ros::Time::now();
    m_joint_pub.publish(joint_state);
    joint_state.header.seq++;
    loop.sleep(); //等待延时
    ros::spinOnce();  //配合rate
  }
}

/*定义机器人控制者析构函数*/
Robot_Con::~Robot_Con()
{
	m_workFlag = false;	  //话题发布者线程标杆，设置为false意味着关闭话题发布者线程
  m_jointFlag = false;
	pub_workThread.join(); //等待线程关闭

  //删除机器人管理者对象
	if(manager)
		delete manager;	
}

/*定义话题订阅者线程回调函数*/
void Robot_Con::pub_work()
{
  ros::Rate loop(10); //设置循环发布延时

  //循环发布odom里程计话题
  while(m_workFlag && ros::ok())
  {
    if (manager->curr_rpm.size() != 2)
      continue;
    std::vector<signed int> current_rpm = manager->curr_rpm;  
    robot_msgs::chasis chasis;
   
    m_currentTime = ros::Time::now(); //赋给m_currentTime当前时间戳
   
    double m_angle = current_rpm[0] / 1000.0; 
    double m_liner = current_rpm[1] / 1000.0;
    double dt = (m_currentTime - m_lastTime).toSec();
    m_lastTime = m_currentTime; 
    
    chasis.cmd.angular = m_angle;
    chasis.cmd.linear = m_liner;
    m_vel_th = m_angle;
    m_vel_x = m_liner;

    
    double delta_x = m_vel_x * cos(m_pos_th) * dt;
    double delta_y = m_vel_x * sin(m_pos_th) * dt;
    double delta_th = m_vel_th * dt;

    m_pos_x += delta_x;
    m_pos_y += delta_y;
    m_pos_th += delta_th;

    robot_angle_yaw(m_pos_th);

    chasis.pose.x = m_pos_x;
    chasis.pose.y = m_pos_y;
    chasis.pose.yaw = m_pos_th;

    geometry_msgs::Quaternion odom_quat = tf::createQuaternionMsgFromRollPitchYaw(0,0,m_pos_th);  //将欧拉角转换成四元数
    m_odom.header.stamp = m_currentTime;  //给予odom话题时间戳
    m_odom.header.frame_id = "odom";  //里程计在tf坐标系中的名
    m_odom.child_frame_id = "base_footprint"; //里程计在tf坐标系中的子节点名
    // position 
    m_odom.pose.pose.position.x = m_pos_x;
    m_odom.pose.pose.position.y = m_pos_y;
    m_odom.pose.pose.position.z = 0.0;
    m_odom.pose.pose.orientation = odom_quat;
    //velocity
    m_odom.twist.twist.linear.x = m_vel_x;
    m_odom.twist.twist.linear.y = m_vel_y;
    m_odom.twist.twist.linear.z = 0.0;
    m_odom.twist.twist.angular.x = 0.0;
    m_odom.twist.twist.angular.y = 0.0;
    m_odom.twist.twist.angular.z = m_vel_th;

    m_odom_pub.publish(m_odom); //发布里程计话题数据
    m_chasis_pub.publish(chasis);

    //tf坐标系转换
    m_odom_trans.header.stamp = m_currentTime;
    m_odom_trans.header.frame_id = "odom";
    m_odom_trans.child_frame_id = "base_footprint";
    m_odom_trans.transform.translation.x = m_pos_x;
    m_odom_trans.transform.translation.y = m_pos_y;
    m_odom_trans.transform.translation.z = 0.0;
    m_odom_trans.transform.rotation = tf::createQuaternionMsgFromYaw(m_pos_th);
    std::cout<<"m_pos_th"<<m_pos_th<<std::endl;
    m_broadcaster.sendTransform(m_odom_trans);  //转换tf坐标系

    loop.sleep(); //等待延时
    ros::spinOnce();  //配合rate
  }
}

void Robot_Con::limiting(std::vector<signed int> &rpm)
{
  if(abs(rpm[0]) > (MAX_ANGLE * 1000)) 
    rpm[0] = 1000 * MAX_ANGLE * (rpm[0] / abs(rpm[0]));
  if(abs(rpm[1]) > (MAX_LINE_VEL * 1000))
    rpm[1] = 1000 * MAX_LINE_VEL * (rpm[1] / abs(rpm[1]));
}

void Robot_Con::robot_angle_yaw(double &angle)
{
  angle = (int(angle * 10000) % int(2 * PI * 10000)) / 10000.0;
  if (abs(angle) > PI)  angle = (abs(angle) - 2 * PI) * (angle / abs(angle));
}

void Robot_Con::robot_angle_pitch(double &angle)
{
  if(angle >= PI / 2.0) angle = PI / 2.0;
  if(angle <= -PI / 2.0)  angle = -PI / 2.0;
}

int main(int argc, char** argv)
{
	ros::init(argc, argv, "robot_controller");  //初始化robot_controller节点
	Robot_Con Bobac;  //实例化机器人控制者对象
	ros::spin();  //开启ROS线程函数
	return 0;
}
