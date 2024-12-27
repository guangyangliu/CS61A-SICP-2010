#lang simply-scheme

(define (product_factorial x)
  (if (= x 1)
      1
      (* x (product_factorial (- x 1)))))

(define (product_integers x y)
  (if (= x y)
      x
      (* y (product_integers x (- y 1)))))

(define (product_pi x y)
  (if (= x y)
      (pi_term x)
      (* (pi_term y) (product_pi x (- y 1)))))

(define (pi_term x)
  (* (/ (* 2 x) (+ 1 (* 2 x)))
     (/ (+ 2 (* 2 x)) (+ 1 (* 2 x)))))


