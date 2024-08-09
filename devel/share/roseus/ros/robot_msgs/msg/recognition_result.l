;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::recognition_result)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'recognition_result (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::RECOGNITION_RESULT")
  (make-package "ROBOT_MSGS::RECOGNITION_RESULT"))

(in-package "ROS")
;;//! \htmlinclude recognition_result.msg.html


(defclass robot_msgs::recognition_result
  :super ros::object
  :slots (_result _picture_path ))

(defmethod robot_msgs::recognition_result
  (:init
   (&key
    ((:result __result) 0.0)
    ((:picture_path __picture_path) "")
    )
   (send-super :init)
   (setq _result (float __result))
   (setq _picture_path (string __picture_path))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:picture_path
   (&optional __picture_path)
   (if __picture_path (setq _picture_path __picture_path)) _picture_path)
  (:serialization-length
   ()
   (+
    ;; float64 _result
    8
    ;; string _picture_path
    4 (length _picture_path)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _result
       (sys::poke _result (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _picture_path
       (write-long (length _picture_path) s) (princ _picture_path s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _result
     (setq _result (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _picture_path
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _picture_path (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get robot_msgs::recognition_result :md5sum-) "d1ac07c1008c1e8b1c60798b28200991")
(setf (get robot_msgs::recognition_result :datatype-) "robot_msgs/recognition_result")
(setf (get robot_msgs::recognition_result :definition-)
      "float64 result
string picture_path
")



(provide :robot_msgs/recognition_result "d1ac07c1008c1e8b1c60798b28200991")


