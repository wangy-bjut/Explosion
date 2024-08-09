;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::temp_result)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'temp_result (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::TEMP_RESULT")
  (make-package "ROBOT_MSGS::TEMP_RESULT"))

(in-package "ROS")
;;//! \htmlinclude temp_result.msg.html


(defclass robot_msgs::temp_result
  :super ros::object
  :slots (_result ))

(defmethod robot_msgs::temp_result
  (:init
   (&key
    ((:result __result) 0.0)
    )
   (send-super :init)
   (setq _result (float __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; float64 _result
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _result
       (sys::poke _result (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _result
     (setq _result (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get robot_msgs::temp_result :md5sum-) "254fb2d8c4e08eff5dc6a560ed51dd52")
(setf (get robot_msgs::temp_result :datatype-) "robot_msgs/temp_result")
(setf (get robot_msgs::temp_result :definition-)
      "float64 result
")



(provide :robot_msgs/temp_result "254fb2d8c4e08eff5dc6a560ed51dd52")


