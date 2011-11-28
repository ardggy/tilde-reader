;;;; Reader Test

(in-package #:tilde-reader.test)

(define-test #:install
  (let ((*readtable* (copy-readtable nil)))
    (tilde-reader:install)

    (multiple-value-bind (func non-term-p) (get-macro-character #\~)
      (assert-eql (values #'tilde-reader.reader::tilde-reader t)
                  (values func non-term-p)))))

(define-test #:uninstall
  (let ((*readtable* (copy-readtable nil)))
    (tilde-reader:install)
    (tilde-reader:uninstall)

  (multiple-value-bind (func non-term-p) (get-macro-character #\~)
    (assert-eql (values nil nil) (values func non-term-p)))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (tilde-reader:install))

(define-test #:lambda.0
  (assert-eql nil (funcall ~(lambda () t))))

(define-test #:lambda.1
  (assert-eql t (funcall ~#'(lambda () nil))))

(define-test #:named-function
  (assert-equal '(nil) (remove-if ~#'null '(t nil))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (tilde-reader:uninstall))

