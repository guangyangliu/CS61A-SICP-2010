#lang simply-scheme

;(define (iterative-improve good_enough? update guess number)
;  (if (good_enough? guess number)
;      guess
;     (iterative-improve good_enough? update (update guess number) number)))




(define (sqrt number)
  (define (good_enough? guess)
    (< (abs (- (* guess guess) number)) 0.001))
  (define (update guess)
    (/ (+ guess (/ number guess)) 2.0))
  (define (iterative-improve good_enough? update)
    (define (iterate guess)
      (if (good_enough? guess)
          guess
          (iterate (update guess))))
    iterate)
  ((iterative-improve good_enough? update) 1.0))


(sqrt 9)



