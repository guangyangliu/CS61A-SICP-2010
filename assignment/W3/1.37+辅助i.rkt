#lang simply-scheme

(define (cont-frac n d k i)
  (if (> i k)
      0
      (/ (n i)
         (+ (d i)
            (cont-frac n d k (+ i 1))))))

(define n (lambda (i) 1.0))
(define d (lambda (i) 1.0))


(/ 1 (cont-frac n d 6 1))
(/ 1 (cont-frac n d 7 1))
(/ 1 (cont-frac n d 10 1))
(/ 1 (cont-frac n d 30 1))
(/ 1 (cont-frac n d 100 1))