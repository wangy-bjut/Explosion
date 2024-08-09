;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::temp_detection)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'temp_detection (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::TEMP_DETECTION")
  (make-package "ROBOT_MSGS::TEMP_DETECTION"))
(unless (find-package "ROBOT_MSGS::TEMP_DETECTIONREQUEST")
  (make-package "ROBOT_MSGS::TEMP_DETECTIONREQUEST"))
(unless (find-package "ROBOT_MSGS::TEMP_DETECTIONRESPONSE")
  (make-package "ROBOT_MSGS::TEMP_DETECTIONRESPONSE"))

(in-package "ROS")





(defclass robot_msgs::temp_detectionRequest
  :super ros::object
  :slots (_start ))

(defmethod robot_msgs::temp_detectionRequest
  (:init
   (&key
    ((:start __start) nil)
    )
   (send-super :init)
   (setq _start __start)
   self)
  (:start
   (&optional __start)
   (if __start (setq _start __start)) _start)
  (:serialization-length
   ()
   (+
    ;; bool _start
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _start
       (if _start (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _start
     (setq _start (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robot_msgs::temp_detectionResponse
  :super ros::object
  :slots (_temp ))

(defmethod robot_msgs::temp_detectionResponse
  (:init
   (&key
    ((:temp __temp) 0.0)
    )
   (send-super :init)
   (setq _temp (float __temp))
   self)
  (:temp
   (&optional __temp)
   (if __temp (setq _temp __temp)) _temp)
  (:serialization-length
   ()
   (+
    ;; float64 _temp
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _temp
       (sys::poke _temp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _temp
     (setq _temp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass robot_msgs::temp_detection
  :super ros::object
  :slots ())

(setf (get robot_msgs::temp_detection :md5sum-) "fbe2b0e6d586ba7b0e807a33c06658ad")
(setf (get robot_msgs::temp_detection :datatype-) "robot_msgs/temp_detection")
(setf (get robot_msgs::temp_detection :request) robot_msgs::temp_detectionRequest)
(setf (get robot_msgs::temp_detection :response) robot_msgs::temp_detectionResponse)

(defmethod robot_msgs::temp_detectionRequest
  (:response () (instance robot_msgs::temp_detectionResponse :init)))

(setf (get robot_msgs::temp_detectionRequest :md5sum-) "fbe2b0e6d586ba7b0e807a33c06658ad")
(setf (get robot_msgs::temp_detectionRequest :datatype-) "robot_msgs/temp_detectionRequest")
(setf (get robot_msgs::temp_detectionRequest :definition-)
      "bool start
---
float64 temp
")

(setf (get robot_msgs::temp_detectionResponse :md5sum-) "fbe2b0e6d586ba7b0e807a33c06658ad")
(setf (get robot_msgs::temp_detectionResponse :datatype-) "robot_msgs/temp_detectionResponse")
(setf (get robot_msgs::temp_detectionResponse :definition-)
      "bool start
---
float64 temp
")



(provide :robot_msgs/temp_detection "fbe2b0e6d586ba7b0e807a33c06658ad")


