
(cl:in-package :asdf)

(defsystem "alarm_device-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "alarm_srv" :depends-on ("_package_alarm_srv"))
    (:file "_package_alarm_srv" :depends-on ("_package"))
  ))