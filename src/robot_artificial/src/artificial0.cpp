
#include "ros/ros.h"
#include <stdio.h>
#include <iostream>
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/LaserScan.h>
#include <math.h>
#include <algorithm>
#include <robot_msgs/dgps.h>
#include <robot_msgs/nav_goal.h>
#include <eigen3/Eigen/Dense>
#include <robot_msgs/IoStatus.h>



using namespace std;
using namespace Eigen;

#define PI 3.1415
#define MAX 100000000
#define k 6
#define c 12
#define p 2.5


/*定义全局变量*/

// double q0;
// double q1;
// double q2;
// double q3;
//double delta;

double x;
double y;
double z;
double a;
double b;
double aaa;
double bbb;
double attractive;
double xattractive;
double yattractive;
double conpulsive;
double xconpulsive;
double yconpulsive;
double attractangle;
double conangle;
double xsum;
double ysum;
double xsum_by_k;
double ysum_by_k;
double angle;
double angle_by_k;
double alpha;
double newspeed;
double newturnrate;
double Fsum;
double newspeed_by_k;
double newturnrate_by_k;
double Fsum_by_k;
double max_speed=0.9;
double max_turning_speed_rad = 1;

double alpha_by;  //偏航角 弧度
double reqalpha_by;
double newturnrate_by;

geometry_msgs::Twist cmd_vel;
ros::Publisher cmd_vel_pub;
sensor_msgs::LaserScan laser;

//定义回调函数
void callback(const robot_msgs::dgps::ConstPtr& msg)
{
	x=msg->x;
	y=msg->y;
	z=msg->z;

	alpha=msg->yaw;
	alpha=(alpha/180)*PI;
	if(alpha>PI){
		alpha=alpha-2*PI;
		alpha=-alpha;
	}else{
		alpha=-alpha;
	}
	alpha_by = alpha;

}


//定义取值的上限和下限
double limit(double n, double min, double max)
{
	if(n < min)
		return min;
	else if(n > max)
		return max;
	else 
	    return n;
}

//计算雷达探测的最小距离并计算所对应激光的索引
double get_min_distance_in_range(sensor_msgs::LaserScan laser, float min_degree, float max_degree,int &num)
{
	float limit_degrees = abs(laser.angle_min * 180 / PI); //弧度转角度,,,,得到最小角的角度值
	
	if(min_degree > max_degree)  //最大角度与最小角度的判断
	{
		float aux = max_degree;
		max_degree = min_degree;
		min_degree = aux;
	}	
	min_degree += limit_degrees;
	max_degree += limit_degrees;	
	float min_rad = min_degree / 180 * PI;
	float max_rad = max_degree / 180 * PI;
	int min_offset = (int)(min_rad / laser.angle_increment);
	int max_offset = (int)(max_rad / laser.angle_increment);
	float min = MAX;
	for(int i=min_offset; i<max_offset; i++)
	{
			if(laser.ranges[i] < min)
		    {
				min = laser.ranges[i];
				num = i;
			}
				
	}
	return min;	
}

//见车车前方式是否有障碍物
bool check_front_obstacle(sensor_msgs::LaserScan laser, float x_region, float y_region)
{
	int offset = 0;
	float min = MAX;
	float x_min,y_min = 0.0;
	float angle, angle_min = 0.0;
	for(int i=offset; i<laser.ranges.size()-offset; i++)
	{
		if (laser.ranges[i] > 0.05 && laser.ranges[i] < 1.0) 
		{
			angle = laser.angle_min + i * laser.angle_increment;
			double x = laser.ranges[i] * sin(angle);
			double y = laser.ranges[i] * cos(angle);
			if ((fabs(x) < x_region) && (y < y_region)) 
			{
				return true;
			}
		} 
	}
	return false;
}

