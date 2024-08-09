;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::chasis)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'chasis (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::CHASIS")
  (make-package "ROBOT_MSGS::CHASIS"))

(in-package "ROS")
;;//! \htmlinclude chasis.msg.html


(defclass robot_msgs::chasis
  :super ros::object
  :slots (_pose _cmd ))

(defmethod robot_msgs::chasis
  (:init
   (&key
    ((:pose __pose) (instance robot_msgs::robot_pose :init))
    ((:cmd __cmd) (instance robot_msgs::robot_cmd :init))
    )
   (send-super :init)
   (setq _pose __pose)
   (setq _cmd __cmd)
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:cmd
   (&rest __cmd)
   (if (keywordp (car __cmd))
       (send* _cmd __cmd)
     (progn
       (if __cmd (setq _cmd (car __cmd)))
       _cmd)))
  (:serialization-length
   ()
   (+
    ;; robot_msgs/robot_pose _pose
    (send _pose :serialization-length)
    ;; robot_msgs/robot_cmd _cmd
    (send _cmd :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; robot_msgs/robot_pose _pose
       (send _pose :serialize s)
     ;; robot_msgs/robot_cmd _cmd
       (send _cmd :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; robot_msgs/robot_pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; robot_msgs/robot_cmd _cmd
     (send _cmd :deserialize buf ptr-) (incf ptr- (send _cmd :serialization-length))
   ;;
   self)
  )

(setf (get robot_msgs::chasis :md5sum-) "3692867e47a9cfbea9dd44466659fd6d")
(setf (get robot_msgs::chasis :datatype-) "robot_msgs/chasis")
(setf (get robot_msgs::chasis :definition-)
      "robot_msgs/robot_pose pose
robot_msgs/robot_cmd cmd
================================================================================
MSG: robot_msgs/robot_pose
float32 x
float32 y
float32 yaw
================================================================================
MSG: robot_msgs/robot_cmd
float32 linear
float32 angular
")



(provide :robot_msgs/chasis "3692867e47a9cfbea9dd44466659fd6d")


