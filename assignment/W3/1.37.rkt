#lang simply-scheme

(define n (lambda (i) 1.0))
(define d (lambda (i) 1.0))

(define (cont-frac n d k)
  (if (= k 1)
      1
      (/ (n 1) (+ (d 1) (cont-frac n d (- k 1))))))


(cont-frac n d 10)

(/ 1 (cont-frac n d 10))
(/ 1 (cont-frac n d 30))