//合力计算
void zby_k(double x1,double y1,double x2,double y2)
{
	double a1=atan2(y1,x1);
	double a2=atan2(y2,x2);
	double a3=cos(alpha);
	double a4=sin(alpha);
	MatrixXd temp1(3,3);
	temp1<<a3,-a4,0,a4,a3,0,0,0,1;
	MatrixXd temp2(3,3);
	temp2=temp1.inverse();
	MatrixXd temp3(3,1);
	temp3<<x1,y1,a1;
	MatrixXd temp4(3,3);
	temp4<<1,0,0,0,1,0,0,0,1;
	MatrixXd temp5(3,1);
	temp5<<x2,y2,a2;
	MatrixXd temp6(3,1);
	temp6=temp2*(temp3-temp4*temp5);
	aaa=temp6(0,0);
	bbb=temp6(1,0);

	double rEndx=fabs(aaa);
	double rEndy=fabs(bbb);
	double rEnd=sqrt((rEndx * rEndx)+(rEndy * rEndy));
	if(rEndx==0)
	{
		if(bbb>y)
		{
			attractangle=PI / 2;
		}
		else
		{
			attractangle=-(PI / 2);
		}
	}
	else
	{
		attractangle=atan2((bbb),(aaa));
	}

	//计算斥力
	int num;
	double aa=get_min_distance_in_range(laser, -90, 90, num);
	//cout<<num<<endl;
	int num1= num;
	if (aa>p)
	{
		xconpulsive=0;
		yconpulsive=0;
		conpulsive=0;
	}
	else
	{
		if(aa>(p/2))
		{
			conpulsive=c * ((1/aa)-(1/p)) * (1/(aa * aa));
            conangle=laser.angle_min+num1 * laser.angle_increment;
			if (conangle>PI)
		    {	
			    conangle-=2*PI;
			}
		    else if (conangle<-PI)
			{
			    conangle+=2*PI;
			}
			xconpulsive=-conpulsive * cos(conangle);
			yconpulsive=-conpulsive * sin(conangle);
		}
		if(aa>0.6&&aa<(p/2))
		{
			conpulsive=c * c * ((1/aa)-(1/p)) * (1/(aa * aa));
            conangle=laser.angle_min+num1 * laser.angle_increment;
			if (conangle>PI)
		    {
			    conangle-=2*PI;
			}
		    else if (conangle<-PI)
			{
			    conangle+=2*PI;
			}
			xconpulsive=-conpulsive * cos(conangle);
			yconpulsive=-conpulsive * sin(conangle);
		}
	}

	attractive=k * rEnd;
	xattractive=k * rEnd * cos(attractangle);
	yattractive=k * rEnd * sin(attractangle);

	//计算合力(引力与斥力的合力)激光雷达可避障；
	xsum=xattractive+xconpulsive;
	ysum=yattractive+yconpulsive;
	angle=atan2(ysum,xsum);
	Fsum=xsum/cos(angle);
	Fsum=limit(Fsum,0,max_speed);
	newspeed=Fsum;
	newspeed = limit(Fsum, -max_speed, max_speed);
	newturnrate=angle;
	newturnrate = limit(newturnrate, -max_turning_speed_rad, max_turning_speed_rad);
	
	//计算合力(引力的合力)激光雷达不可避障；
	xsum_by_k=xattractive;
	ysum_by_k=yattractive;
	angle_by_k=atan2(ysum_by_k,xsum_by_k);
	Fsum_by_k=xsum_by_k/cos(angle_by_k);
	Fsum_by_k=limit(Fsum_by_k,0,max_speed);
	newspeed_by_k=Fsum_by_k;
	newspeed_by_k = limit(Fsum_by_k, -max_speed, max_speed);
	newturnrate_by_k=angle_by_k;
	newturnrate_by_k = limit(newturnrate_by_k, -max_turning_speed_rad, max_turning_speed_rad);

	if(sqrt((x1-x)*(x1-x)+(y1-y)*(y1-y))<0.1)//||(status_slow==0&&status_stop==0))
	{
		cmd_vel.linear.x = 0.0;  
		cmd_vel.linear.y = 0.0;
		cmd_vel.linear.z = 0.0;
		cmd_vel.angular.x = 0.0;
		cmd_vel.angular.y = 0.0;
		cmd_vel.angular.z = 0.0;
	}
	else if(sqrt((x1-x)*(x1-x)+(y1-y)*(y1-y)) >= 0.3 && sqrt((x1-x)*(x1-x)+(y1-y)*(y1-y)) < 2.8){
		cmd_vel.linear.x = newspeed_by_k*0.5;
		cmd_vel.linear.y = 0.0;
		cmd_vel.linear.z = 0.0;
		cmd_vel.angular.x = 0.0;
		cmd_vel.angular.y = 0.0;
		cmd_vel.angular.z = newturnrate_by_k*0.5;
	}
	else
	{
		cmd_vel.linear.x = newspeed*0.5;
		cmd_vel.linear.y = 0.0;
		cmd_vel.linear.z = 0.0;
		cmd_vel.angular.x = 0.0;
		cmd_vel.angular.y = 0.0;
		cmd_vel.angular.z = newturnrate*0.5;
	}
	cmd_vel_pub.publish(cmd_vel);
        cout<<"cmd_vel"<<endl;
}


