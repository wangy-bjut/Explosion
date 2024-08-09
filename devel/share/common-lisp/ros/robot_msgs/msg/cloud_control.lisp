; Auto-generated. Do not edit!


(cl:in-package robot_msgs-msg)


;//! \htmlinclude cloud_control.msg.html

(cl:defclass <cloud_control> (roslisp-msg-protocol:ros-message)
  ((direction
    :reader direction
    :initarg :direction
    :type cl:string
    :initform "")
   (angular_percent
    :reader angular_percent
    :initarg :angular_percent
    :type cl:float
    :initform 0.0)
   (zero
    :reader zero
    :initarg :zero
    :type cl:boolean
    :initform cl:nil)
   (scrub
    :reader scrub
    :initarg :scrub
    :type cl:boolean
    :initform cl:nil)
   (light
    :reader light
    :initarg :light
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass cloud_control (<cloud_control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cloud_control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cloud_control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-msg:<cloud_control> is deprecated: use robot_msgs-msg:cloud_control instead.")))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <cloud_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:direction-val is deprecated.  Use robot_msgs-msg:direction instead.")
  (direction m))

(cl:ensure-generic-function 'angular_percent-val :lambda-list '(m))
(cl:defmethod angular_percent-val ((m <cloud_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:angular_percent-val is deprecated.  Use robot_msgs-msg:angular_percent instead.")
  (angular_percent m))

(cl:ensure-generic-function 'zero-val :lambda-list '(m))
(cl:defmethod zero-val ((m <cloud_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:zero-val is deprecated.  Use robot_msgs-msg:zero instead.")
  (zero m))

(cl:ensure-generic-function 'scrub-val :lambda-list '(m))
(cl:defmethod scrub-val ((m <cloud_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:scrub-val is deprecated.  Use robot_msgs-msg:scrub instead.")
  (scrub m))

(cl:ensure-generic-function 'light-val :lambda-list '(m))
(cl:defmethod light-val ((m <cloud_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:light-val is deprecated.  Use robot_msgs-msg:light instead.")
  (light m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cloud_control>) ostream)
  "Serializes a message object of type '<cloud_control>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'direction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'direction))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angular_percent))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'zero) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'scrub) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'light) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cloud_control>) istream)
  "Deserializes a message object of type '<cloud_control>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'direction) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'direction) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angular_percent) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'zero) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'scrub) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'light) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cloud_control>)))
  "Returns string type for a message object of type '<cloud_control>"
  "robot_msgs/cloud_control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cloud_control)))
  "Returns string type for a message object of type 'cloud_control"
  "robot_msgs/cloud_control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cloud_control>)))
  "Returns md5sum for a message object of type '<cloud_control>"
  "8a0daeeb4fd2f539306a2fb5b806e7f7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cloud_control)))
  "Returns md5sum for a message object of type 'cloud_control"
  "8a0daeeb4fd2f539306a2fb5b806e7f7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cloud_control>)))
  "Returns full string definition for message of type '<cloud_control>"
  (cl:format cl:nil "string direction~%float64 angular_percent~%bool zero~%bool scrub~%bool light~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cloud_control)))
  "Returns full string definition for message of type 'cloud_control"
  (cl:format cl:nil "string direction~%float64 angular_percent~%bool zero~%bool scrub~%bool light~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cloud_control>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'direction))
     8
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cloud_control>))
  "Converts a ROS message object to a list"
  (cl:list 'cloud_control
    (cl:cons ':direction (direction msg))
    (cl:cons ':angular_percent (angular_percent msg))
    (cl:cons ':zero (zero msg))
    (cl:cons ':scrub (scrub msg))
    (cl:cons ':light (light msg))
))
