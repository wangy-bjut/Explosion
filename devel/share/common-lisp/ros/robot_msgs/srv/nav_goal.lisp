; Auto-generated. Do not edit!


(cl:in-package robot_msgs-srv)


;//! \htmlinclude nav_goal-request.msg.html

(cl:defclass <nav_goal-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (th
    :reader th
    :initarg :th
    :type cl:float
    :initform 0.0))
)

(cl:defclass nav_goal-request (<nav_goal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <nav_goal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'nav_goal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-srv:<nav_goal-request> is deprecated: use robot_msgs-srv:nav_goal-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <nav_goal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:x-val is deprecated.  Use robot_msgs-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <nav_goal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:y-val is deprecated.  Use robot_msgs-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'th-val :lambda-list '(m))
(cl:defmethod th-val ((m <nav_goal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:th-val is deprecated.  Use robot_msgs-srv:th instead.")
  (th m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <nav_goal-request>) ostream)
  "Serializes a message object of type '<nav_goal-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'th))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <nav_goal-request>) istream)
  "Deserializes a message object of type '<nav_goal-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'th) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<nav_goal-request>)))
  "Returns string type for a service object of type '<nav_goal-request>"
  "robot_msgs/nav_goalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'nav_goal-request)))
  "Returns string type for a service object of type 'nav_goal-request"
  "robot_msgs/nav_goalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<nav_goal-request>)))
  "Returns md5sum for a message object of type '<nav_goal-request>"
  "6f7829491dcb15f3121622bb0d29b3ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'nav_goal-request)))
  "Returns md5sum for a message object of type 'nav_goal-request"
  "6f7829491dcb15f3121622bb0d29b3ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<nav_goal-request>)))
  "Returns full string definition for message of type '<nav_goal-request>"
  (cl:format cl:nil "float64 x~%float64 y~%float64 th~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'nav_goal-request)))
  "Returns full string definition for message of type 'nav_goal-request"
  (cl:format cl:nil "float64 x~%float64 y~%float64 th~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <nav_goal-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <nav_goal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'nav_goal-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':th (th msg))
))
;//! \htmlinclude nav_goal-response.msg.html

(cl:defclass <nav_goal-response> (roslisp-msg-protocol:ros-message)
  ((th
    :reader th
    :initarg :th
    :type cl:integer
    :initform 0)
   (success
    :reader success
    :initarg :success
    :type cl:fixnum
    :initform 0)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass nav_goal-response (<nav_goal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <nav_goal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'nav_goal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-srv:<nav_goal-response> is deprecated: use robot_msgs-srv:nav_goal-response instead.")))

(cl:ensure-generic-function 'th-val :lambda-list '(m))
(cl:defmethod th-val ((m <nav_goal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:th-val is deprecated.  Use robot_msgs-srv:th instead.")
  (th m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <nav_goal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:success-val is deprecated.  Use robot_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <nav_goal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:message-val is deprecated.  Use robot_msgs-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <nav_goal-response>) ostream)
  "Serializes a message object of type '<nav_goal-response>"
  (cl:let* ((signed (cl:slot-value msg 'th)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'success)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <nav_goal-response>) istream)
  "Deserializes a message object of type '<nav_goal-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'th) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'success) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<nav_goal-response>)))
  "Returns string type for a service object of type '<nav_goal-response>"
  "robot_msgs/nav_goalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'nav_goal-response)))
  "Returns string type for a service object of type 'nav_goal-response"
  "robot_msgs/nav_goalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<nav_goal-response>)))
  "Returns md5sum for a message object of type '<nav_goal-response>"
  "6f7829491dcb15f3121622bb0d29b3ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'nav_goal-response)))
  "Returns md5sum for a message object of type 'nav_goal-response"
  "6f7829491dcb15f3121622bb0d29b3ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<nav_goal-response>)))
  "Returns full string definition for message of type '<nav_goal-response>"
  (cl:format cl:nil "int32 th~%int8 success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'nav_goal-response)))
  "Returns full string definition for message of type 'nav_goal-response"
  (cl:format cl:nil "int32 th~%int8 success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <nav_goal-response>))
  (cl:+ 0
     4
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <nav_goal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'nav_goal-response
    (cl:cons ':th (th msg))
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'nav_goal)))
  'nav_goal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'nav_goal)))
  'nav_goal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'nav_goal)))
  "Returns string type for a service object of type '<nav_goal>"
  "robot_msgs/nav_goal")