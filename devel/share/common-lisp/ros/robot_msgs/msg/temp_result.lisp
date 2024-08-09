; Auto-generated. Do not edit!


(cl:in-package robot_msgs-msg)


;//! \htmlinclude temp_result.msg.html

(cl:defclass <temp_result> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:float
    :initform 0.0))
)

(cl:defclass temp_result (<temp_result>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <temp_result>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'temp_result)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-msg:<temp_result> is deprecated: use robot_msgs-msg:temp_result instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <temp_result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:result-val is deprecated.  Use robot_msgs-msg:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <temp_result>) ostream)
  "Serializes a message object of type '<temp_result>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <temp_result>) istream)
  "Deserializes a message object of type '<temp_result>"
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<temp_result>)))
  "Returns string type for a message object of type '<temp_result>"
  "robot_msgs/temp_result")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'temp_result)))
  "Returns string type for a message object of type 'temp_result"
  "robot_msgs/temp_result")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<temp_result>)))
  "Returns md5sum for a message object of type '<temp_result>"
  "254fb2d8c4e08eff5dc6a560ed51dd52")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'temp_result)))
  "Returns md5sum for a message object of type 'temp_result"
  "254fb2d8c4e08eff5dc6a560ed51dd52")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<temp_result>)))
  "Returns full string definition for message of type '<temp_result>"
  (cl:format cl:nil "float64 result~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'temp_result)))
  "Returns full string definition for message of type 'temp_result"
  (cl:format cl:nil "float64 result~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <temp_result>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <temp_result>))
  "Converts a ROS message object to a list"
  (cl:list 'temp_result
    (cl:cons ':result (result msg))
))
