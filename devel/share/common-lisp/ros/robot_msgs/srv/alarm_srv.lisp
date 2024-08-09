; Auto-generated. Do not edit!


(cl:in-package robot_msgs-srv)


;//! \htmlinclude alarm_srv-request.msg.html

(cl:defclass <alarm_srv-request> (roslisp-msg-protocol:ros-message)
  ((volume
    :reader volume
    :initarg :volume
    :type cl:integer
    :initform 0)
   (loop_mode
    :reader loop_mode
    :initarg :loop_mode
    :type cl:integer
    :initform 0)
   (filename
    :reader filename
    :initarg :filename
    :type cl:integer
    :initform 0)
   (fileorder
    :reader fileorder
    :initarg :fileorder
    :type cl:integer
    :initform 0))
)

(cl:defclass alarm_srv-request (<alarm_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <alarm_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'alarm_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-srv:<alarm_srv-request> is deprecated: use robot_msgs-srv:alarm_srv-request instead.")))

(cl:ensure-generic-function 'volume-val :lambda-list '(m))
(cl:defmethod volume-val ((m <alarm_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:volume-val is deprecated.  Use robot_msgs-srv:volume instead.")
  (volume m))

(cl:ensure-generic-function 'loop_mode-val :lambda-list '(m))
(cl:defmethod loop_mode-val ((m <alarm_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:loop_mode-val is deprecated.  Use robot_msgs-srv:loop_mode instead.")
  (loop_mode m))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <alarm_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:filename-val is deprecated.  Use robot_msgs-srv:filename instead.")
  (filename m))

(cl:ensure-generic-function 'fileorder-val :lambda-list '(m))
(cl:defmethod fileorder-val ((m <alarm_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:fileorder-val is deprecated.  Use robot_msgs-srv:fileorder instead.")
  (fileorder m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <alarm_srv-request>) ostream)
  "Serializes a message object of type '<alarm_srv-request>"
  (cl:let* ((signed (cl:slot-value msg 'volume)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'loop_mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'filename)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fileorder)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <alarm_srv-request>) istream)
  "Deserializes a message object of type '<alarm_srv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'volume) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'loop_mode) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'filename) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fileorder) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<alarm_srv-request>)))
  "Returns string type for a service object of type '<alarm_srv-request>"
  "robot_msgs/alarm_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'alarm_srv-request)))
  "Returns string type for a service object of type 'alarm_srv-request"
  "robot_msgs/alarm_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<alarm_srv-request>)))
  "Returns md5sum for a message object of type '<alarm_srv-request>"
  "a8f167451be4b108ffefdf3f150aa1b6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'alarm_srv-request)))
  "Returns md5sum for a message object of type 'alarm_srv-request"
  "a8f167451be4b108ffefdf3f150aa1b6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<alarm_srv-request>)))
  "Returns full string definition for message of type '<alarm_srv-request>"
  (cl:format cl:nil "int64 volume~%int64 loop_mode~%int64 filename~%int64 fileorder~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'alarm_srv-request)))
  "Returns full string definition for message of type 'alarm_srv-request"
  (cl:format cl:nil "int64 volume~%int64 loop_mode~%int64 filename~%int64 fileorder~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <alarm_srv-request>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <alarm_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'alarm_srv-request
    (cl:cons ':volume (volume msg))
    (cl:cons ':loop_mode (loop_mode msg))
    (cl:cons ':filename (filename msg))
    (cl:cons ':fileorder (fileorder msg))
))
;//! \htmlinclude alarm_srv-response.msg.html

(cl:defclass <alarm_srv-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass alarm_srv-response (<alarm_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <alarm_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'alarm_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-srv:<alarm_srv-response> is deprecated: use robot_msgs-srv:alarm_srv-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <alarm_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:result-val is deprecated.  Use robot_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <alarm_srv-response>) ostream)
  "Serializes a message object of type '<alarm_srv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <alarm_srv-response>) istream)
  "Deserializes a message object of type '<alarm_srv-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<alarm_srv-response>)))
  "Returns string type for a service object of type '<alarm_srv-response>"
  "robot_msgs/alarm_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'alarm_srv-response)))
  "Returns string type for a service object of type 'alarm_srv-response"
  "robot_msgs/alarm_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<alarm_srv-response>)))
  "Returns md5sum for a message object of type '<alarm_srv-response>"
  "a8f167451be4b108ffefdf3f150aa1b6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'alarm_srv-response)))
  "Returns md5sum for a message object of type 'alarm_srv-response"
  "a8f167451be4b108ffefdf3f150aa1b6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<alarm_srv-response>)))
  "Returns full string definition for message of type '<alarm_srv-response>"
  (cl:format cl:nil "bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'alarm_srv-response)))
  "Returns full string definition for message of type 'alarm_srv-response"
  (cl:format cl:nil "bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <alarm_srv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <alarm_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'alarm_srv-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'alarm_srv)))
  'alarm_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'alarm_srv)))
  'alarm_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'alarm_srv)))
  "Returns string type for a service object of type '<alarm_srv>"
  "robot_msgs/alarm_srv")