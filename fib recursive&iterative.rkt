#lang simply-scheme




(define (fib pre cur n)
  (if (= n 0)
      pre
      (fib cur (+ cur pre) (- n 1))))

;state variable: pre cur n
;state update rule: (fib cur (+cur pre) (- n 1)))
;terminator : (if (= n 0) pre)

(define (fr n)
  (if (< n 2)
      n
      (+ (fr (- n 1))
         (fr (- n 2)))))

