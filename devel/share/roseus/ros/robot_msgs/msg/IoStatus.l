;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::IoStatus)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'IoStatus (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::IOSTATUS")
  (make-package "ROBOT_MSGS::IOSTATUS"))

(in-package "ROS")
;;//! \htmlinclude IoStatus.msg.html


(defclass robot_msgs::IoStatus
  :super ros::object
  :slots (_status_stop _status_slow ))

(defmethod robot_msgs::IoStatus
  (:init
   (&key
    ((:status_stop __status_stop) 0)
    ((:status_slow __status_slow) 0)
    )
   (send-super :init)
   (setq _status_stop (round __status_stop))
   (setq _status_slow (round __status_slow))
   self)
  (:status_stop
   (&optional __status_stop)
   (if __status_stop (setq _status_stop __status_stop)) _status_stop)
  (:status_slow
   (&optional __status_slow)
   (if __status_slow (setq _status_slow __status_slow)) _status_slow)
  (:serialization-length
   ()
   (+
    ;; int8 _status_stop
    1
    ;; int8 _status_slow
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _status_stop
       (write-byte _status_stop s)
     ;; int8 _status_slow
       (write-byte _status_slow s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _status_stop
     (setq _status_stop (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _status_stop 127) (setq _status_stop (- _status_stop 256)))
   ;; int8 _status_slow
     (setq _status_slow (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _status_slow 127) (setq _status_slow (- _status_slow 256)))
   ;;
   self)
  )

(setf (get robot_msgs::IoStatus :md5sum-) "8c8bf31ab13adffd23ec7ea73641f167")
(setf (get robot_msgs::IoStatus :datatype-) "robot_msgs/IoStatus")
(setf (get robot_msgs::IoStatus :definition-)
      "int8 status_stop
int8 status_slow

")



(provide :robot_msgs/IoStatus "8c8bf31ab13adffd23ec7ea73641f167")


