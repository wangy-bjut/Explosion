; Auto-generated. Do not edit!


(cl:in-package robot_msgs-msg)


;//! \htmlinclude chasis.msg.html

(cl:defclass <chasis> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type robot_msgs-msg:robot_pose
    :initform (cl:make-instance 'robot_msgs-msg:robot_pose))
   (cmd
    :reader cmd
    :initarg :cmd
    :type robot_msgs-msg:robot_cmd
    :initform (cl:make-instance 'robot_msgs-msg:robot_cmd)))
)

(cl:defclass chasis (<chasis>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <chasis>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'chasis)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-msg:<chasis> is deprecated: use robot_msgs-msg:chasis instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <chasis>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:pose-val is deprecated.  Use robot_msgs-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'cmd-val :lambda-list '(m))
(cl:defmethod cmd-val ((m <chasis>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:cmd-val is deprecated.  Use robot_msgs-msg:cmd instead.")
  (cmd m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <chasis>) ostream)
  "Serializes a message object of type '<chasis>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'cmd) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <chasis>) istream)
  "Deserializes a message object of type '<chasis>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'cmd) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<chasis>)))
  "Returns string type for a message object of type '<chasis>"
  "robot_msgs/chasis")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'chasis)))
  "Returns string type for a message object of type 'chasis"
  "robot_msgs/chasis")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<chasis>)))
  "Returns md5sum for a message object of type '<chasis>"
  "3692867e47a9cfbea9dd44466659fd6d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'chasis)))
  "Returns md5sum for a message object of type 'chasis"
  "3692867e47a9cfbea9dd44466659fd6d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<chasis>)))
  "Returns full string definition for message of type '<chasis>"
  (cl:format cl:nil "robot_msgs/robot_pose pose~%robot_msgs/robot_cmd cmd~%================================================================================~%MSG: robot_msgs/robot_pose~%float32 x~%float32 y~%float32 yaw~%================================================================================~%MSG: robot_msgs/robot_cmd~%float32 linear~%float32 angular~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'chasis)))
  "Returns full string definition for message of type 'chasis"
  (cl:format cl:nil "robot_msgs/robot_pose pose~%robot_msgs/robot_cmd cmd~%================================================================================~%MSG: robot_msgs/robot_pose~%float32 x~%float32 y~%float32 yaw~%================================================================================~%MSG: robot_msgs/robot_cmd~%float32 linear~%float32 angular~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <chasis>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'cmd))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <chasis>))
  "Converts a ROS message object to a list"
  (cl:list 'chasis
    (cl:cons ':pose (pose msg))
    (cl:cons ':cmd (cmd msg))
))
