; Auto-generated. Do not edit!


(cl:in-package robot_msgs-srv)


;//! \htmlinclude Gas_alarm-request.msg.html

(cl:defclass <Gas_alarm-request> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Gas_alarm-request (<Gas_alarm-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Gas_alarm-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Gas_alarm-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-srv:<Gas_alarm-request> is deprecated: use robot_msgs-srv:Gas_alarm-request instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <Gas_alarm-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:start-val is deprecated.  Use robot_msgs-srv:start instead.")
  (start m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Gas_alarm-request>) ostream)
  "Serializes a message object of type '<Gas_alarm-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'start) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Gas_alarm-request>) istream)
  "Deserializes a message object of type '<Gas_alarm-request>"
    (cl:setf (cl:slot-value msg 'start) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Gas_alarm-request>)))
  "Returns string type for a service object of type '<Gas_alarm-request>"
  "robot_msgs/Gas_alarmRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Gas_alarm-request)))
  "Returns string type for a service object of type 'Gas_alarm-request"
  "robot_msgs/Gas_alarmRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Gas_alarm-request>)))
  "Returns md5sum for a message object of type '<Gas_alarm-request>"
  "ac6e499d07c665aef1a9fb36404cb426")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Gas_alarm-request)))
  "Returns md5sum for a message object of type 'Gas_alarm-request"
  "ac6e499d07c665aef1a9fb36404cb426")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Gas_alarm-request>)))
  "Returns full string definition for message of type '<Gas_alarm-request>"
  (cl:format cl:nil "bool start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Gas_alarm-request)))
  "Returns full string definition for message of type 'Gas_alarm-request"
  (cl:format cl:nil "bool start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Gas_alarm-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Gas_alarm-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Gas_alarm-request
    (cl:cons ':start (start msg))
))
;//! \htmlinclude Gas_alarm-response.msg.html

(cl:defclass <Gas_alarm-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass Gas_alarm-response (<Gas_alarm-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Gas_alarm-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Gas_alarm-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-srv:<Gas_alarm-response> is deprecated: use robot_msgs-srv:Gas_alarm-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <Gas_alarm-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:result-val is deprecated.  Use robot_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Gas_alarm-response>) ostream)
  "Serializes a message object of type '<Gas_alarm-response>"
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Gas_alarm-response>) istream)
  "Deserializes a message object of type '<Gas_alarm-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Gas_alarm-response>)))
  "Returns string type for a service object of type '<Gas_alarm-response>"
  "robot_msgs/Gas_alarmResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Gas_alarm-response)))
  "Returns string type for a service object of type 'Gas_alarm-response"
  "robot_msgs/Gas_alarmResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Gas_alarm-response>)))
  "Returns md5sum for a message object of type '<Gas_alarm-response>"
  "ac6e499d07c665aef1a9fb36404cb426")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Gas_alarm-response)))
  "Returns md5sum for a message object of type 'Gas_alarm-response"
  "ac6e499d07c665aef1a9fb36404cb426")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Gas_alarm-response>)))
  "Returns full string definition for message of type '<Gas_alarm-response>"
  (cl:format cl:nil "int64 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Gas_alarm-response)))
  "Returns full string definition for message of type 'Gas_alarm-response"
  (cl:format cl:nil "int64 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Gas_alarm-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Gas_alarm-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Gas_alarm-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Gas_alarm)))
  'Gas_alarm-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Gas_alarm)))
  'Gas_alarm-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Gas_alarm)))
  "Returns string type for a service object of type '<Gas_alarm>"
  "robot_msgs/Gas_alarm")