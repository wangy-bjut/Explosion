;; Auto-generated. Do not edit!


(when (boundp 'alarm_device::alarm_srv)
  (if (not (find-package "ALARM_DEVICE"))
    (make-package "ALARM_DEVICE"))
  (shadow 'alarm_srv (find-package "ALARM_DEVICE")))
(unless (find-package "ALARM_DEVICE::ALARM_SRV")
  (make-package "ALARM_DEVICE::ALARM_SRV"))
(unless (find-package "ALARM_DEVICE::ALARM_SRVREQUEST")
  (make-package "ALARM_DEVICE::ALARM_SRVREQUEST"))
(unless (find-package "ALARM_DEVICE::ALARM_SRVRESPONSE")
  (make-package "ALARM_DEVICE::ALARM_SRVRESPONSE"))

(in-package "ROS")





(defclass alarm_device::alarm_srvRequest
  :super ros::object
  :slots (_start_play _volume _loop_mode _filename _fileorder _list_n ))

(defmethod alarm_device::alarm_srvRequest
  (:init
   (&key
    ((:start_play __start_play) 0)
    ((:volume __volume) 0)
    ((:loop_mode __loop_mode) 0)
    ((:filename __filename) 0)
    ((:fileorder __fileorder) 0)
    ((:list_n __list_n) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _start_play (round __start_play))
   (setq _volume (round __volume))
   (setq _loop_mode (round __loop_mode))
   (setq _filename (round __filename))
   (setq _fileorder (round __fileorder))
   (setq _list_n __list_n)
   self)
  (:start_play
   (&optional __start_play)
   (if __start_play (setq _start_play __start_play)) _start_play)
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
  (:list_n
   (&optional __list_n)
   (if __list_n (setq _list_n __list_n)) _list_n)
  (:serialization-length
   ()
   (+
    ;; int64 _start_play
    8
    ;; int64 _volume
    8
    ;; int64 _loop_mode
    8
    ;; int64 _filename
    8
    ;; int64 _fileorder
    8
    ;; int64[] _list_n
    (* 8    (length _list_n)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _start_play
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _start_play (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _start_play) (= (length (_start_play . bv)) 2)) ;; bignum
              (write-long (ash (elt (_start_play . bv) 0) 0) s)
              (write-long (ash (elt (_start_play . bv) 1) -1) s))
             ((and (class _start_play) (= (length (_start_play . bv)) 1)) ;; big1
              (write-long (elt (_start_play . bv) 0) s)
              (write-long (if (>= _start_play 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _start_play s)(write-long (if (>= _start_play 0) 0 #xffffffff) s)))
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
     ;; int64[] _list_n
     (write-long (length _list_n) s)
     (dotimes (i (length _list_n))
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _list_n i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _list_n i)) (= (length ((elt _list_n i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _list_n i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _list_n i) . bv) 1) -1) s))
             ((and (class (elt _list_n i)) (= (length ((elt _list_n i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _list_n i) . bv) 0) s)
              (write-long (if (>= (elt _list_n i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _list_n i) s)(write-long (if (>= (elt _list_n i) 0) 0 #xffffffff) s)))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _start_play
#+(or :alpha :irix6 :x86_64)
      (setf _start_play (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _start_play (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
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
   ;; int64[] _list_n
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _list_n (instantiate integer-vector n))
     (dotimes (i n)
#+(or :alpha :irix6 :x86_64)
      (setf (elt _list_n i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _list_n i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     ))
   ;;
   self)
  )

(defclass alarm_device::alarm_srvResponse
  :super ros::object
  :slots ())

(defmethod alarm_device::alarm_srvResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass alarm_device::alarm_srv
  :super ros::object
  :slots ())

(setf (get alarm_device::alarm_srv :md5sum-) "eba3e264b7446975115540c352322db3")
(setf (get alarm_device::alarm_srv :datatype-) "alarm_device/alarm_srv")
(setf (get alarm_device::alarm_srv :request) alarm_device::alarm_srvRequest)
(setf (get alarm_device::alarm_srv :response) alarm_device::alarm_srvResponse)

(defmethod alarm_device::alarm_srvRequest
  (:response () (instance alarm_device::alarm_srvResponse :init)))

(setf (get alarm_device::alarm_srvRequest :md5sum-) "eba3e264b7446975115540c352322db3")
(setf (get alarm_device::alarm_srvRequest :datatype-) "alarm_device/alarm_srvRequest")
(setf (get alarm_device::alarm_srvRequest :definition-)
      "int64 start_play
int64 volume
int64 loop_mode
int64 filename
int64 fileorder
int64[] list_n
---

")

(setf (get alarm_device::alarm_srvResponse :md5sum-) "eba3e264b7446975115540c352322db3")
(setf (get alarm_device::alarm_srvResponse :datatype-) "alarm_device/alarm_srvResponse")
(setf (get alarm_device::alarm_srvResponse :definition-)
      "int64 start_play
int64 volume
int64 loop_mode
int64 filename
int64 fileorder
int64[] list_n
---

")



(provide :alarm_device/alarm_srv "eba3e264b7446975115540c352322db3")


