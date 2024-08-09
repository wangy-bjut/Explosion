# -*- coding: utf-8 -*-
# @File   : alarm_device
# @Time   : 2023/3/31 1:27
# @Author : huangqifan
# !/usr/bin/env python3
# -*- encoding: utf-8 -*-

import minimalmodbus
import time  # 控制激光发射频率时会用

PORT_LASER = "/dev/ttyalarm"


class Alarm_device:
    def __init__(self):
        self.__volume = 0
        self.__loop_mode = 0
        self.__play_status = 0
        self.__current_play = 0
        self.__instrument = minimalmodbus.Instrument(PORT_LASER, 1,
                                                     debug=True)  # debug输出协议的发送输出  #从机地址   #寄存器地址可以在exe程序处通过配置当前地址修改
        self.__instrument.serial.baudrate = 9600
        self.__instrument.serial.timeout = 1

    # 读取寄存器
    def read_volume(self):
        read_volume = self.__instrument.read_registers(1, 1, 3)  # 读取当前音量  01 03 00 01 00 01 D5 CA     输出音量值1
        self.__volume = read_volume[0]  # MODBUS_RTU协议输出列表有且只有一个元素即为所10进制需值，不用像485协议一样截取后在在转换为10进制
        # print(self.__volume)
        return self.__volume

    def read_loop_mode(self):
        read_loop_mode = self.__instrument.read_registers(2, 1, 3)  # 读取当前循环模式  01 03 00 02 00 01 25 CA  输出为1  单曲循环
        self.__loop_mode = read_loop_mode[0]
        # print(self.__loop_mode)
        return self.__loop_mode

    def read_play_status(self):
        read_play_status = self.__instrument.read_registers(3, 1, 3)  # 读取当前播放状态  01 03 00 03 00 01 74 0A   输出为0
        self.__play_status = read_play_status[0]
        # print(self.__play_status)
        return self.__play_status

    def read_current_play(self):
        read_current_play = self.__instrument.read_registers(4, 1, 3)  # 读取当前曲目号  01 03 00 04 00 01 C5 CB     输出1(
        # 曲目所在位置，而非名字,从1开始)
        self.__current_play = read_current_play[0]
        # print(self.__current_play)
        return self.__current_play

    #  写单个保持寄存器 06H                                   # 必须有参数名=  直接写参数值报文错误
    def start_play(self):
        start_play = self.__instrument.write_register(registeraddress=1, value=1, functioncode=6)
        # 播放   01 06 00 01 00 01 19 CA
        time.sleep(0.8)  # 正好读完  一帆风顺

    def pause_play(self):
        pause_play = self.__instrument.write_register(registeraddress=3, value=1, functioncode=6)  # 暂停
        time.sleep(0.3)

    def stop_play(self):
        stop_play = self.__instrument.write_register(registeraddress=3, value=1,
                                                     functioncode=6)  # 停止   01 06 00 03 00 01 B8 0A
        time.sleep(0.3)

    def set_max_volume(self):  # 直接设置最大音量
        set_max_volume = self.__instrument.write_register(registeraddress=4, value=30,
                                                          functioncode=6)  # 音量设置 设置音量值为10 01 06 00 04 00 0A 48 0C
        time.sleep(0.3)  # 必须有不然连续发送会报错

    def set_play_volume(self, volume):  # 需要传入音量值0-30
        if 30 >= volume >= 0:
            set_play_volume = self.__instrument.write_register(registeraddress=4, value=volume,
                                                               functioncode=6)  # 音量设置 设置音量值为10 01 06 00 04 00 0A 48 0C
            time.sleep(0.3)  # 必须有不然连续发送会报错
        else:
            print("输入的音量值不在0-30之间")

    def increase_volume(self):  # 音量加2
        increase_volume = self.__instrument.write_register(registeraddress=5, value=2,
                                                           functioncode=6)  # 音量在当前基础加1   01 06 00 05 00 01 58 0B
        time.sleep(0.3)  # 必须有不然连续发送会报错

    def reduce_volume(self):  # 音量减2
        reduce_volume = self.__instrument.write_register(registeraddress=6, value=2,
                                                         functioncode=6)  # 音量在当前基础减1   01 06 00 06 00 01 A8 0B
        time.sleep(0.3)  # 必须有不然连续发送会报错

    def set_play_file(self, file):  # file 为文件名字  整形
        # 指定文件播放-5个数字-最大5000  （0E）

        set_play_file = self.__instrument.write_register(registeraddress=14, value=file,
                                                         functioncode=6)  # 播放以00001命名开头的文件   01 06 00 0E C3 4F F9 0D
        time.sleep(0.8)  # 必须有不然连续发送会报错
        # gas_concentration3 = self.__instrument.write_register(registeraddress=3,value=1,functioncode=6)   #  停止
        # time.sleep(0.3)   # 必须有不然连续发送会报错

        # 循环模式设定（09）

    def set_loop_mode(self, mode):  # 0全盘顺序循环播放 1单曲循环    2播完当前曲目停止    04目录循环05目录随机切换目录在软件
        set_loop_mode = self.__instrument.write_register(registeraddress=9, value=mode,
                                                         functioncode=6)  # 循环模式设定   01 06 00 09 00 01 98 08
        time.sleep(0.3)  # 必须有不然连续发送会报错
        # 全盘循环(00)：按顺序播放全盘曲目,播放完后循环播放  单曲循环(01)：一直循环播放当前曲目 单曲停止(02)：播放完当前曲目一次停止  目录循环用不到

    def previous_audio(self):  # 上一曲 （0F）  # 参数值不可更改
        previous_audio = self.__instrument.write_register(registeraddress=15, value=1,
                                                          functioncode=6)  # 上一曲01 06 00 0F 00 01 78 09
        time.sleep(0.9)  # 必须有不然连续发送会报错

    def next_audio(self):  # 下一曲 （10）  # 参数值不可更改
        next_audio = self.__instrument.write_register(registeraddress=16, value=1,
                                                      functioncode=6)  # 下一曲01 06 00 10 00 01 49 CF
        time.sleep(0.8)  # 必须有不然连续发送会报错
        # gas_concentration3 = self.__instrument.write_register(registeraddress=3,value=1,functioncode=6)   #  停止

    # ----------------------------------------------------------------
    # 写多个保持寄存器 10H     如下为组合目录 ZH 文件夹内的 01.MP3、02.MP3、03.MP3
    # 组合播放指令（01）                                                                             寄存器地址为1
    def combined_play(self, num1, num2,
                      num3):  # 以组合三个为例                                                           指令：ID 10 00 01 (
        # 寄存器数量高字节+寄存器数量低字节+字节数+00 XX ...) CRC_L CRC_H combined_play = self.__instrument.write_registers(
        # registeraddress=1,values=[1,2,3])   #  写多个保持寄存器  01 10 00 01 00 03 06 00 01 00 02 00 03 6B 44
        combined_play = self.__instrument.write_registers(registeraddress=1, values=[num1, num2,
                                                                                     num3])  # 写多个保持寄存器  01 10 00 01
        # 00 03 06 00 01 00 02 00 03 6B 44
        # 4M空间内新建ZH文件夹，音频名必须为两位数字，如 01.MP3、02.MP3、 03.MP3   该命令连续播放根目录 ZH 文件夹内的 01.MP3、02.MP3、03.MP3

    def combined_two_play(self, num1,
                          num2):  # 组合播放2个                                                         指令：ID 10 00 01 (
        # 寄存器数量高字节+寄存器数量低字节+字节数+00 XX ...) CRC_L CRC_H
        combined_two_play = self.__instrument.write_registers(registeraddress=1, values=[num1,
                                                                                         num2])  # 写多个保持寄存器  01 10 00
        # 01 00 03 06 00 01 00 02 00 03 6B 44
        # 4M空间内新建ZH文件夹，音频名必须为两位数字，如 01.

    def end_combined_play(self):  # 结束组合播放（0D）
        end_combined_play = self.__instrument.write_register(registeraddress=13, value=1,
                                                             functioncode=6)  # 01 06 00 0D 00 01 D9 C9


if __name__ == "__main__":
    # '''调用组合
    t = Alarm_device()
    # a=t.set_loop_mode(2)
    t.set_play_volume(1)
    time.sleep(0.4)
    t.combined_two_play(1, 50)
    # time.sleep(0.4)   #  这个不能有有的话会出现播放后又重新开始播放
    # t.start_play()
    time.sleep(1.0)
    if t.read_play_status() == 1:
        t.end_combined_play()
    time.sleep(0.4)
    # t.stop_play()
    # '''
