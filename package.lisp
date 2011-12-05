;;;; package.lisp

(in-package #:cl-user)

(defpackage #:tilde-reader.reader
  (:use #:cl)
  (:export #:tilde-reader))

(defpackage #:tilde-reader
  (:use #:cl)
  (:import-from #:unset-macro-character
                #:unset-macro-character)
  (:shadowing-import-from #:tilde-reader.reader
                          #:tilde-reader)
  (:export #:install
           #:uninstall))

(defpackage #:tilde-reader.test
  (:use #:cl)
  (:import-from #:tilde-reader
                #:install
                #:uninstall)
  (:import-from #:tilde-reader.reader
                #:tilde-reader))
