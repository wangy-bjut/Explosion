;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::cloud_control)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'cloud_control (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::CLOUD_CONTROL")
  (make-package "ROBOT_MSGS::CLOUD_CONTROL"))

(in-package "ROS")
;;//! \htmlinclude cloud_control.msg.html


(defclass robot_msgs::cloud_control
  :super ros::object
  :slots (_direction _angular_percent _zero _scrub _light ))

(defmethod robot_msgs::cloud_control
  (:init
   (&key
    ((:direction __direction) "")
    ((:angular_percent __angular_percent) 0.0)
    ((:zero __zero) nil)
    ((:scrub __scrub) nil)
    ((:light __light) nil)
    )
   (send-super :init)
   (setq _direction (string __direction))
   (setq _angular_percent (float __angular_percent))
   (setq _zero __zero)
   (setq _scrub __scrub)
   (setq _light __light)
   self)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:angular_percent
   (&optional __angular_percent)
   (if __angular_percent (setq _angular_percent __angular_percent)) _angular_percent)
  (:zero
   (&optional __zero)
   (if __zero (setq _zero __zero)) _zero)
  (:scrub
   (&optional __scrub)
   (if __scrub (setq _scrub __scrub)) _scrub)
  (:light
   (&optional __light)
   (if __light (setq _light __light)) _light)
  (:serialization-length
   ()
   (+
    ;; string _direction
    4 (length _direction)
    ;; float64 _angular_percent
    8
    ;; bool _zero
    1
    ;; bool _scrub
    1
    ;; bool _light
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _direction
       (write-long (length _direction) s) (princ _direction s)
     ;; float64 _angular_percent
       (sys::poke _angular_percent (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _zero
       (if _zero (write-byte -1 s) (write-byte 0 s))
     ;; bool _scrub
       (if _scrub (write-byte -1 s) (write-byte 0 s))
     ;; bool _light
       (if _light (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _direction
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _direction (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _angular_percent
     (setq _angular_percent (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _zero
     (setq _zero (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _scrub
     (setq _scrub (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _light
     (setq _light (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get robot_msgs::cloud_control :md5sum-) "8a0daeeb4fd2f539306a2fb5b806e7f7")
(setf (get robot_msgs::cloud_control :datatype-) "robot_msgs/cloud_control")
(setf (get robot_msgs::cloud_control :definition-)
      "string direction
float64 angular_percent
bool zero
bool scrub
bool light
")



(provide :robot_msgs/cloud_control "8a0daeeb4fd2f539306a2fb5b806e7f7")


