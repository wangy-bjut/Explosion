#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @File   : gas_alarm
# @Time   : 2023/2/16 17:26
# @Author : huangqifan


import minimalmodbus
import time  # 控制激光发射频率时会用
import rospy
from robot_msgs.srv import Gas_alarm, Gas_alarmResponse

class GasAlarm():
    def __init__(self, port):
        self.__gas_concentration_int = 0
        self.__instrument = minimalmodbus.Instrument(port, 1, debug=False)
        self.__instrument.serial.baudrate = 9600
        self.__instrument.serial.timeout = 1

    def get_value(self):
        gas_concentration = self.__instrument.read_registers(0, 1, 3)
        time.sleep(0.2)
        self.__gas_concentration_int = gas_concentration[0]
        return self.__gas_concentration_int

def handle_gas_alarm(req):
    # 处理服务请求
    if req.start:
        gas_alarm = GasAlarm(PORT_LASER)
        gas_value = gas_alarm.get_value()
        response = Gas_alarmResponse(result=gas_value)
        return response

if __name__ == '__main__':
    rospy.init_node('gas_alarm_server')

    PORT_LASER = rospy.get_param('gas_alarm_server/Serial_Port', '/dev/ttygas')
    gas_alarm = GasAlarm(PORT_LASER)
    service = rospy.Service('gas_alarm', Gas_alarm, handle_gas_alarm)

    rospy.spin()
