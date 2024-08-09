; Auto-generated. Do not edit!


(cl:in-package alarm_device-srv)


;//! \htmlinclude alarm_srv-request.msg.html

(cl:defclass <alarm_srv-request> (roslisp-msg-protocol:ros-message)
  ((start_play
    :reader start_play
    :initarg :start_play
    :type cl:integer
    :initform 0)
   (volume
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
    :initform 0)
   (list_n
    :reader list_n
    :initarg :list_n
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass alarm_srv-request (<alarm_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <alarm_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'alarm_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name alarm_device-srv:<alarm_srv-request> is deprecated: use alarm_device-srv:alarm_srv-request instead.")))

(cl:ensure-generic-function 'start_play-val :lambda-list '(m))
(cl:defmethod start_play-val ((m <alarm_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alarm_device-srv:start_play-val is deprecated.  Use alarm_device-srv:start_play instead.")
  (start_play m))

(cl:ensure-generic-function 'volume-val :lambda-list '(m))
(cl:defmethod volume-val ((m <alarm_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alarm_device-srv:volume-val is deprecated.  Use alarm_device-srv:volume instead.")
  (volume m))

(cl:ensure-generic-function 'loop_mode-val :lambda-list '(m))
(cl:defmethod loop_mode-val ((m <alarm_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alarm_device-srv:loop_mode-val is deprecated.  Use alarm_device-srv:loop_mode instead.")
  (loop_mode m))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <alarm_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alarm_device-srv:filename-val is deprecated.  Use alarm_device-srv:filename instead.")
  (filename m))

(cl:ensure-generic-function 'fileorder-val :lambda-list '(m))
(cl:defmethod fileorder-val ((m <alarm_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alarm_device-srv:fileorder-val is deprecated.  Use alarm_device-srv:fileorder instead.")
  (fileorder m))

(cl:ensure-generic-function 'list_n-val :lambda-list '(m))
(cl:defmethod list_n-val ((m <alarm_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alarm_device-srv:list_n-val is deprecated.  Use alarm_device-srv:list_n instead.")
  (list_n m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <alarm_srv-request>) ostream)
  "Serializes a message object of type '<alarm_srv-request>"
  (cl:let* ((signed (cl:slot-value msg 'start_play)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'list_n))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    ))
   (cl:slot-value msg 'list_n))
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
      (cl:setf (cl:slot-value msg 'start_play) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
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
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'list_n) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'list_n)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<alarm_srv-request>)))
  "Returns string type for a service object of type '<alarm_srv-request>"
  "alarm_device/alarm_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'alarm_srv-request)))
  "Returns string type for a service object of type 'alarm_srv-request"
  "alarm_device/alarm_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<alarm_srv-request>)))
  "Returns md5sum for a message object of type '<alarm_srv-request>"
  "eba3e264b7446975115540c352322db3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'alarm_srv-request)))
  "Returns md5sum for a message object of type 'alarm_srv-request"
  "eba3e264b7446975115540c352322db3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<alarm_srv-request>)))
  "Returns full string definition for message of type '<alarm_srv-request>"
  (cl:format cl:nil "int64 start_play~%int64 volume~%int64 loop_mode~%int64 filename~%int64 fileorder~%int64[] list_n~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'alarm_srv-request)))
  "Returns full string definition for message of type 'alarm_srv-request"
  (cl:format cl:nil "int64 start_play~%int64 volume~%int64 loop_mode~%int64 filename~%int64 fileorder~%int64[] list_n~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <alarm_srv-request>))
  (cl:+ 0
     8
     8
     8
     8
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'list_n) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <alarm_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'alarm_srv-request
    (cl:cons ':start_play (start_play msg))
    (cl:cons ':volume (volume msg))
    (cl:cons ':loop_mode (loop_mode msg))
    (cl:cons ':filename (filename msg))
    (cl:cons ':fileorder (fileorder msg))
    (cl:cons ':list_n (list_n msg))
))
;//! \htmlinclude alarm_srv-response.msg.html

(cl:defclass <alarm_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass alarm_srv-response (<alarm_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <alarm_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'alarm_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name alarm_device-srv:<alarm_srv-response> is deprecated: use alarm_device-srv:alarm_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <alarm_srv-response>) ostream)
  "Serializes a message object of type '<alarm_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <alarm_srv-response>) istream)
  "Deserializes a message object of type '<alarm_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<alarm_srv-response>)))
  "Returns string type for a service object of type '<alarm_srv-response>"
  "alarm_device/alarm_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'alarm_srv-response)))
  "Returns string type for a service object of type 'alarm_srv-response"
  "alarm_device/alarm_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<alarm_srv-response>)))
  "Returns md5sum for a message object of type '<alarm_srv-response>"
  "eba3e264b7446975115540c352322db3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'alarm_srv-response)))
  "Returns md5sum for a message object of type 'alarm_srv-response"
  "eba3e264b7446975115540c352322db3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<alarm_srv-response>)))
  "Returns full string definition for message of type '<alarm_srv-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'alarm_srv-response)))
  "Returns full string definition for message of type 'alarm_srv-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <alarm_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <alarm_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'alarm_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'alarm_srv)))
  'alarm_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'alarm_srv)))
  'alarm_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'alarm_srv)))
  "Returns string type for a service object of type '<alarm_srv>"
  "alarm_device/alarm_srv")