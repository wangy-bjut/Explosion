#!/usr/bin/env python3

import time
import hk_sdk as hk_sdk
import hk_class as hkclass
import time  
import rospy
from robot_msgs.srv._temp_detection import temp_detection, temp_detectionResponse

class Camera_temp():
	def __init__(self):
		self.__height=383

		self.__weight=387
	
		self.__channel_no = 1 
		self.__x=100
		self.__y=100
		self.__points=[[0,0],[383,387]] 
	def login(self):
		result = hk_sdk.init()
		if not result:
			print('chu shi hua cuo wu: ', hk_sdk.get_last_error())
			return False
		user_id = hk_sdk.login(b"192.168.1.65", 8000, b"admin", b"abc12345")
		if user_id == -1:
			print('deng lu cuo wu: ', hk_sdk. get_last_error())
			return False
		return user_id


	def point_temperature(self):           #,x,y,height,weight,user_id, channel_no
		weight=self.__height
		height=self.__weight

		channel_no = self.__channel_no
		x=self.__x
		y=self.__y
		user_id=self.login()
		result, temperature = hk_sdk.get_temperature(100, 100, 384, 388, user_id, channel_no)
		if result:
			print("temp:", temperature)
			return temperature
		else:
			print("huo qu wen du cuo wu ", temperature, "error: ", hk_sdk.get_last_error())
			return False
         
         
    
	def surface_temperature(self):   #,points,height,weight,user_id, channel_no
		weight=self.__height
		height=self.__weight

		channel_no = self.__channel_no
		points=self.__points
		user_id=self.login()           
		result, temperature = hk_sdk.get_temperature_max(points, 384, 388, user_id, channel_no)
		if result:
			print("temp:", temperature)
			return temperature
		else:
			print("huo qu wen du cuo wu ", temperature, "error: ", hk_sdk.get_last_error())
			return False

	def logout(self):
		user_id=self.login() 	

		hk_sdk.logout(user_id)
    	
		hk_sdk.cleanup()

def my_service_callback(request): 
    #my_variable = request.my_variable
	if request.start==True:
		camera_temp=Camera_temp()
		temperature=camera_temp.surface_temperature() 
		#######print("temperauture",temperature)
		response = temp_detectionResponse()
		response.temp = temperature
		
		if temperature>100:
			print("bao jing")
			time.sleep(10)  
		camera_temp.logout()
		return response
	

if __name__ == "__main__":
    rospy.init_node('camera_temp')
    service = rospy.Service('temperature', temp_detection, my_service_callback)   
    rospy.spin()
















