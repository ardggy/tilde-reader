;;;; Reader's test

(in-package #:cl-user)

(asdf:defsystem #:tilde-reader.test
  :serial t
  :depends-on (#:tilde-reader
               #:lisp-unit)
  :components ((:file "package")
               (:module "t"
                        :components ((:file "test")))))



