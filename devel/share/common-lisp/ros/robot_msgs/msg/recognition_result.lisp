; Auto-generated. Do not edit!


(cl:in-package robot_msgs-msg)


;//! \htmlinclude recognition_result.msg.html

(cl:defclass <recognition_result> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:float
    :initform 0.0)
   (picture_path
    :reader picture_path
    :initarg :picture_path
    :type cl:string
    :initform ""))
)

(cl:defclass recognition_result (<recognition_result>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <recognition_result>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'recognition_result)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-msg:<recognition_result> is deprecated: use robot_msgs-msg:recognition_result instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <recognition_result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:result-val is deprecated.  Use robot_msgs-msg:result instead.")
  (result m))

(cl:ensure-generic-function 'picture_path-val :lambda-list '(m))
(cl:defmethod picture_path-val ((m <recognition_result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:picture_path-val is deprecated.  Use robot_msgs-msg:picture_path instead.")
  (picture_path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <recognition_result>) ostream)
  "Serializes a message object of type '<recognition_result>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'picture_path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'picture_path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <recognition_result>) istream)
  "Deserializes a message object of type '<recognition_result>"
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
      (cl:setf (cl:slot-value msg 'picture_path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'picture_path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<recognition_result>)))
  "Returns string type for a message object of type '<recognition_result>"
  "robot_msgs/recognition_result")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'recognition_result)))
  "Returns string type for a message object of type 'recognition_result"
  "robot_msgs/recognition_result")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<recognition_result>)))
  "Returns md5sum for a message object of type '<recognition_result>"
  "d1ac07c1008c1e8b1c60798b28200991")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'recognition_result)))
  "Returns md5sum for a message object of type 'recognition_result"
  "d1ac07c1008c1e8b1c60798b28200991")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<recognition_result>)))
  "Returns full string definition for message of type '<recognition_result>"
  (cl:format cl:nil "float64 result~%string picture_path~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'recognition_result)))
  "Returns full string definition for message of type 'recognition_result"
  (cl:format cl:nil "float64 result~%string picture_path~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <recognition_result>))
  (cl:+ 0
     8
     4 (cl:length (cl:slot-value msg 'picture_path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <recognition_result>))
  "Converts a ROS message object to a list"
  (cl:list 'recognition_result
    (cl:cons ':result (result msg))
    (cl:cons ':picture_path (picture_path msg))
))
