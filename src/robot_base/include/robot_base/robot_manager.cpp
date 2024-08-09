
#include "robot_manager.h"

#define L 0.975

RobotManager::RobotManager(std::string port):m_port(port) 
{
	m_serial = new serial::Serial(m_port, 115200, serial::Timeout::simpleTimeout(1000));	
	get_datas = std::vector<uint8_t*>(3,NULL);
	curr_rpm = std::vector<signed int>(2, 0);
	byte_set();	
	if(!m_serial) throw RobotException("open error on port:" + m_port);
	for(int i = 0; i < sizeof(new_exe); i++)
		new_exe[i] = false;
	m_set_thread = boost::thread(boost::bind(&RobotManager::set, this));
	m_query_thread = boost::thread(boost::bind(&RobotManager::query, this));
}

RobotManager::~RobotManager() throw()
{
	if(flag) flag = false;	
	m_query_thread.join();	
	if(set_flag) set_flag = false;	
		m_set_thread.join();

	if(m_serial){
		m_serial->close();
		delete m_serial;
		m_serial = NULL;
	}

	for(int i = 0; i < get_datas.size(); i++)
		delete[] get_datas[i];
	get_datas.clear();
}

void RobotManager::query() 
{
    flag = true;
	while(flag){
		std::vector<signed int> tem_rpm (2, 0);
		if(get_rpm(tem_rpm)) curr_rpm = tem_rpm;			
		usleep(70*1000);
	}	
}

void RobotManager::set_goal_rpm(std::vector<signed int> rpm)
{
    goal_rpm = rpm;
}

void RobotManager::set_goal_control(robot_msgs::cloud_control control)
{
	goal_control = control;
}

void RobotManager::set()
{
    set_flag = true;
    while(set_flag){
        set_rpm(goal_rpm);
		set_control(goal_control);
        usleep(50*1000);
    }
}



bool RobotManager::get_rpm(std::vector<signed int>& rpm)
{		
	boost::mutex::scoped_lock lock(g_mutex);	
	size_t n = m_serial->available();
	if(n!=0)
	{
		uint8_t buffer[1024];
		n = m_serial->read(buffer, n);
		if (n != 61)
		{
			rpm[0] = 0;
			rpm[1] = 0;
			lock.unlock();
			return false;
		}
		int i =0;
		int lin_vel=0;
		int arg_vel=0;
		int index=0;
		int vector_index = 0;
		while(i<100)
		{
			if(index==2)
			{
				if(!new_exe[vector_index])
				{
					get_datas[vector_index] = new uint8_t[buffer[i]];
					new_exe[vector_index] = true;
				}
				for (int j = 0; j <= buffer[i]; j++)
					get_datas[vector_index][j] = buffer[i+j];
				
				vector_index++;

				for (int j = 0; j <= buffer[i]; j++)
        			std::cout<<(get_datas[vector_index-1][j] & 0xFF)<<" ";
				std::cout<<std::endl;

				if (vector_index == 3)
					break;
				else
					index = 0;
				i += buffer[i];
			}
			else if(buffer[i]==template_data[index])
				index++;
			else if(index >= 1)
			{
				i -= index;
				index = 0;
			}
			else
				index = 0;
			i++;
		}

		rpm[0] = get_datas[1][6] + (get_datas[1][7] << 8) + (get_datas[1][8] << 16) + (get_datas[1][9] << 24);
		rpm[1] = get_datas[1][2] + (get_datas[1][3] << 8) + (get_datas[1][4] << 16) + (get_datas[1][5] << 24);

		if(rpm[0] >> 31)	rpm[0] -= (0x01 << 32);
		if(rpm[1] >> 31)	rpm[1] -= (0x01 << 32);

		rpm[0] = tan(rpm[0] / 1000.0) * rpm[1] / L;
	}
	else
	{
		rpm[0] = 0;
		rpm[1] = 0;
		lock.unlock();
		return false;
	}
	lock.unlock();
	return true;
}

bool RobotManager::set_rpm(std::vector<signed int> rpm)
{
	boost::mutex::scoped_lock lock(g_mutex);	

	if(rpm.size() != 2) return false;
	std::cout<<"rpm0"<<"\t"<<rpm[0]<<std::endl;
	std::cout<<"rpm1"<<"\t"<<rpm[1]<<std::endl;
	analyze_msg(rpm);
	set_check(cmd_data, sizeof(cmd_data));	
	m_serial->write(cmd_data, sizeof(cmd_data));	
	usleep(2 * 1000);
	m_serial->write(heart_beat, sizeof(heart_beat));	
	usleep(20 * 1000);
	m_serial->write(double_11, sizeof(double_11));	
	usleep(4 * 1000);
	lock.unlock();	
	return true;
}

bool RobotManager::set_control(robot_msgs::cloud_control control)
{
	boost::mutex::scoped_lock lock(g_mutex);	

	cam_control[4] = byte2[control.direction];
	uint8_t Byte = 0x00;
	if(control.light)	Byte += byte3["light"];
	if(control.scrub)	Byte += byte3["scrub"];
	if(control.zero)	Byte += byte3["zero"];
	cam_control[5] = Byte;
	cam_control[8] = int(control.angular_percent);
	cam_control[9] = int(control.angular_percent);
	set_check(cam_control, sizeof(cam_control));
	m_serial->write(cam_control, sizeof(cam_control));	
	usleep(2 * 1000);
	m_serial->write(heart_beat, sizeof(heart_beat));	
	usleep(20 * 1000);
	m_serial->write(double_11, sizeof(double_11));	
	usleep(4 * 1000);
	lock.unlock();	
	return true;
}

void RobotManager::set_check(uint8_t *data, int len)
{
	uint8_t back_check = 0x00;

    for (int i = 2; i <  len - 1; i++)
    {
        back_check ^= data[i];
    }
    data[len-1] = back_check;
}

void RobotManager::analyze_msg(std::vector<signed int> data)
{
    std::cout<<data[0] <<" "<< data[1]<<std::endl;
    cmd_data[11] = (data[0] & 0xff000000) >> 24;
    cmd_data[10] = (data[0] & 0x00ff0000) >> 16;
    cmd_data[9] = (data[0] & 0x0000ff00) >> 8;
    cmd_data[8] = (data[0] & 0x000000ff) >> 0;

    cmd_data[7] = (data[1] & 0xff000000) >> 24;
    cmd_data[6] = (data[1] & 0x00ff0000) >> 16;
    cmd_data[5] = (data[1] & 0x0000ff00) >> 8;
    cmd_data[4] = (data[1] & 0x000000ff) >> 0;
}

void RobotManager::byte_set()
{
	byte2.insert(std::pair<std::string, uint8_t>("up", 0x01));
	byte2.insert(std::pair<std::string, uint8_t>("down", 0x02));
	byte2.insert(std::pair<std::string, uint8_t>("left", 0x04));
	byte2.insert(std::pair<std::string, uint8_t>("right", 0x08));
	byte2.insert(std::pair<std::string, uint8_t>("stop", 0x00));
	byte2.insert(std::pair<std::string, uint8_t>("foci+", 0x10));
	byte2.insert(std::pair<std::string, uint8_t>("foci-", 0x20));

	byte3.insert(std::pair<std::string, uint8_t>("zero", 0x01));
	byte3.insert(std::pair<std::string, uint8_t>("light", 0x02));
	byte3.insert(std::pair<std::string, uint8_t>("scrub", 0x04));
}
