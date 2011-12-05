;;;; Reader Test

(in-package #:tilde-reader.test)

(5am:def-suite :tilde-reader.test)

(5am:def-suite :installation :in :tilde-reader.test)
(5am:def-suite :runtime :in :tilde-reader.test)

(5am:in-suite :installation)

(5am:test :install
  (let ((*readtable* (copy-readtable nil)))
    (tilde-reader:install)

    (multiple-value-bind (func non-term-p) (get-macro-character #\~ *readtable*)
      (5am:is (eql #'tilde-reader.reader::tilde-reader func))
      (5am:is (eq t non-term-p)))))

(5am:test :uninstall
  (let ((*readtable* (copy-readtable nil)))
    (tilde-reader:install)
    (tilde-reader:uninstall)

  (multiple-value-bind (func non-term-p) (get-macro-character #\~ *readtable*)
    (5am:is (equal (multiple-value-list (get-macro-character #\~ (copy-readtable nil)))
                   (multiple-value-list (values func non-term-p)))))))

(5am:test :post-uninstall
  (let ((*readtable* (copy-readtable nil)))
    (tilde-reader:install)
    (tilde-reader:uninstall)
    ;; catch error by reference |~#|
    (let ((form (read-from-string "(remove-if ~#'null '(nil t))")))
      (5am:signals unbound-variable (eval form)))))

(5am:in-suite :runtime)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (tilde-reader:install))

(5am:test :lambda.0
  (5am:is-false (funcall ~(lambda () t))))

(5am:test :lambda.1
  (5am:is-true (funcall ~#'(lambda () nil))))

(5am:test :named.0
  (5am:is (equal '(nil) (remove-if ~#'null '(t nil)))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (tilde-reader:uninstall))