//回调函数
void autonomous_behave(const sensor_msgs::LaserScan &laser1)
{
    laser=laser1;
}

 bool checkpose(robot_msgs::nav_goal::Request& req,
				 	  robot_msgs::nav_goal::Response& res)
{
    double a1;
    double a2;
    double a3;
    double a4;
	double reqalpha;

    a=req.x;
    b=req.y;
	reqalpha= req.th/180*PI;
	if(reqalpha>PI){
		reqalpha=reqalpha-2*PI;
		reqalpha=-reqalpha;
	}else{
		reqalpha=-reqalpha;
	}
	reqalpha_by = reqalpha;
    ros::Rate rate(30);
    while(sqrt((a-x)*(a-x)+(b-y)*(b-y))>0.3)
    {
	ROS_INFO("th : %f tY : %f",reqalpha,sqrt((a-x)*(a-x)+(b-y)*(b-y)));
        zby_k(a,b,x,y);
        rate.sleep();
    }
    	while ((reqalpha-alpha)>0.2||(reqalpha-alpha)<-0.2)
	//while ((reqalpha-alpha)>1.57||(reqalpha-alpha)<-1.57)
	{
		if(reqalpha_by>1.5 || reqalpha_by <-1.5){
			if(alpha_by < 0){
				alpha_by = alpha_by + 6.3;
			}else{
				alpha_by = alpha_by;
			}
				
			if(reqalpha_by < 0){
				reqalpha_by = reqalpha_by + 6.3;
			}else{
				reqalpha_by = reqalpha_by;
			}
		}else{
			alpha_by = alpha_by + 3.15;
			reqalpha_by = reqalpha_by + 3.15;
		}
		//code for loop body 
    	cmd_vel.linear.x = 0.0;
		cmd_vel.linear.y = 0.0;
		cmd_vel.linear.z = 0.0;
		cmd_vel.angular.x = 0.0;
		cmd_vel.angular.y = 0.0;

		newturnrate_by = (reqalpha_by - alpha_by)*1.7;
		newturnrate_by = limit(newturnrate_by, -max_turning_speed_rad, max_turning_speed_rad);
		cmd_vel.angular.z = newturnrate_by;
		cmd_vel_pub.publish(cmd_vel);
	}
        cmd_vel.linear.x = 0.0;
		cmd_vel.linear.y = 0.0;
		cmd_vel.linear.z = 0.0;
		cmd_vel.angular.x = 0.0;
		cmd_vel.angular.y = 0.0;
		cmd_vel.angular.z = 0.0;
	    cmd_vel_pub.publish(cmd_vel);
    res.success = 1;
	ROS_INFO("*******END-SUCCEED********");
	return 1;
}


int main(int argc, char **argv)
{
    ros::init(argc, argv, "robot_artificial");
    ros::NodeHandle nh;
    cmd_vel_pub = nh.advertise<geometry_msgs::Twist>("cmd_vel", 1);
    ros::ServiceServer service = nh.advertiseService("artificial", checkpose);
	ros::Subscriber laser_sub = nh.subscribe("scan", 1, autonomous_behave);
	
    ros::Subscriber acml_sub = nh.subscribe<robot_msgs::dgps>("ZGPS", 100, callback);
    ros::AsyncSpinner spinner(3); 
    spinner.start();
    ros::waitForShutdown();
    return 0;
}
