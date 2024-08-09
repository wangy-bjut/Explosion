; Auto-generated. Do not edit!


(cl:in-package robot_msgs-srv)


;//! \htmlinclude temp_detection-request.msg.html

(cl:defclass <temp_detection-request> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass temp_detection-request (<temp_detection-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <temp_detection-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'temp_detection-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-srv:<temp_detection-request> is deprecated: use robot_msgs-srv:temp_detection-request instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <temp_detection-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:start-val is deprecated.  Use robot_msgs-srv:start instead.")
  (start m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <temp_detection-request>) ostream)
  "Serializes a message object of type '<temp_detection-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'start) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <temp_detection-request>) istream)
  "Deserializes a message object of type '<temp_detection-request>"
    (cl:setf (cl:slot-value msg 'start) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<temp_detection-request>)))
  "Returns string type for a service object of type '<temp_detection-request>"
  "robot_msgs/temp_detectionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'temp_detection-request)))
  "Returns string type for a service object of type 'temp_detection-request"
  "robot_msgs/temp_detectionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<temp_detection-request>)))
  "Returns md5sum for a message object of type '<temp_detection-request>"
  "fbe2b0e6d586ba7b0e807a33c06658ad")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'temp_detection-request)))
  "Returns md5sum for a message object of type 'temp_detection-request"
  "fbe2b0e6d586ba7b0e807a33c06658ad")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<temp_detection-request>)))
  "Returns full string definition for message of type '<temp_detection-request>"
  (cl:format cl:nil "bool start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'temp_detection-request)))
  "Returns full string definition for message of type 'temp_detection-request"
  (cl:format cl:nil "bool start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <temp_detection-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <temp_detection-request>))
  "Converts a ROS message object to a list"
  (cl:list 'temp_detection-request
    (cl:cons ':start (start msg))
))
;//! \htmlinclude temp_detection-response.msg.html

(cl:defclass <temp_detection-response> (roslisp-msg-protocol:ros-message)
  ((temp
    :reader temp
    :initarg :temp
    :type cl:float
    :initform 0.0))
)

(cl:defclass temp_detection-response (<temp_detection-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <temp_detection-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'temp_detection-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-srv:<temp_detection-response> is deprecated: use robot_msgs-srv:temp_detection-response instead.")))

(cl:ensure-generic-function 'temp-val :lambda-list '(m))
(cl:defmethod temp-val ((m <temp_detection-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-srv:temp-val is deprecated.  Use robot_msgs-srv:temp instead.")
  (temp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <temp_detection-response>) ostream)
  "Serializes a message object of type '<temp_detection-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'temp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <temp_detection-response>) istream)
  "Deserializes a message object of type '<temp_detection-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temp) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<temp_detection-response>)))
  "Returns string type for a service object of type '<temp_detection-response>"
  "robot_msgs/temp_detectionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'temp_detection-response)))
  "Returns string type for a service object of type 'temp_detection-response"
  "robot_msgs/temp_detectionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<temp_detection-response>)))
  "Returns md5sum for a message object of type '<temp_detection-response>"
  "fbe2b0e6d586ba7b0e807a33c06658ad")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'temp_detection-response)))
  "Returns md5sum for a message object of type 'temp_detection-response"
  "fbe2b0e6d586ba7b0e807a33c06658ad")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<temp_detection-response>)))
  "Returns full string definition for message of type '<temp_detection-response>"
  (cl:format cl:nil "float64 temp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'temp_detection-response)))
  "Returns full string definition for message of type 'temp_detection-response"
  (cl:format cl:nil "float64 temp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <temp_detection-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <temp_detection-response>))
  "Converts a ROS message object to a list"
  (cl:list 'temp_detection-response
    (cl:cons ':temp (temp msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'temp_detection)))
  'temp_detection-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'temp_detection)))
  'temp_detection-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'temp_detection)))
  "Returns string type for a service object of type '<temp_detection>"
  "robot_msgs/temp_detection")