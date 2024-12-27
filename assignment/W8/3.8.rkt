#lang simply-scheme

;new answer
;(f 0)= 1/2 (f 1) = -1/2
;(f 1) = 1/2 (f 0) = 1/2
(define f
  (let ((history (/ -1 2)))
    (lambda (x)
      (set! history (+ x history))
      history)))