;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::recognition_scale)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'recognition_scale (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::RECOGNITION_SCALE")
  (make-package "ROBOT_MSGS::RECOGNITION_SCALE"))
(unless (find-package "ROBOT_MSGS::RECOGNITION_SCALEREQUEST")
  (make-package "ROBOT_MSGS::RECOGNITION_SCALEREQUEST"))
(unless (find-package "ROBOT_MSGS::RECOGNITION_SCALERESPONSE")
  (make-package "ROBOT_MSGS::RECOGNITION_SCALERESPONSE"))

(in-package "ROS")





(defclass robot_msgs::recognition_scaleRequest
  :super ros::object
  :slots (_start ))

(defmethod robot_msgs::recognition_scaleRequest
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

(defclass robot_msgs::recognition_scaleResponse
  :super ros::object
  :slots (_image_path _result _time ))

(defmethod robot_msgs::recognition_scaleResponse
  (:init
   (&key
    ((:image_path __image_path) "")
    ((:result __result) 0.0)
    ((:time __time) "")
    )
   (send-super :init)
   (setq _image_path (string __image_path))
   (setq _result (float __result))
   (setq _time (string __time))
   self)
  (:image_path
   (&optional __image_path)
   (if __image_path (setq _image_path __image_path)) _image_path)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:serialization-length
   ()
   (+
    ;; string _image_path
    4 (length _image_path)
    ;; float64 _result
    8
    ;; string _time
    4 (length _time)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _image_path
       (write-long (length _image_path) s) (princ _image_path s)
     ;; float64 _result
       (sys::poke _result (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _time
       (write-long (length _time) s) (princ _time s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _image_path
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _image_path (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _result
     (setq _result (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _time
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _time (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robot_msgs::recognition_scale
  :super ros::object
  :slots ())

(setf (get robot_msgs::recognition_scale :md5sum-) "517170519764f280df543ca1d4bff866")
(setf (get robot_msgs::recognition_scale :datatype-) "robot_msgs/recognition_scale")
(setf (get robot_msgs::recognition_scale :request) robot_msgs::recognition_scaleRequest)
(setf (get robot_msgs::recognition_scale :response) robot_msgs::recognition_scaleResponse)

(defmethod robot_msgs::recognition_scaleRequest
  (:response () (instance robot_msgs::recognition_scaleResponse :init)))

(setf (get robot_msgs::recognition_scaleRequest :md5sum-) "517170519764f280df543ca1d4bff866")
(setf (get robot_msgs::recognition_scaleRequest :datatype-) "robot_msgs/recognition_scaleRequest")
(setf (get robot_msgs::recognition_scaleRequest :definition-)
      "bool start
---
string image_path
float64 result
string time
")

(setf (get robot_msgs::recognition_scaleResponse :md5sum-) "517170519764f280df543ca1d4bff866")
(setf (get robot_msgs::recognition_scaleResponse :datatype-) "robot_msgs/recognition_scaleResponse")
(setf (get robot_msgs::recognition_scaleResponse :definition-)
      "bool start
---
string image_path
float64 result
string time
")



(provide :robot_msgs/recognition_scale "517170519764f280df543ca1d4bff866")


