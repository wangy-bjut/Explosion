#!/usr/bin/env python
# -*- encoding: utf-8 -*-

import minimalmodbus
import time  # 控制激光发射频率时会用
import rospy
from alarm_device.srv import alarm_srv, alarm_srvResponse  # my_package.srv是指my_package文件夹下的srv而不是MyService.srv文件

PORT_LASER = "/dev/ttyUSB5 "


class Alarm_device():
    def __init__(self):
        self.__volume = 0
        self.__loop_mode = 0
        self.__play_status = 0
        self.__current_play = 0
        self.__instrument = minimalmodbus.Instrument(PORT_LASER, 1,
                                                     debug=True)
        self.__instrument.serial.baudrate = 9600
        self.__instrument.serial.timeout = 1

    # 读取寄存器
    def read_volume(self):
        read_volume = self.__instrument.read_registers(1, 1, 3)
        self.__volume = read_volume[0]
        # print(self.__volume)
        return self.__volume

    def read_loop_mode(self):
        read_loop_mode = self.__instrument.read_registers(2, 1, 3)
        self.__loop_mode = read_loop_mode[0]
        # print(self.__loop_mode)
        return self.__loop_mode

    def read_play_status(self):
        read_play_status = self.__instrument.read_registers(3, 1, 3)
        self.__play_status = read_play_status[0]
        # print(self.__play_status)
        return self.__play_status

    def read_current_play(self):
        read_current_play = self.__instrument.read_registers(4, 1,
                                                             3)
        self.__current_play = read_current_play[0]
        # print(self.__current_play)
        return self.__current_play

    def start_play(self):
        start_play = self.__instrument.write_register(registeraddress=1, value=1,
                                                      functioncode=6)
        time.sleep(0.8)

    def pause_play(self):
        pause_play = self.__instrument.write_register(registeraddress=3, value=1, functioncode=6)
        time.sleep(0.3)

    def stop_play(self):
        stop_play = self.__instrument.write_register(registeraddress=3, value=1,
                                                     functioncode=6)
        time.sleep(0.3)

    def set_max_volume(self):
        set_max_volume = self.__instrument.write_register(registeraddress=4, value=30,
                                                          functioncode=6)
        time.sleep(0.3)

    def set_play_volume(self, volume):
        if 30 >= volume >= 0:
            set_play_volume = self.__instrument.write_register(registeraddress=4, value=volume,
                                                               functioncode=6)
            time.sleep(0.3)
        else:
            print("输入的音量值不在0-30之间")

    def increase_volume(self):       # 只能每次加1
        increase_volume = self.__instrument.write_register(registeraddress=5, value=1,
                                                           functioncode=6)
        time.sleep(0.3)

    def reduce_volume(self):
        reduce_volume = self.__instrument.write_register(registeraddress=6, value=1,
                                                         functioncode=6)
        time.sleep(0.3)

    def set_play_filename(self, filename):
        set_play_filename = self.__instrument.write_register(registeraddress=14, value=filename,
                                                             functioncode=6)
        time.sleep(0.8)

    def set_play_fileorder(self, fileorder):
        set_play_fileorder = self.__instrument.write_register(registeraddress=7, value=fileorder,
                                                              functioncode=6)
        time.sleep(0.8)

    def set_loop_mode(self, mode):
        set_loop_mode = self.__instrument.write_register(registeraddress=9, value=mode,
                                                         functioncode=6)
        time.sleep(0.3)

    def previous_audio(self):
        previous_audio = self.__instrument.write_register(registeraddress=15, value=1,
                                                          functioncode=6)
        time.sleep(0.9)

    def next_audio(self):
        next_audio = self.__instrument.write_register(registeraddress=16, value=1,
                                                      functioncode=6)
        time.sleep(0.8)

    def combined_play(self, num1, num2,
                      num3):
        combined_play = self.__instrument.write_registers(registeraddress=1, values=[num1, num2,
                                                                                     num3])  #1  50  51

    def combined_two_play(self, num1,
                          num2):
        combined_two_play = self.__instrument.write_registers(registeraddress=1, values=[num1,
                                                                                         num2])
 
    def end_combined_play(self):
        end_combined_play = self.__instrument.write_register(registeraddress=13, value=1, functioncode=6)


def alarm_service_callback(request):
    alarm_device = Alarm_device()

    # try:
    if request.start_play == 1:  # 0 忽略
        alarm_device.start_play()  # 1 播放
    elif request.start_play == -1:  # -1 暂停
        alarm_device.stop_play()
    if request.volume:    # 1-30
        alarm_device.set_play_volume(request.volume)
        time.sleep(0.4)
    if request.loop_mode:
        if request.loop_mode == 1:  # 单曲循环
            alarm_device.set_loop_mode(1)
        if request.loop_mode == 2:  # 单曲停止
            alarm_device.set_loop_mode(2)
        time.sleep(0.4)
    if request.change_valume == 1:  # 增大音量
        alarm_device.increase_volume()
        time.sleep(0.4)
        alarm_device.set_play_filename(46)
    elif request.change_valume == -1:  # 减小音量
        alarm_device.reduce_volume()
        time.sleep(0.4)
        alarm_device.set_play_filename(47)
    if request.change_playfile == 1:  # 1 下一曲
        alarm_device.next_audio()  # 1 播放
    elif request.change_playfile == -1:  # 1 上一曲
        alarm_device.previous_audio()
    if request.filename:
        alarm_device.set_play_filename(request.filename)
        time.sleep(0.4)
    if request.fileorder:   # 文件存入顺序
        alarm_device.set_play_fileorder(request.fileorder)
        time.sleep(0.4)
    if request.num1 != 0 and request.num2 != 0:
        alarm_device.combined_two_play(request.num1, request.num2)
        time.sleep(2)  # 需要超过组合音频时常，否则音频会被截断
        alarm_device.end_combined_play()
    time.sleep(0.4)
    response = alarm_srvResponse()
    response.volume = alarm_device.read_volume()
    time.sleep(0.5)  # # 必须有
    response.loop_mode = alarm_device.read_loop_mode()  # 1单曲循环，2单曲停止
    time.sleep(0.5)
    response.current_play = alarm_device.read_current_play()  # 读到的是存放顺序
    time.sleep(0.5)
    response.play_status = alarm_device.read_play_status()  # 1播放，0关闭
    # except minimalmodbus.NoResponseError:
    # 发生NoResponseError异常时执行的代码
    # print("与仪器通信失败，无响应")
    # response.result2  值尚未定义
    response.result = 1
    text = '播放完成'
    #text = u'\u64AD\u653E\u5B8C\u6210'
    response.result_str = text  #.encode('utf-8')     # .encode('utf-8').decode('unicode_escape')
    print(response.result_str)
    return response


if __name__ == "__main__":
    alarm_device = Alarm_device()
    # 初始化
    alarm_device.set_play_volume(5)
    time.sleep(0.5)
    alarm_device.set_loop_mode(2)
    time.sleep(0.5)
    rospy.init_node('alarm_device')
    service = rospy.Service('alarm_service', alarm_srv, alarm_service_callback)  # MyService是服务消息类型
    rospy.spin()
