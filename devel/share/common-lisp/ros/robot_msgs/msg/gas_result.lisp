; Auto-generated. Do not edit!


(cl:in-package robot_msgs-msg)


;//! \htmlinclude gas_result.msg.html

(cl:defclass <gas_result> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:float
    :initform 0.0))
)

(cl:defclass gas_result (<gas_result>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gas_result>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gas_result)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-msg:<gas_result> is deprecated: use robot_msgs-msg:gas_result instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <gas_result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:result-val is deprecated.  Use robot_msgs-msg:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gas_result>) ostream)
  "Serializes a message object of type '<gas_result>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gas_result>) istream)
  "Deserializes a message object of type '<gas_result>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'result) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gas_result>)))
  "Returns string type for a message object of type '<gas_result>"
  "robot_msgs/gas_result")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gas_result)))
  "Returns string type for a message object of type 'gas_result"
  "robot_msgs/gas_result")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gas_result>)))
  "Returns md5sum for a message object of type '<gas_result>"
  "db954e5de3aba73b237d07575e5cac28")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gas_result)))
  "Returns md5sum for a message object of type 'gas_result"
  "db954e5de3aba73b237d07575e5cac28")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gas_result>)))
  "Returns full string definition for message of type '<gas_result>"
  (cl:format cl:nil "float32 result~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gas_result)))
  "Returns full string definition for message of type 'gas_result"
  (cl:format cl:nil "float32 result~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gas_result>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gas_result>))
  "Converts a ROS message object to a list"
  (cl:list 'gas_result
    (cl:cons ':result (result msg))
))
