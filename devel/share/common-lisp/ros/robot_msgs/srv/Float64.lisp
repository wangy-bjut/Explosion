; Auto-generated. Do not edit!


(cl:in-package robot_msgs-srv)


;//! \htmlinclude Float64-request.msg.html

(cl:defclass <Float64-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:float
    :initform 0.0))
)

(cl:defclass Float64-request (<Float64-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Float64-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Float64-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-srv:<Float64-request> is deprecated: use robot_msgs-srv:Float64-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <Float64-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:data-val is deprecated.  Use robot_msgs-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Float64-request>) ostream)
  "Serializes a message object of type '<Float64-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Float64-request>) istream)
  "Deserializes a message object of type '<Float64-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'data) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Float64-request>)))
  "Returns string type for a service object of type '<Float64-request>"
  "robot_msgs/Float64Request")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Float64-request)))
  "Returns string type for a service object of type 'Float64-request"
  "robot_msgs/Float64Request")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Float64-request>)))
  "Returns md5sum for a message object of type '<Float64-request>"
  "3f47c51e9da05852f0d7f484f9279955")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Float64-request)))
  "Returns md5sum for a message object of type 'Float64-request"
  "3f47c51e9da05852f0d7f484f9279955")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Float64-request>)))
  "Returns full string definition for message of type '<Float64-request>"
  (cl:format cl:nil "float64 data    #Unit: metre~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Float64-request)))
  "Returns full string definition for message of type 'Float64-request"
  (cl:format cl:nil "float64 data    #Unit: metre~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Float64-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Float64-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Float64-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude Float64-response.msg.html

(cl:defclass <Float64-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass Float64-response (<Float64-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Float64-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Float64-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-srv:<Float64-response> is deprecated: use robot_msgs-srv:Float64-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Float64-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:success-val is deprecated.  Use robot_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <Float64-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:message-val is deprecated.  Use robot_msgs-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Float64-response>) ostream)
  "Serializes a message object of type '<Float64-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Float64-response>) istream)
  "Deserializes a message object of type '<Float64-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Float64-response>)))
  "Returns string type for a service object of type '<Float64-response>"
  "robot_msgs/Float64Response")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Float64-response)))
  "Returns string type for a service object of type 'Float64-response"
  "robot_msgs/Float64Response")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Float64-response>)))
  "Returns md5sum for a message object of type '<Float64-response>"
  "3f47c51e9da05852f0d7f484f9279955")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Float64-response)))
  "Returns md5sum for a message object of type 'Float64-response"
  "3f47c51e9da05852f0d7f484f9279955")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Float64-response>)))
  "Returns full string definition for message of type '<Float64-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Float64-response)))
  "Returns full string definition for message of type 'Float64-response"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Float64-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Float64-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Float64-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Float64)))
  'Float64-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Float64)))
  'Float64-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Float64)))
  "Returns string type for a service object of type '<Float64>"
  "robot_msgs/Float64")