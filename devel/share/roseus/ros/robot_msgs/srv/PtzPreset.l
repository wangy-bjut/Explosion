;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::PtzPreset)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'PtzPreset (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::PTZPRESET")
  (make-package "ROBOT_MSGS::PTZPRESET"))
(unless (find-package "ROBOT_MSGS::PTZPRESETREQUEST")
  (make-package "ROBOT_MSGS::PTZPRESETREQUEST"))
(unless (find-package "ROBOT_MSGS::PTZPRESETRESPONSE")
  (make-package "ROBOT_MSGS::PTZPRESETRESPONSE"))

(in-package "ROS")





(defclass robot_msgs::PtzPresetRequest
  :super ros::object
  :slots (_yaw _pitch ))

(defmethod robot_msgs::PtzPresetRequest
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
    ;; float64 _yaw
    8
    ;; float64 _pitch
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass robot_msgs::PtzPresetResponse
  :super ros::object
  :slots (_result ))

(defmethod robot_msgs::PtzPresetResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robot_msgs::PtzPreset
  :super ros::object
  :slots ())

(setf (get robot_msgs::PtzPreset :md5sum-) "7b8a23f3742a103da89bd600506ecc86")
(setf (get robot_msgs::PtzPreset :datatype-) "robot_msgs/PtzPreset")
(setf (get robot_msgs::PtzPreset :request) robot_msgs::PtzPresetRequest)
(setf (get robot_msgs::PtzPreset :response) robot_msgs::PtzPresetResponse)

(defmethod robot_msgs::PtzPresetRequest
  (:response () (instance robot_msgs::PtzPresetResponse :init)))

(setf (get robot_msgs::PtzPresetRequest :md5sum-) "7b8a23f3742a103da89bd600506ecc86")
(setf (get robot_msgs::PtzPresetRequest :datatype-) "robot_msgs/PtzPresetRequest")
(setf (get robot_msgs::PtzPresetRequest :definition-)
      "float64 yaw
float64 pitch
---
bool result
")

(setf (get robot_msgs::PtzPresetResponse :md5sum-) "7b8a23f3742a103da89bd600506ecc86")
(setf (get robot_msgs::PtzPresetResponse :datatype-) "robot_msgs/PtzPresetResponse")
(setf (get robot_msgs::PtzPresetResponse :definition-)
      "float64 yaw
float64 pitch
---
bool result
")



(provide :robot_msgs/PtzPreset "7b8a23f3742a103da89bd600506ecc86")


