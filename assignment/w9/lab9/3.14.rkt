#lang sicp

(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

;mystery is used to reverse a list by mutation.

(define v (list 'a 'b 'c 'd))
;v war changed only once when (set-cdr! v '())->'(a)
;what set-cdr! do later has nothing to do with v.

(define w (mystery v))