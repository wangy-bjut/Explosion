;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::Gas_alarm)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'Gas_alarm (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::GAS_ALARM")
  (make-package "ROBOT_MSGS::GAS_ALARM"))
(unless (find-package "ROBOT_MSGS::GAS_ALARMREQUEST")
  (make-package "ROBOT_MSGS::GAS_ALARMREQUEST"))
(unless (find-package "ROBOT_MSGS::GAS_ALARMRESPONSE")
  (make-package "ROBOT_MSGS::GAS_ALARMRESPONSE"))

(in-package "ROS")





(defclass robot_msgs::Gas_alarmRequest
  :super ros::object
  :slots (_start ))

(defmethod robot_msgs::Gas_alarmRequest
  (:init
   (&key
    ((:start __start) nil)
    )
   (send-super :init)
   (setq _start __start)
   self)
  (:start
   (&optional __start)
   (if __start (setq _start __start)) _start)
  (:serialization-length
   ()
   (+
    ;; bool _start
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _start
       (if _start (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _start
     (setq _start (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robot_msgs::Gas_alarmResponse
  :super ros::object
  :slots (_result ))

(defmethod robot_msgs::Gas_alarmResponse
  (:init
   (&key
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _result (round __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; int64 _result
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _result
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _result (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _result) (= (length (_result . bv)) 2)) ;; bignum
              (write-long (ash (elt (_result . bv) 0) 0) s)
              (write-long (ash (elt (_result . bv) 1) -1) s))
             ((and (class _result) (= (length (_result . bv)) 1)) ;; big1
              (write-long (elt (_result . bv) 0) s)
              (write-long (if (>= _result 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _result s)(write-long (if (>= _result 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _result
#+(or :alpha :irix6 :x86_64)
      (setf _result (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _result (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass robot_msgs::Gas_alarm
  :super ros::object
  :slots ())

(setf (get robot_msgs::Gas_alarm :md5sum-) "ac6e499d07c665aef1a9fb36404cb426")
(setf (get robot_msgs::Gas_alarm :datatype-) "robot_msgs/Gas_alarm")
(setf (get robot_msgs::Gas_alarm :request) robot_msgs::Gas_alarmRequest)
(setf (get robot_msgs::Gas_alarm :response) robot_msgs::Gas_alarmResponse)

(defmethod robot_msgs::Gas_alarmRequest
  (:response () (instance robot_msgs::Gas_alarmResponse :init)))

(setf (get robot_msgs::Gas_alarmRequest :md5sum-) "ac6e499d07c665aef1a9fb36404cb426")
(setf (get robot_msgs::Gas_alarmRequest :datatype-) "robot_msgs/Gas_alarmRequest")
(setf (get robot_msgs::Gas_alarmRequest :definition-)
      "bool start
---
int64 result
")

(setf (get robot_msgs::Gas_alarmResponse :md5sum-) "ac6e499d07c665aef1a9fb36404cb426")
(setf (get robot_msgs::Gas_alarmResponse :datatype-) "robot_msgs/Gas_alarmResponse")
(setf (get robot_msgs::Gas_alarmResponse :definition-)
      "bool start
---
int64 result
")



(provide :robot_msgs/Gas_alarm "ac6e499d07c665aef1a9fb36404cb426")


