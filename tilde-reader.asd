;;;; tilde-reader.asd

(in-package #:cl-user)

(asdf:defsystem #:tilde-reader
  :serial t
  :depends-on (#:unset-macro-character)
  :components ((:file "package")
               (:file "tilde-reader"))
  :perform (asdf:test-op :before (op c)
                         (let ((*readtable* (copy-readtable nil)))
                           (asdf:load-system :tilde-reader.test)))
  :perform (asdf:test-op :after (op c)
                         (lisp-unit:run-all-tests :tilde-reader.test)))

