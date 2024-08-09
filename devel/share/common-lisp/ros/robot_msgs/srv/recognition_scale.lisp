; Auto-generated. Do not edit!


(cl:in-package robot_msgs-srv)


;//! \htmlinclude recognition_scale-request.msg.html

(cl:defclass <recognition_scale-request> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass recognition_scale-request (<recognition_scale-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <recognition_scale-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'recognition_scale-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-srv:<recognition_scale-request> is deprecated: use robot_msgs-srv:recognition_scale-request instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <recognition_scale-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:start-val is deprecated.  Use robot_msgs-srv:start instead.")
  (start m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <recognition_scale-request>) ostream)
  "Serializes a message object of type '<recognition_scale-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'start) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <recognition_scale-request>) istream)
  "Deserializes a message object of type '<recognition_scale-request>"
    (cl:setf (cl:slot-value msg 'start) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<recognition_scale-request>)))
  "Returns string type for a service object of type '<recognition_scale-request>"
  "robot_msgs/recognition_scaleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'recognition_scale-request)))
  "Returns string type for a service object of type 'recognition_scale-request"
  "robot_msgs/recognition_scaleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<recognition_scale-request>)))
  "Returns md5sum for a message object of type '<recognition_scale-request>"
  "517170519764f280df543ca1d4bff866")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'recognition_scale-request)))
  "Returns md5sum for a message object of type 'recognition_scale-request"
  "517170519764f280df543ca1d4bff866")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<recognition_scale-request>)))
  "Returns full string definition for message of type '<recognition_scale-request>"
  (cl:format cl:nil "bool start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'recognition_scale-request)))
  "Returns full string definition for message of type 'recognition_scale-request"
  (cl:format cl:nil "bool start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <recognition_scale-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <recognition_scale-request>))
  "Converts a ROS message object to a list"
  (cl:list 'recognition_scale-request
    (cl:cons ':start (start msg))
))
;//! \htmlinclude recognition_scale-response.msg.html

(cl:defclass <recognition_scale-response> (roslisp-msg-protocol:ros-message)
  ((image_path
    :reader image_path
    :initarg :image_path
    :type cl:string
    :initform "")
   (result
    :reader result
    :initarg :result
    :type cl:float
    :initform 0.0)
   (time
    :reader time
    :initarg :time
    :type cl:string
    :initform ""))
)

(cl:defclass recognition_scale-response (<recognition_scale-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <recognition_scale-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'recognition_scale-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-srv:<recognition_scale-response> is deprecated: use robot_msgs-srv:recognition_scale-response instead.")))

(cl:ensure-generic-function 'image_path-val :lambda-list '(m))
(cl:defmethod image_path-val ((m <recognition_scale-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:image_path-val is deprecated.  Use robot_msgs-srv:image_path instead.")
  (image_path m))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <recognition_scale-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:result-val is deprecated.  Use robot_msgs-srv:result instead.")
  (result m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <recognition_scale-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:time-val is deprecated.  Use robot_msgs-srv:time instead.")
  (time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <recognition_scale-response>) ostream)
  "Serializes a message object of type '<recognition_scale-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'image_path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'image_path))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'time))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <recognition_scale-response>) istream)
  "Deserializes a message object of type '<recognition_scale-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'image_path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'image_path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'result) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'time) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'time) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<recognition_scale-response>)))
  "Returns string type for a service object of type '<recognition_scale-response>"
  "robot_msgs/recognition_scaleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'recognition_scale-response)))
  "Returns string type for a service object of type 'recognition_scale-response"
  "robot_msgs/recognition_scaleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<recognition_scale-response>)))
  "Returns md5sum for a message object of type '<recognition_scale-response>"
  "517170519764f280df543ca1d4bff866")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'recognition_scale-response)))
  "Returns md5sum for a message object of type 'recognition_scale-response"
  "517170519764f280df543ca1d4bff866")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<recognition_scale-response>)))
  "Returns full string definition for message of type '<recognition_scale-response>"
  (cl:format cl:nil "string image_path~%float64 result~%string time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'recognition_scale-response)))
  "Returns full string definition for message of type 'recognition_scale-response"
  (cl:format cl:nil "string image_path~%float64 result~%string time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <recognition_scale-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'image_path))
     8
     4 (cl:length (cl:slot-value msg 'time))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <recognition_scale-response>))
  "Converts a ROS message object to a list"
  (cl:list 'recognition_scale-response
    (cl:cons ':image_path (image_path msg))
    (cl:cons ':result (result msg))
    (cl:cons ':time (time msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'recognition_scale)))
  'recognition_scale-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'recognition_scale)))
  'recognition_scale-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'recognition_scale)))
  "Returns string type for a service object of type '<recognition_scale>"
  "robot_msgs/recognition_scale")