#! /usr/bin/env python
import rospy
from robot_msgs.srv import recognition_scale,recognition_scaleResponse
import yaml

class DetectionService(object):

    def __init__(self):
        self.image_path = None
        self.save_time = None
        self.result = None
        self.yaml_path = '/home/robot/yolov7-meter2/detection.yaml'
        self.detection_service = rospy.Service("recognition_scale", recognition_scale, self.detection_callback)


    def monitor_update(self):
        f = open(self.yaml_path, 'r', encoding='utf-8')
        original_data = yaml.load(f.read(), Loader=yaml.FullLoader)
        original_data['startup'] = 1
        f.close()
        f = open(self.yaml_path, 'w', encoding='utf-8')
        yaml.dump(original_data, f, allow_unicode=True)
        f.close()
        while(True):
            f = open(self.yaml_path, 'r', encoding='utf-8')
            param = yaml.load(f.read(), Loader=yaml.FullLoader)
            if param != None:
                update = param['update']
                f.close()
                if update:
                    self.get_param()
                    f = open(self.yaml_path, 'w', encoding='utf-8')
                    original_data = param
                    original_data['update'] = 0
                    yaml.dump(original_data, f, allow_unicode=True)
                    f.close()
                    break
                else:
                    continue


    def get_param(self):
        f = open(self.yaml_path, 'r', encoding='utf-8')
        param = yaml.load(f.read(), Loader=yaml.FullLoader)
        self.image_path = param['result']['path']
        print(param)
        self.result = param['result']['result_meter']
        self.save_time = param['result']['time']
        print(self.image_path, self.result, self.save_time)
        f.close()


    def detection_callback(self,req):
        res = recognition_scaleResponse()
        if  (req.start == True):
            self.monitor_update()
            res.result = self.result
            res.image_path = self.image_path
            res.time = self.save_time
            return res



if __name__ == "__main__":
    rospy.init_node("detection_service")
    detection_service = DetectionService()
    rospy.spin()
