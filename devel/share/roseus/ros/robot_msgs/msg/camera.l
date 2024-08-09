;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::camera)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'camera (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::CAMERA")
  (make-package "ROBOT_MSGS::CAMERA"))

(in-package "ROS")
;;//! \htmlinclude camera.msg.html


(defclass robot_msgs::camera
  :super ros::object
  :slots (_angle _control ))

(defmethod robot_msgs::camera
  (:init
   (&key
    ((:angle __angle) (instance robot_msgs::cloud_angletims :init))
    ((:control __control) (instance robot_msgs::cloud_control :init))
    )
   (send-super :init)
   (setq _angle __angle)
   (setq _control __control)
   self)
  (:angle
   (&rest __angle)
   (if (keywordp (car __angle))
       (send* _angle __angle)
     (progn
       (if __angle (setq _angle (car __angle)))
       _angle)))
  (:control
   (&rest __control)
   (if (keywordp (car __control))
       (send* _control __control)
     (progn
       (if __control (setq _control (car __control)))
       _control)))
  (:serialization-length
   ()
   (+
    ;; robot_msgs/cloud_angletims _angle
    (send _angle :serialization-length)
    ;; robot_msgs/cloud_control _control
    (send _control :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; robot_msgs/cloud_angletims _angle
       (send _angle :serialize s)
     ;; robot_msgs/cloud_control _control
       (send _control :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; robot_msgs/cloud_angletims _angle
     (send _angle :deserialize buf ptr-) (incf ptr- (send _angle :serialization-length))
   ;; robot_msgs/cloud_control _control
     (send _control :deserialize buf ptr-) (incf ptr- (send _control :serialization-length))
   ;;
   self)
  )

(setf (get robot_msgs::camera :md5sum-) "1dbe9d74bdb2340b22cd82e8b27560c6")
(setf (get robot_msgs::camera :datatype-) "robot_msgs/camera")
(setf (get robot_msgs::camera :definition-)
      "robot_msgs/cloud_angletims angle
robot_msgs/cloud_control control 
================================================================================
MSG: robot_msgs/cloud_angletims
float32 yaw
float32 pitch
================================================================================
MSG: robot_msgs/cloud_control
string direction
float64 angular_percent
bool zero
bool scrub
bool light
")



(provide :robot_msgs/camera "1dbe9d74bdb2340b22cd82e8b27560c6")


