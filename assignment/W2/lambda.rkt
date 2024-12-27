#lang simply-scheme




(define (sumsq a b)
  (define (square x) (* x x))
  (+ (square a) (square b)))

(sumsq 3 4)

((lambda (a b)
   ((lambda (square)
(+ (square a) (square b))) (lambda (x) (* x x))))
3 4)

