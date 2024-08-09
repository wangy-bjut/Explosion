;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::nav_goal)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'nav_goal (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::NAV_GOAL")
  (make-package "ROBOT_MSGS::NAV_GOAL"))
(unless (find-package "ROBOT_MSGS::NAV_GOALREQUEST")
  (make-package "ROBOT_MSGS::NAV_GOALREQUEST"))
(unless (find-package "ROBOT_MSGS::NAV_GOALRESPONSE")
  (make-package "ROBOT_MSGS::NAV_GOALRESPONSE"))

(in-package "ROS")





(defclass robot_msgs::nav_goalRequest
  :super ros::object
  :slots (_x _y _th ))

(defmethod robot_msgs::nav_goalRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:th __th) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _th (float __th))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:th
   (&optional __th)
   (if __th (setq _th __th)) _th)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _th
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
     ;; float64 _th
       (sys::poke _th (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _th
     (setq _th (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass robot_msgs::nav_goalResponse
  :super ros::object
  :slots (_th _success _message ))

(defmethod robot_msgs::nav_goalResponse
  (:init
   (&key
    ((:th __th) 0)
    ((:success __success) 0)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _th (round __th))
   (setq _success (round __success))
   (setq _message (string __message))
   self)
  (:th
   (&optional __th)
   (if __th (setq _th __th)) _th)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; int32 _th
    4
    ;; int8 _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _th
       (write-long _th s)
     ;; int8 _success
       (write-byte _success s)
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _th
     (setq _th (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int8 _success
     (setq _success (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _success 127) (setq _success (- _success 256)))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robot_msgs::nav_goal
  :super ros::object
  :slots ())

(setf (get robot_msgs::nav_goal :md5sum-) "6f7829491dcb15f3121622bb0d29b3ea")
(setf (get robot_msgs::nav_goal :datatype-) "robot_msgs/nav_goal")
(setf (get robot_msgs::nav_goal :request) robot_msgs::nav_goalRequest)
(setf (get robot_msgs::nav_goal :response) robot_msgs::nav_goalResponse)

(defmethod robot_msgs::nav_goalRequest
  (:response () (instance robot_msgs::nav_goalResponse :init)))

(setf (get robot_msgs::nav_goalRequest :md5sum-) "6f7829491dcb15f3121622bb0d29b3ea")
(setf (get robot_msgs::nav_goalRequest :datatype-) "robot_msgs/nav_goalRequest")
(setf (get robot_msgs::nav_goalRequest :definition-)
      "float64 x
float64 y
float64 th
---
int32 th
int8 success
string message
")

(setf (get robot_msgs::nav_goalResponse :md5sum-) "6f7829491dcb15f3121622bb0d29b3ea")
(setf (get robot_msgs::nav_goalResponse :datatype-) "robot_msgs/nav_goalResponse")
(setf (get robot_msgs::nav_goalResponse :definition-)
      "float64 x
float64 y
float64 th
---
int32 th
int8 success
string message
")



(provide :robot_msgs/nav_goal "6f7829491dcb15f3121622bb0d29b3ea")


