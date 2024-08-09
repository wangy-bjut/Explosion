;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::Integrator)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'Integrator (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::INTEGRATOR")
  (make-package "ROBOT_MSGS::INTEGRATOR"))

(in-package "ROS")
;;//! \htmlinclude Integrator.msg.html


(defclass robot_msgs::Integrator
  :super ros::object
  :slots (_point_name _time _chasis _camera _gas _temp _recognition ))

(defmethod robot_msgs::Integrator
  (:init
   (&key
    ((:point_name __point_name) "")
    ((:time __time) "")
    ((:chasis __chasis) (instance robot_msgs::chasis :init))
    ((:camera __camera) (instance robot_msgs::camera :init))
    ((:gas __gas) (instance robot_msgs::gas_result :init))
    ((:temp __temp) (instance robot_msgs::temp_result :init))
    ((:recognition __recognition) (instance robot_msgs::recognition_result :init))
    )
   (send-super :init)
   (setq _point_name (string __point_name))
   (setq _time (string __time))
   (setq _chasis __chasis)
   (setq _camera __camera)
   (setq _gas __gas)
   (setq _temp __temp)
   (setq _recognition __recognition)
   self)
  (:point_name
   (&optional __point_name)
   (if __point_name (setq _point_name __point_name)) _point_name)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:chasis
   (&rest __chasis)
   (if (keywordp (car __chasis))
       (send* _chasis __chasis)
     (progn
       (if __chasis (setq _chasis (car __chasis)))
       _chasis)))
  (:camera
   (&rest __camera)
   (if (keywordp (car __camera))
       (send* _camera __camera)
     (progn
       (if __camera (setq _camera (car __camera)))
       _camera)))
  (:gas
   (&rest __gas)
   (if (keywordp (car __gas))
       (send* _gas __gas)
     (progn
       (if __gas (setq _gas (car __gas)))
       _gas)))
  (:temp
   (&rest __temp)
   (if (keywordp (car __temp))
       (send* _temp __temp)
     (progn
       (if __temp (setq _temp (car __temp)))
       _temp)))
  (:recognition
   (&rest __recognition)
   (if (keywordp (car __recognition))
       (send* _recognition __recognition)
     (progn
       (if __recognition (setq _recognition (car __recognition)))
       _recognition)))
  (:serialization-length
   ()
   (+
    ;; string _point_name
    4 (length _point_name)
    ;; string _time
    4 (length _time)
    ;; robot_msgs/chasis _chasis
    (send _chasis :serialization-length)
    ;; robot_msgs/camera _camera
    (send _camera :serialization-length)
    ;; robot_msgs/gas_result _gas
    (send _gas :serialization-length)
    ;; robot_msgs/temp_result _temp
    (send _temp :serialization-length)
    ;; robot_msgs/recognition_result _recognition
    (send _recognition :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _point_name
       (write-long (length _point_name) s) (princ _point_name s)
     ;; string _time
       (write-long (length _time) s) (princ _time s)
     ;; robot_msgs/chasis _chasis
       (send _chasis :serialize s)
     ;; robot_msgs/camera _camera
       (send _camera :serialize s)
     ;; robot_msgs/gas_result _gas
       (send _gas :serialize s)
     ;; robot_msgs/temp_result _temp
       (send _temp :serialize s)
     ;; robot_msgs/recognition_result _recognition
       (send _recognition :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _point_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _point_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _time
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _time (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; robot_msgs/chasis _chasis
     (send _chasis :deserialize buf ptr-) (incf ptr- (send _chasis :serialization-length))
   ;; robot_msgs/camera _camera
     (send _camera :deserialize buf ptr-) (incf ptr- (send _camera :serialization-length))
   ;; robot_msgs/gas_result _gas
     (send _gas :deserialize buf ptr-) (incf ptr- (send _gas :serialization-length))
   ;; robot_msgs/temp_result _temp
     (send _temp :deserialize buf ptr-) (incf ptr- (send _temp :serialization-length))
   ;; robot_msgs/recognition_result _recognition
     (send _recognition :deserialize buf ptr-) (incf ptr- (send _recognition :serialization-length))
   ;;
   self)
  )

(setf (get robot_msgs::Integrator :md5sum-) "605f26ed16563eb16c6f892df92d7968")
(setf (get robot_msgs::Integrator :datatype-) "robot_msgs/Integrator")
(setf (get robot_msgs::Integrator :definition-)
      "string point_name
string time
robot_msgs/chasis chasis
robot_msgs/camera camera
robot_msgs/gas_result gas
robot_msgs/temp_result temp
robot_msgs/recognition_result recognition
================================================================================
MSG: robot_msgs/chasis
robot_msgs/robot_pose pose
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
================================================================================
MSG: robot_msgs/camera
robot_msgs/cloud_angletims angle
robot_msgs/cloud_control control 
================================================================================
MSG: robot_msgs/cloud_angletims
float32 yaw
float32 pitch
================================================================================
MSG: robot_msgs/cloud_control
string direction
float64 angular_percent
bool zero
bool scrub
bool light
================================================================================
MSG: robot_msgs/gas_result
float32 result
================================================================================
MSG: robot_msgs/temp_result
float64 result
================================================================================
MSG: robot_msgs/recognition_result
float64 result
string picture_path
")



(provide :robot_msgs/Integrator "605f26ed16563eb16c6f892df92d7968")


