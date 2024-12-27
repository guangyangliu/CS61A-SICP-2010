#lang simply-scheme
(define (iterative-improve good_enough? update guess f)
  (if (good_enough? guess f)
      guess
      (iterative-improve good_enough? update (update guess f) f)))

(define (good_enough? guess f)
  (< (abs (- guess (f guess)))
     0.00001))

(define (update guess f)
  (f guess))


(define (fixed-point  f)
  (iterative-improve good_enough? update 1.0 f))
