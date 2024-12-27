#lang simply-scheme

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial_term x)
  x)

(define (next x)
  (+ x 1))

(define (pi_term x)
  (* (/ (* 2 x) (+ 1 (* 2 x)))
     (/ (+ 2 (* 2 x)) (+ 1 (* 2 x)))))

(define (! n) (product (lambda (x) x) 1 (lambda (x) (+ 1 x)) n))
(! 10)

(define (pi a b) (* 4.0 (product pi_term a next b)))
(pi 1 10000)