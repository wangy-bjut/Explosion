; Auto-generated. Do not edit!


(cl:in-package robot_msgs-msg)


;//! \htmlinclude robot_cmd.msg.html

(cl:defclass <robot_cmd> (roslisp-msg-protocol:ros-message)
  ((linear
    :reader linear
    :initarg :linear
    :type cl:float
    :initform 0.0)
   (angular
    :reader angular
    :initarg :angular
    :type cl:float
    :initform 0.0))
)

(cl:defclass robot_cmd (<robot_cmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_cmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_cmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-msg:<robot_cmd> is deprecated: use robot_msgs-msg:robot_cmd instead.")))

(cl:ensure-generic-function 'linear-val :lambda-list '(m))
(cl:defmethod linear-val ((m <robot_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:linear-val is deprecated.  Use robot_msgs-msg:linear instead.")
  (linear m))

(cl:ensure-generic-function 'angular-val :lambda-list '(m))
(cl:defmethod angular-val ((m <robot_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:angular-val is deprecated.  Use robot_msgs-msg:angular instead.")
  (angular m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_cmd>) ostream)
  "Serializes a message object of type '<robot_cmd>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'linear))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angular))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_cmd>) istream)
  "Deserializes a message object of type '<robot_cmd>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linear) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angular) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_cmd>)))
  "Returns string type for a message object of type '<robot_cmd>"
  "robot_msgs/robot_cmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_cmd)))
  "Returns string type for a message object of type 'robot_cmd"
  "robot_msgs/robot_cmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_cmd>)))
  "Returns md5sum for a message object of type '<robot_cmd>"
  "9d5c2dcd348ac8f76ce2a4307bd63a13")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_cmd)))
  "Returns md5sum for a message object of type 'robot_cmd"
  "9d5c2dcd348ac8f76ce2a4307bd63a13")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_cmd>)))
  "Returns full string definition for message of type '<robot_cmd>"
  (cl:format cl:nil "float32 linear~%float32 angular~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_cmd)))
  "Returns full string definition for message of type 'robot_cmd"
  (cl:format cl:nil "float32 linear~%float32 angular~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_cmd>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_cmd>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_cmd
    (cl:cons ':linear (linear msg))
    (cl:cons ':angular (angular msg))
))
