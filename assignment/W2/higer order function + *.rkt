#lang simply-scheme
(define (accumulate combiner null-value term a next b)
  (if (= a b)
      (null-value a b)
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define factorial_combiner *)
(define (factorial_null-value a b)
  b)
(define (factorial_term a) a)
(define (next a)
  (+ a 1))

(accumulate factorial_combiner factorial_null-value factorial_term 1 next 10)


(define sum_combiner +)

(define (sum_null-value a b)
  b)

(define (sum_term a) a)

(define (sum_next a)
  (+ a 1))

(accumulate sum_combiner sum_null-value sum_term 1 sum_next 10)

(define (sum-int a b)
  (if (= a b)
      b
      (+ a (sum-int (+ a 1) b))))
(sum-int 1 10)