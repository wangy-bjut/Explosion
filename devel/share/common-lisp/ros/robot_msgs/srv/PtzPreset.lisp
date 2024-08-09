; Auto-generated. Do not edit!


(cl:in-package robot_msgs-srv)


;//! \htmlinclude PtzPreset-request.msg.html

(cl:defclass <PtzPreset-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass PtzPreset-request (<PtzPreset-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PtzPreset-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PtzPreset-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-srv:<PtzPreset-request> is deprecated: use robot_msgs-srv:PtzPreset-request instead.")))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <PtzPreset-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:yaw-val is deprecated.  Use robot_msgs-srv:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <PtzPreset-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:pitch-val is deprecated.  Use robot_msgs-srv:pitch instead.")
  (pitch m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PtzPreset-request>) ostream)
  "Serializes a message object of type '<PtzPreset-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PtzPreset-request>) istream)
  "Deserializes a message object of type '<PtzPreset-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PtzPreset-request>)))
  "Returns string type for a service object of type '<PtzPreset-request>"
  "robot_msgs/PtzPresetRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PtzPreset-request)))
  "Returns string type for a service object of type 'PtzPreset-request"
  "robot_msgs/PtzPresetRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PtzPreset-request>)))
  "Returns md5sum for a message object of type '<PtzPreset-request>"
  "7b8a23f3742a103da89bd600506ecc86")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PtzPreset-request)))
  "Returns md5sum for a message object of type 'PtzPreset-request"
  "7b8a23f3742a103da89bd600506ecc86")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PtzPreset-request>)))
  "Returns full string definition for message of type '<PtzPreset-request>"
  (cl:format cl:nil "float64 yaw~%float64 pitch~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PtzPreset-request)))
  "Returns full string definition for message of type 'PtzPreset-request"
  (cl:format cl:nil "float64 yaw~%float64 pitch~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PtzPreset-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PtzPreset-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PtzPreset-request
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':pitch (pitch msg))
))
;//! \htmlinclude PtzPreset-response.msg.html

(cl:defclass <PtzPreset-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PtzPreset-response (<PtzPreset-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PtzPreset-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PtzPreset-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-srv:<PtzPreset-response> is deprecated: use robot_msgs-srv:PtzPreset-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <PtzPreset-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:result-val is deprecated.  Use robot_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PtzPreset-response>) ostream)
  "Serializes a message object of type '<PtzPreset-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PtzPreset-response>) istream)
  "Deserializes a message object of type '<PtzPreset-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PtzPreset-response>)))
  "Returns string type for a service object of type '<PtzPreset-response>"
  "robot_msgs/PtzPresetResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PtzPreset-response)))
  "Returns string type for a service object of type 'PtzPreset-response"
  "robot_msgs/PtzPresetResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PtzPreset-response>)))
  "Returns md5sum for a message object of type '<PtzPreset-response>"
  "7b8a23f3742a103da89bd600506ecc86")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PtzPreset-response)))
  "Returns md5sum for a message object of type 'PtzPreset-response"
  "7b8a23f3742a103da89bd600506ecc86")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PtzPreset-response>)))
  "Returns full string definition for message of type '<PtzPreset-response>"
  (cl:format cl:nil "bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PtzPreset-response)))
  "Returns full string definition for message of type 'PtzPreset-response"
  (cl:format cl:nil "bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PtzPreset-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PtzPreset-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PtzPreset-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PtzPreset)))
  'PtzPreset-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PtzPreset)))
  'PtzPreset-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PtzPreset)))
  "Returns string type for a service object of type '<PtzPreset>"
  "robot_msgs/PtzPreset")