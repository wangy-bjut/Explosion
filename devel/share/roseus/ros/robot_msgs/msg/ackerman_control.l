;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::ackerman_control)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'ackerman_control (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::ACKERMAN_CONTROL")
  (make-package "ROBOT_MSGS::ACKERMAN_CONTROL"))

(in-package "ROS")
;;//! \htmlinclude ackerman_control.msg.html


(defclass robot_msgs::ackerman_control
  :super ros::object
  :slots (_speed _turn ))

(defmethod robot_msgs::ackerman_control
  (:init
   (&key
    ((:speed __speed) 0.0)
    ((:turn __turn) 0.0)
    )
   (send-super :init)
   (setq _speed (float __speed))
   (setq _turn (float __turn))
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:turn
   (&optional __turn)
   (if __turn (setq _turn __turn)) _turn)
  (:serialization-length
   ()
   (+
    ;; float32 _speed
    4
    ;; float32 _turn
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _turn
       (sys::poke _turn (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _turn
     (setq _turn (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_msgs::ackerman_control :md5sum-) "e988c63435e382a0630b5b772d96ecf7")
(setf (get robot_msgs::ackerman_control :datatype-) "robot_msgs/ackerman_control")
(setf (get robot_msgs::ackerman_control :definition-)
      "float32 speed
float32 turn
")



(provide :robot_msgs/ackerman_control "e988c63435e382a0630b5b772d96ecf7")


