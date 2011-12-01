;;;; tilde-reader.lisp

;;; reader
(in-package #:tilde-reader.reader)

(defun tilde-reader (stream char)
  (declare (ignore char))
  `(complement ,(read stream t nil t)))

;;; API
(in-package #:tilde-reader)

(defun install ()
  "install to current readtable."
  (setf *readtable* (copy-readtable))
  (set-macro-character #\~ #'tilde-reader t))

(defun uninstall ()
  "macro-character will be nil."
  (setf *readtable* (copy-readtable))
  (unset-macro-character #\~ *readtable*))

