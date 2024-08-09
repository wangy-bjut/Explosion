;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::dgps)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'dgps (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::DGPS")
  (make-package "ROBOT_MSGS::DGPS"))

(in-package "ROS")
;;//! \htmlinclude dgps.msg.html


(defclass robot_msgs::dgps
  :super ros::object
  :slots (_x _y _z _roll _pitch _yaw _by_pose0 _by_pose1 _sin_th_q1 _cos_th_q1 _sin_th _cos_th _bbyyy ))

(defmethod robot_msgs::dgps
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:by_pose0 __by_pose0) 0.0)
    ((:by_pose1 __by_pose1) 0.0)
    ((:sin_th_q1 __sin_th_q1) 0.0)
    ((:cos_th_q1 __cos_th_q1) 0.0)
    ((:sin_th __sin_th) 0.0)
    ((:cos_th __cos_th) 0.0)
    ((:bbyyy __bbyyy) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _by_pose0 (float __by_pose0))
   (setq _by_pose1 (float __by_pose1))
   (setq _sin_th_q1 (float __sin_th_q1))
   (setq _cos_th_q1 (float __cos_th_q1))
   (setq _sin_th (float __sin_th))
   (setq _cos_th (float __cos_th))
   (setq _bbyyy (float __bbyyy))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:by_pose0
   (&optional __by_pose0)
   (if __by_pose0 (setq _by_pose0 __by_pose0)) _by_pose0)
  (:by_pose1
   (&optional __by_pose1)
   (if __by_pose1 (setq _by_pose1 __by_pose1)) _by_pose1)
  (:sin_th_q1
   (&optional __sin_th_q1)
   (if __sin_th_q1 (setq _sin_th_q1 __sin_th_q1)) _sin_th_q1)
  (:cos_th_q1
   (&optional __cos_th_q1)
   (if __cos_th_q1 (setq _cos_th_q1 __cos_th_q1)) _cos_th_q1)
  (:sin_th
   (&optional __sin_th)
   (if __sin_th (setq _sin_th __sin_th)) _sin_th)
  (:cos_th
   (&optional __cos_th)
   (if __cos_th (setq _cos_th __cos_th)) _cos_th)
  (:bbyyy
   (&optional __bbyyy)
   (if __bbyyy (setq _bbyyy __bbyyy)) _bbyyy)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float64 _roll
    8
    ;; float64 _pitch
    8
    ;; float64 _yaw
    8
    ;; float64 _by_pose0
    8
    ;; float64 _by_pose1
    8
    ;; float64 _sin_th_q1
    8
    ;; float64 _cos_th_q1
    8
    ;; float64 _sin_th
    8
    ;; float64 _cos_th
    8
    ;; float64 _bbyyy
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _by_pose0
       (sys::poke _by_pose0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _by_pose1
       (sys::poke _by_pose1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _sin_th_q1
       (sys::poke _sin_th_q1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _cos_th_q1
       (sys::poke _cos_th_q1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _sin_th
       (sys::poke _sin_th (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _cos_th
       (sys::poke _cos_th (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _bbyyy
       (sys::poke _bbyyy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _roll
     (setq _roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _by_pose0
     (setq _by_pose0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _by_pose1
     (setq _by_pose1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _sin_th_q1
     (setq _sin_th_q1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _cos_th_q1
     (setq _cos_th_q1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _sin_th
     (setq _sin_th (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _cos_th
     (setq _cos_th (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _bbyyy
     (setq _bbyyy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get robot_msgs::dgps :md5sum-) "c990cbed4ebc800837d6877b60880af5")
(setf (get robot_msgs::dgps :datatype-) "robot_msgs/dgps")
(setf (get robot_msgs::dgps :definition-)
      "float64 x
float64 y
float64 z
float64 roll
float64 pitch
float64 yaw
float64 by_pose0
float64 by_pose1
float64 sin_th_q1
float64 cos_th_q1
float64 sin_th
float64 cos_th
float64 bbyyy

")



(provide :robot_msgs/dgps "c990cbed4ebc800837d6877b60880af5")


