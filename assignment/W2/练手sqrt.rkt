#lang simply-scheme

;(define (sqrt x)
;  (sqrt-iter 1.0 x))

;(define (sqrt-iter guess x)
;  (if (good-enough? guess x)
;      guess
;     (sqrt-iter (improve guess x) x)))

;(define (good-enough? guess x)
;  (< (abs (- (* guess guess) x)) 0.001))

;(define (improve guess x)
;  (/ (+ guess (/ x guess)) 2))


(define (sqrt x)
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (define (good-enough? guess)
    (< (abs (- (* guess guess) x)) 0.001))
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2))
  (sqrt-iter 1.0))

(sqrt 9)


  