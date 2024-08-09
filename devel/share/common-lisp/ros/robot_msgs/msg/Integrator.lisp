; Auto-generated. Do not edit!


(cl:in-package robot_msgs-msg)


;//! \htmlinclude Integrator.msg.html

(cl:defclass <Integrator> (roslisp-msg-protocol:ros-message)
  ((point_name
    :reader point_name
    :initarg :point_name
    :type cl:string
    :initform "")
   (time
    :reader time
    :initarg :time
    :type cl:string
    :initform "")
   (chasis
    :reader chasis
    :initarg :chasis
    :type robot_msgs-msg:chasis
    :initform (cl:make-instance 'robot_msgs-msg:chasis))
   (camera
    :reader camera
    :initarg :camera
    :type robot_msgs-msg:camera
    :initform (cl:make-instance 'robot_msgs-msg:camera))
   (gas
    :reader gas
    :initarg :gas
    :type robot_msgs-msg:gas_result
    :initform (cl:make-instance 'robot_msgs-msg:gas_result))
   (temp
    :reader temp
    :initarg :temp
    :type robot_msgs-msg:temp_result
    :initform (cl:make-instance 'robot_msgs-msg:temp_result))
   (recognition
    :reader recognition
    :initarg :recognition
    :type robot_msgs-msg:recognition_result
    :initform (cl:make-instance 'robot_msgs-msg:recognition_result)))
)

(cl:defclass Integrator (<Integrator>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Integrator>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Integrator)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-msg:<Integrator> is deprecated: use robot_msgs-msg:Integrator instead.")))

(cl:ensure-generic-function 'point_name-val :lambda-list '(m))
(cl:defmethod point_name-val ((m <Integrator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:point_name-val is deprecated.  Use robot_msgs-msg:point_name instead.")
  (point_name m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <Integrator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:time-val is deprecated.  Use robot_msgs-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'chasis-val :lambda-list '(m))
(cl:defmethod chasis-val ((m <Integrator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:chasis-val is deprecated.  Use robot_msgs-msg:chasis instead.")
  (chasis m))

(cl:ensure-generic-function 'camera-val :lambda-list '(m))
(cl:defmethod camera-val ((m <Integrator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:camera-val is deprecated.  Use robot_msgs-msg:camera instead.")
  (camera m))

(cl:ensure-generic-function 'gas-val :lambda-list '(m))
(cl:defmethod gas-val ((m <Integrator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:gas-val is deprecated.  Use robot_msgs-msg:gas instead.")
  (gas m))

(cl:ensure-generic-function 'temp-val :lambda-list '(m))
(cl:defmethod temp-val ((m <Integrator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:temp-val is deprecated.  Use robot_msgs-msg:temp instead.")
  (temp m))

(cl:ensure-generic-function 'recognition-val :lambda-list '(m))
(cl:defmethod recognition-val ((m <Integrator>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:recognition-val is deprecated.  Use robot_msgs-msg:recognition instead.")
  (recognition m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Integrator>) ostream)
  "Serializes a message object of type '<Integrator>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'point_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'point_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'time))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'chasis) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'camera) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'gas) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'temp) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'recognition) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Integrator>) istream)
  "Deserializes a message object of type '<Integrator>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'point_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'point_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'time) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'time) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'chasis) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'camera) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'gas) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'temp) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'recognition) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Integrator>)))
  "Returns string type for a message object of type '<Integrator>"
  "robot_msgs/Integrator")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Integrator)))
  "Returns string type for a message object of type 'Integrator"
  "robot_msgs/Integrator")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Integrator>)))
  "Returns md5sum for a message object of type '<Integrator>"
  "605f26ed16563eb16c6f892df92d7968")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Integrator)))
  "Returns md5sum for a message object of type 'Integrator"
  "605f26ed16563eb16c6f892df92d7968")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Integrator>)))
  "Returns full string definition for message of type '<Integrator>"
  (cl:format cl:nil "string point_name~%string time~%robot_msgs/chasis chasis~%robot_msgs/camera camera~%robot_msgs/gas_result gas~%robot_msgs/temp_result temp~%robot_msgs/recognition_result recognition~%================================================================================~%MSG: robot_msgs/chasis~%robot_msgs/robot_pose pose~%robot_msgs/robot_cmd cmd~%================================================================================~%MSG: robot_msgs/robot_pose~%float32 x~%float32 y~%float32 yaw~%================================================================================~%MSG: robot_msgs/robot_cmd~%float32 linear~%float32 angular~%================================================================================~%MSG: robot_msgs/camera~%robot_msgs/cloud_angletims angle~%robot_msgs/cloud_control control ~%================================================================================~%MSG: robot_msgs/cloud_angletims~%float32 yaw~%float32 pitch~%================================================================================~%MSG: robot_msgs/cloud_control~%string direction~%float64 angular_percent~%bool zero~%bool scrub~%bool light~%================================================================================~%MSG: robot_msgs/gas_result~%float32 result~%================================================================================~%MSG: robot_msgs/temp_result~%float64 result~%================================================================================~%MSG: robot_msgs/recognition_result~%float64 result~%string picture_path~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Integrator)))
  "Returns full string definition for message of type 'Integrator"
  (cl:format cl:nil "string point_name~%string time~%robot_msgs/chasis chasis~%robot_msgs/camera camera~%robot_msgs/gas_result gas~%robot_msgs/temp_result temp~%robot_msgs/recognition_result recognition~%================================================================================~%MSG: robot_msgs/chasis~%robot_msgs/robot_pose pose~%robot_msgs/robot_cmd cmd~%================================================================================~%MSG: robot_msgs/robot_pose~%float32 x~%float32 y~%float32 yaw~%================================================================================~%MSG: robot_msgs/robot_cmd~%float32 linear~%float32 angular~%================================================================================~%MSG: robot_msgs/camera~%robot_msgs/cloud_angletims angle~%robot_msgs/cloud_control control ~%================================================================================~%MSG: robot_msgs/cloud_angletims~%float32 yaw~%float32 pitch~%================================================================================~%MSG: robot_msgs/cloud_control~%string direction~%float64 angular_percent~%bool zero~%bool scrub~%bool light~%================================================================================~%MSG: robot_msgs/gas_result~%float32 result~%================================================================================~%MSG: robot_msgs/temp_result~%float64 result~%================================================================================~%MSG: robot_msgs/recognition_result~%float64 result~%string picture_path~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Integrator>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'point_name))
     4 (cl:length (cl:slot-value msg 'time))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'chasis))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'camera))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'gas))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'temp))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'recognition))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Integrator>))
  "Converts a ROS message object to a list"
  (cl:list 'Integrator
    (cl:cons ':point_name (point_name msg))
    (cl:cons ':time (time msg))
    (cl:cons ':chasis (chasis msg))
    (cl:cons ':camera (camera msg))
    (cl:cons ':gas (gas msg))
    (cl:cons ':temp (temp msg))
    (cl:cons ':recognition (recognition msg))
))
