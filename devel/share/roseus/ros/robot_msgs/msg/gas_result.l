;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::gas_result)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'gas_result (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::GAS_RESULT")
  (make-package "ROBOT_MSGS::GAS_RESULT"))

(in-package "ROS")
;;//! \htmlinclude gas_result.msg.html


(defclass robot_msgs::gas_result
  :super ros::object
  :slots (_result ))

(defmethod robot_msgs::gas_result
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
    ;; float32 _result
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _result
       (sys::poke _result (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _result
     (setq _result (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_msgs::gas_result :md5sum-) "db954e5de3aba73b237d07575e5cac28")
(setf (get robot_msgs::gas_result :datatype-) "robot_msgs/gas_result")
(setf (get robot_msgs::gas_result :definition-)
      "float32 result
")



(provide :robot_msgs/gas_result "db954e5de3aba73b237d07575e5cac28")


