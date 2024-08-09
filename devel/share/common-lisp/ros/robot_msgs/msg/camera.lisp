; Auto-generated. Do not edit!


(cl:in-package robot_msgs-msg)


;//! \htmlinclude camera.msg.html

(cl:defclass <camera> (roslisp-msg-protocol:ros-message)
  ((angle
    :reader angle
    :initarg :angle
    :type robot_msgs-msg:cloud_angletims
    :initform (cl:make-instance 'robot_msgs-msg:cloud_angletims))
   (control
    :reader control
    :initarg :control
    :type robot_msgs-msg:cloud_control
    :initform (cl:make-instance 'robot_msgs-msg:cloud_control)))
)

(cl:defclass camera (<camera>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <camera>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'camera)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-msg:<camera> is deprecated: use robot_msgs-msg:camera instead.")))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <camera>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:angle-val is deprecated.  Use robot_msgs-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'control-val :lambda-list '(m))
(cl:defmethod control-val ((m <camera>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:control-val is deprecated.  Use robot_msgs-msg:control instead.")
  (control m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <camera>) ostream)
  "Serializes a message object of type '<camera>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'angle) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'control) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <camera>) istream)
  "Deserializes a message object of type '<camera>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'angle) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'control) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<camera>)))
  "Returns string type for a message object of type '<camera>"
  "robot_msgs/camera")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'camera)))
  "Returns string type for a message object of type 'camera"
  "robot_msgs/camera")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<camera>)))
  "Returns md5sum for a message object of type '<camera>"
  "1dbe9d74bdb2340b22cd82e8b27560c6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'camera)))
  "Returns md5sum for a message object of type 'camera"
  "1dbe9d74bdb2340b22cd82e8b27560c6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<camera>)))
  "Returns full string definition for message of type '<camera>"
  (cl:format cl:nil "robot_msgs/cloud_angletims angle~%robot_msgs/cloud_control control ~%================================================================================~%MSG: robot_msgs/cloud_angletims~%float32 yaw~%float32 pitch~%================================================================================~%MSG: robot_msgs/cloud_control~%string direction~%float64 angular_percent~%bool zero~%bool scrub~%bool light~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'camera)))
  "Returns full string definition for message of type 'camera"
  (cl:format cl:nil "robot_msgs/cloud_angletims angle~%robot_msgs/cloud_control control ~%================================================================================~%MSG: robot_msgs/cloud_angletims~%float32 yaw~%float32 pitch~%================================================================================~%MSG: robot_msgs/cloud_control~%string direction~%float64 angular_percent~%bool zero~%bool scrub~%bool light~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <camera>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'angle))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'control))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <camera>))
  "Converts a ROS message object to a list"
  (cl:list 'camera
    (cl:cons ':angle (angle msg))
    (cl:cons ':control (control msg))
))
