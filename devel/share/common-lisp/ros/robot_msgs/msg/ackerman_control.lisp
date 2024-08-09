; Auto-generated. Do not edit!


(cl:in-package robot_msgs-msg)


;//! \htmlinclude ackerman_control.msg.html

(cl:defclass <ackerman_control> (roslisp-msg-protocol:ros-message)
  ((speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0)
   (turn
    :reader turn
    :initarg :turn
    :type cl:float
    :initform 0.0))
)

(cl:defclass ackerman_control (<ackerman_control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ackerman_control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ackerman_control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-msg:<ackerman_control> is deprecated: use robot_msgs-msg:ackerman_control instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <ackerman_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:speed-val is deprecated.  Use robot_msgs-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'turn-val :lambda-list '(m))
(cl:defmethod turn-val ((m <ackerman_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:turn-val is deprecated.  Use robot_msgs-msg:turn instead.")
  (turn m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ackerman_control>) ostream)
  "Serializes a message object of type '<ackerman_control>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'turn))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ackerman_control>) istream)
  "Deserializes a message object of type '<ackerman_control>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'turn) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ackerman_control>)))
  "Returns string type for a message object of type '<ackerman_control>"
  "robot_msgs/ackerman_control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ackerman_control)))
  "Returns string type for a message object of type 'ackerman_control"
  "robot_msgs/ackerman_control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ackerman_control>)))
  "Returns md5sum for a message object of type '<ackerman_control>"
  "e988c63435e382a0630b5b772d96ecf7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ackerman_control)))
  "Returns md5sum for a message object of type 'ackerman_control"
  "e988c63435e382a0630b5b772d96ecf7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ackerman_control>)))
  "Returns full string definition for message of type '<ackerman_control>"
  (cl:format cl:nil "float32 speed~%float32 turn~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ackerman_control)))
  "Returns full string definition for message of type 'ackerman_control"
  (cl:format cl:nil "float32 speed~%float32 turn~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ackerman_control>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ackerman_control>))
  "Converts a ROS message object to a list"
  (cl:list 'ackerman_control
    (cl:cons ':speed (speed msg))
    (cl:cons ':turn (turn msg))
))
