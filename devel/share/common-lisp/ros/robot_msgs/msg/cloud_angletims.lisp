; Auto-generated. Do not edit!


(cl:in-package robot_msgs-msg)


;//! \htmlinclude cloud_angletims.msg.html

(cl:defclass <cloud_angletims> (roslisp-msg-protocol:ros-message)
  ((yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0))
)

(cl:defclass cloud_angletims (<cloud_angletims>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cloud_angletims>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cloud_angletims)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-msg:<cloud_angletims> is deprecated: use robot_msgs-msg:cloud_angletims instead.")))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <cloud_angletims>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:yaw-val is deprecated.  Use robot_msgs-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <cloud_angletims>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:pitch-val is deprecated.  Use robot_msgs-msg:pitch instead.")
  (pitch m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cloud_angletims>) ostream)
  "Serializes a message object of type '<cloud_angletims>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cloud_angletims>) istream)
  "Deserializes a message object of type '<cloud_angletims>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cloud_angletims>)))
  "Returns string type for a message object of type '<cloud_angletims>"
  "robot_msgs/cloud_angletims")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cloud_angletims)))
  "Returns string type for a message object of type 'cloud_angletims"
  "robot_msgs/cloud_angletims")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cloud_angletims>)))
  "Returns md5sum for a message object of type '<cloud_angletims>"
  "19ef1e45577dac4da3eff04ddb600a22")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cloud_angletims)))
  "Returns md5sum for a message object of type 'cloud_angletims"
  "19ef1e45577dac4da3eff04ddb600a22")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cloud_angletims>)))
  "Returns full string definition for message of type '<cloud_angletims>"
  (cl:format cl:nil "float32 yaw~%float32 pitch~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cloud_angletims)))
  "Returns full string definition for message of type 'cloud_angletims"
  (cl:format cl:nil "float32 yaw~%float32 pitch~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cloud_angletims>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cloud_angletims>))
  "Converts a ROS message object to a list"
  (cl:list 'cloud_angletims
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':pitch (pitch msg))
))
