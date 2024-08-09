#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @File   : gas_alarm
# @Time   : 2023/2/16 17:26
# @Author : huangqifan


import minimalmodbus
import time  # 控制激光发射频率时会用
import rospy
from robot_msgs.srv import Gas_alarm,Gas_alarmResponse


class Gas_alarm():
    def __init__(self, PORT_LASER):
        self.__gas_concentration_int = 0
        self.__instrument = minimalmodbus.Instrument(PORT_LASER, 1, debug=False)  # debug输出协议的发送输出  #从机地址   #寄存器地址可以在exe程序处通过配置当前地址修改
        self.__instrument.serial.baudrate = 9600
        self.__instrument.serial.timeout = 1

    def get_value(self):
        
        gas_concentration = self.__instrument.read_registers(0, 1, 3)                         # 功能码  01 03 00 00 00 01 84 0A  返回的是浓度信息
        time.sleep(0.2)  # 避免发送过快
        
        self.__gas_concentration_int = gas_concentration[0]
        
        return self.__gas_concentration_int
    def my_service_callback(self, request):  # 参数request是服务请求消息对象的实例，你可以使用它来访问服务请求消息中的数据，从而执行所需的操作
        # 无论调用的服务需不需要传参，此处回调函数的request参数不能取消  填response也可
        # 处理服务请求
        if request.start:
            my_variable = self.get_value()  # 返回距离
            response = Gas_alarmResponse()
            response.result = my_variable
        return response

if __name__ == '__main__':
    rospy.init_node('gas_alarm_server')
    
    PORT_LASER = rospy.get_param('gas_alarm_server/Serial_Port', '/dev/ttygas')
    t = Gas_alarm(PORT_LASER)
    service = rospy.Service('gas_alarm', Gas_alarm, t.my_service_callback)   # gas_alarm_service是服务消息类型  根据上面import的
    rospy.spin()
