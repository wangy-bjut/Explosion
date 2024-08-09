/*
 * @Description: 
 * @Author: chaohui_chen
 * @Date: 2022-11-01 19:51:26
 * @LastEditTime: 2022-11-09 20:43:38
 * @LastEditors: chaohui_chen
 */

#ifndef Robot_MANAGER_H 
#define Robot_MANAGER_H

#include "ros/ros.h"
#include "serial/serial.h"
#include "boost/bind.hpp"
#include "boost/thread/thread.hpp"
#include "boost/thread/mutex.hpp" 
#include <iostream>
#include <sstream>
#include<robot_msgs/ackerman_control.h>
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>
#include <robot_msgs/camera.h>
#include <robot_msgs/chasis.h>
#include <sensor_msgs/JointState.h>


class RobotException: public std::exception
{
public:
	explicit RobotException (std::string error):m_errString(error){}	
	std::string m_errString;
	virtual const char* what()
	{
		return m_errString.c_str();
	}
	virtual ~RobotException () throw(){}

};

class RobotManager
{
public:
	RobotManager(std::string port="/dev/ttyUSB0");	
	virtual ~RobotManager() throw();	
	bool get_rpm(std::vector<signed int>& rpm);	
	std::vector<signed int> curr_rpm;	
	void set_goal_rpm(std::vector<signed int> rpm);	
	void set_goal_control(robot_msgs::cloud_control control);	
private:
	bool new_exe[3];
  	serial::Serial* m_serial;	
	std::string m_port;	
	bool flag;	
	boost::thread m_query_thread;	
	void query();	
	boost::mutex g_mutex;	
	boost::thread m_set_thread;	
	bool set_flag;	
	void set();	
	std::vector<signed int> goal_rpm;	
	robot_msgs::cloud_control goal_control;
	bool set_rpm(std::vector<signed int> rpm);	
	bool set_control(robot_msgs::cloud_control control);
	void analyze_msg(std::vector<signed int> data);
	void byte_set();
	void set_check(uint8_t *data, int len);	

	uint8_t cmd_data[13] = {0xAA, 0X55, 0X09, 0X02, 0X00, 0X00, 0X00, 0X00, 0X00, 0X00, 0X00, 0X00, 0X00};	
	uint8_t cam_control[13] = {0xAA, 0X55, 0X09, 0X04, 0X00, 0X00, 0X00, 0X00, 0X00, 0X00, 0X00, 0X00, 0X00};
	uint8_t heart_beat[10] = {0xAA, 0x55, 0x06, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07};		
	uint8_t double_11[13] = {0xAA, 0X55, 0X09, 0X05, 0X02, 0X00, 0X00, 0X00, 0X00, 0X00, 0X00, 0X00, 0X0E};		
	uint8_t template_data[2]={0xAA,0x55};	
	std::vector<uint8_t*> get_datas;	

	std::map<std::string, uint8_t> byte2;
	std::map<std::string, uint8_t> byte3;	
};

#endif //Robot_MANAGER_H