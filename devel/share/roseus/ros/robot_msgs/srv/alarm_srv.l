;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::alarm_srv)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'alarm_srv (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::ALARM_SRV")
  (make-package "ROBOT_MSGS::ALARM_SRV"))
(unless (find-package "ROBOT_MSGS::ALARM_SRVREQUEST")
  (make-package "ROBOT_MSGS::ALARM_SRVREQUEST"))
(unless (find-package "ROBOT_MSGS::ALARM_SRVRESPONSE")
  (make-package "ROBOT_MSGS::ALARM_SRVRESPONSE"))

(in-package "ROS")





(defclass robot_msgs::alarm_srvRequest
  :super ros::object
  :slots (_volume _loop_mode _filename _fileorder ))

(defmethod robot_msgs::alarm_srvRequest
  (:init
   (&key
    ((:volume __volume) 0)
    ((:loop_mode __loop_mode) 0)
    ((:filename __filename) 0)
    ((:fileorder __fileorder) 0)
    )
   (send-super :init)
   (setq _volume (round __volume))
   (setq _loop_mode (round __loop_mode))
   (setq _filename (round __filename))
   (setq _fileorder (round __fileorder))
   self)
  (:volume
   (&optional __volume)
   (if __volume (setq _volume __volume)) _volume)
  (:loop_mode
   (&optional __loop_mode)
   (if __loop_mode (setq _loop_mode __loop_mode)) _loop_mode)
  (:filename
   (&optional __filename)
   (if __filename (setq _filename __filename)) _filename)
  (:fileorder
   (&optional __fileorder)
   (if __fileorder (setq _fileorder __fileorder)) _fileorder)
  (:serialization-length
   ()
   (+
    ;; int64 _volume
    8
    ;; int64 _loop_mode
    8
    ;; int64 _filename
    8
    ;; int64 _fileorder
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _volume
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _volume (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _volume) (= (length (_volume . bv)) 2)) ;; bignum
              (write-long (ash (elt (_volume . bv) 0) 0) s)
              (write-long (ash (elt (_volume . bv) 1) -1) s))
             ((and (class _volume) (= (length (_volume . bv)) 1)) ;; big1
              (write-long (elt (_volume . bv) 0) s)
              (write-long (if (>= _volume 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _volume s)(write-long (if (>= _volume 0) 0 #xffffffff) s)))
     ;; int64 _loop_mode
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _loop_mode (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _loop_mode) (= (length (_loop_mode . bv)) 2)) ;; bignum
              (write-long (ash (elt (_loop_mode . bv) 0) 0) s)
              (write-long (ash (elt (_loop_mode . bv) 1) -1) s))
             ((and (class _loop_mode) (= (length (_loop_mode . bv)) 1)) ;; big1
              (write-long (elt (_loop_mode . bv) 0) s)
              (write-long (if (>= _loop_mode 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _loop_mode s)(write-long (if (>= _loop_mode 0) 0 #xffffffff) s)))
     ;; int64 _filename
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _filename (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _filename) (= (length (_filename . bv)) 2)) ;; bignum
              (write-long (ash (elt (_filename . bv) 0) 0) s)
              (write-long (ash (elt (_filename . bv) 1) -1) s))
             ((and (class _filename) (= (length (_filename . bv)) 1)) ;; big1
              (write-long (elt (_filename . bv) 0) s)
              (write-long (if (>= _filename 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _filename s)(write-long (if (>= _filename 0) 0 #xffffffff) s)))
     ;; int64 _fileorder
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _fileorder (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _fileorder) (= (length (_fileorder . bv)) 2)) ;; bignum
              (write-long (ash (elt (_fileorder . bv) 0) 0) s)
              (write-long (ash (elt (_fileorder . bv) 1) -1) s))
             ((and (class _fileorder) (= (length (_fileorder . bv)) 1)) ;; big1
              (write-long (elt (_fileorder . bv) 0) s)
              (write-long (if (>= _fileorder 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _fileorder s)(write-long (if (>= _fileorder 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _volume
#+(or :alpha :irix6 :x86_64)
      (setf _volume (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _volume (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _loop_mode
#+(or :alpha :irix6 :x86_64)
      (setf _loop_mode (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _loop_mode (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _filename
#+(or :alpha :irix6 :x86_64)
      (setf _filename (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _filename (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _fileorder
#+(or :alpha :irix6 :x86_64)
      (setf _fileorder (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _fileorder (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass robot_msgs::alarm_srvResponse
  :super ros::object
  :slots (_result ))

(defmethod robot_msgs::alarm_srvResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robot_msgs::alarm_srv
  :super ros::object
  :slots ())

(setf (get robot_msgs::alarm_srv :md5sum-) "a8f167451be4b108ffefdf3f150aa1b6")
(setf (get robot_msgs::alarm_srv :datatype-) "robot_msgs/alarm_srv")
(setf (get robot_msgs::alarm_srv :request) robot_msgs::alarm_srvRequest)
(setf (get robot_msgs::alarm_srv :response) robot_msgs::alarm_srvResponse)

(defmethod robot_msgs::alarm_srvRequest
  (:response () (instance robot_msgs::alarm_srvResponse :init)))

(setf (get robot_msgs::alarm_srvRequest :md5sum-) "a8f167451be4b108ffefdf3f150aa1b6")
(setf (get robot_msgs::alarm_srvRequest :datatype-) "robot_msgs/alarm_srvRequest")
(setf (get robot_msgs::alarm_srvRequest :definition-)
      "int64 volume
int64 loop_mode
int64 filename
int64 fileorder
---
bool result
")

(setf (get robot_msgs::alarm_srvResponse :md5sum-) "a8f167451be4b108ffefdf3f150aa1b6")
(setf (get robot_msgs::alarm_srvResponse :datatype-) "robot_msgs/alarm_srvResponse")
(setf (get robot_msgs::alarm_srvResponse :definition-)
      "int64 volume
int64 loop_mode
int64 filename
int64 fileorder
---
bool result
")



(provide :robot_msgs/alarm_srv "a8f167451be4b108ffefdf3f150aa1b6")


