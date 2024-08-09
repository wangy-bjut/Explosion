#!/usr/bin/env python
# -*- encoding: utf-8 -*-

import minimalmodbus
import time  # 控制激光发射频率时会用

PORT_LASER = "/dev/ttyUSB5"


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

    def increase_volume(self):
        increase_volume = self.__instrument.write_register(registeraddress=5, value=2,
                                                           functioncode=6)
        time.sleep(0.3)

    def reduce_volume(self):
        reduce_volume = self.__instrument.write_register(registeraddress=6, value=2,
                                                         functioncode=6)
        time.sleep(0.3)

    def set_play_file(self, file):
        self.__instrument.write_register(registeraddress=14, value=file,
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
                                                                                     num3])  #

    def combined_two_play(self, num1,
                          num2):
        combined_two_play = self.__instrument.write_registers(registeraddress=1, values=[num1,
                                                                                         num2])

    def end_combined_play(self):
        end_combined_play = self.__instrument.write_register(registeraddress=13, value=1,
                                                             functioncode=6)  # 01 06 00 0D 00 01 D9 C9


if __name__ == "__main__":


    t = Alarm_device()
    # a=t.set_loop_mode(2)
    t.set_play_volume(3)
    t.combined_two_play(50, 51)
    time.sleep(5)   # 超过组合音频时常会报错，低于时常，音频会被中断
    # s = t.start_play()
    time.sleep(0.4)
    if t.read_play_status() == 0:
        t.end_combined_play()
    time.sleep(0.4)
    t.stop_play()
    # '''
    time.sleep(0.5)
    t.set_play_file(46)
    #time.sleep(0.5)
    t.set_play_volume(5)
    #time.sleep(0.5)
    t.set_play_file(47)
    #time.sleep(0.2)
    t.stop_play()
    # time.sleep(0.5) 
    # t.set_play_volume(10)
    # time.sleep(0.5)
    # t.set_loop_mode(1)
    # time.sleep(0.5)
    # t.set_play_file(51)
    # time.sleep(5)
    # t.stop_play()
