; Auto-generated. Do not edit!


(cl:in-package robot_msgs-msg)


;//! \htmlinclude IoStatus.msg.html

(cl:defclass <IoStatus> (roslisp-msg-protocol:ros-message)
  ((status_stop
    :reader status_stop
    :initarg :status_stop
    :type cl:fixnum
    :initform 0)
   (status_slow
    :reader status_slow
    :initarg :status_slow
    :type cl:fixnum
    :initform 0))
)

(cl:defclass IoStatus (<IoStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IoStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IoStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-msg:<IoStatus> is deprecated: use robot_msgs-msg:IoStatus instead.")))

(cl:ensure-generic-function 'status_stop-val :lambda-list '(m))
(cl:defmethod status_stop-val ((m <IoStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:status_stop-val is deprecated.  Use robot_msgs-msg:status_stop instead.")
  (status_stop m))

(cl:ensure-generic-function 'status_slow-val :lambda-list '(m))
(cl:defmethod status_slow-val ((m <IoStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:status_slow-val is deprecated.  Use robot_msgs-msg:status_slow instead.")
  (status_slow m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IoStatus>) ostream)
  "Serializes a message object of type '<IoStatus>"
  (cl:let* ((signed (cl:slot-value msg 'status_stop)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'status_slow)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IoStatus>) istream)
  "Deserializes a message object of type '<IoStatus>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_stop) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_slow) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IoStatus>)))
  "Returns string type for a message object of type '<IoStatus>"
  "robot_msgs/IoStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IoStatus)))
  "Returns string type for a message object of type 'IoStatus"
  "robot_msgs/IoStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IoStatus>)))
  "Returns md5sum for a message object of type '<IoStatus>"
  "8c8bf31ab13adffd23ec7ea73641f167")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IoStatus)))
  "Returns md5sum for a message object of type 'IoStatus"
  "8c8bf31ab13adffd23ec7ea73641f167")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IoStatus>)))
  "Returns full string definition for message of type '<IoStatus>"
  (cl:format cl:nil "int8 status_stop~%int8 status_slow~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IoStatus)))
  "Returns full string definition for message of type 'IoStatus"
  (cl:format cl:nil "int8 status_stop~%int8 status_slow~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IoStatus>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IoStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'IoStatus
    (cl:cons ':status_stop (status_stop msg))
    (cl:cons ':status_slow (status_slow msg))
))
