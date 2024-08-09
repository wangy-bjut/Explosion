;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::cloud_angletims)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'cloud_angletims (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::CLOUD_ANGLETIMS")
  (make-package "ROBOT_MSGS::CLOUD_ANGLETIMS"))

(in-package "ROS")
;;//! \htmlinclude cloud_angletims.msg.html


(defclass robot_msgs::cloud_angletims
  :super ros::object
  :slots (_yaw _pitch ))

(defmethod robot_msgs::cloud_angletims
  (:init
   (&key
    ((:yaw __yaw) 0.0)
    ((:pitch __pitch) 0.0)
    )
   (send-super :init)
   (setq _yaw (float __yaw))
   (setq _pitch (float __pitch))
   self)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:serialization-length
   ()
   (+
    ;; float32 _yaw
    4
    ;; float32 _pitch
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_msgs::cloud_angletims :md5sum-) "19ef1e45577dac4da3eff04ddb600a22")
(setf (get robot_msgs::cloud_angletims :datatype-) "robot_msgs/cloud_angletims")
(setf (get robot_msgs::cloud_angletims :definition-)
      "float32 yaw
float32 pitch
")



(provide :robot_msgs/cloud_angletims "19ef1e45577dac4da3eff04ddb600a22")


