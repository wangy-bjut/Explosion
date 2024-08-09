#!/usr/bin/env python
# -*- encoding: utf-8 -*-
import rospy
from alarm_device.srv import alarm_srv

# 连接服务
rospy.wait_for_service('/alarm_service')
my_service = rospy.ServiceProxy('/alarm_service', alarm_srv)

# 调用服务
response = my_service()

# 获取响应
if response.result:
    chinese_str = response.result_str
    print(chinese_str)  # 输出：播放完成
else:
    print("服务调用失败！")