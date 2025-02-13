#lang simply-scheme


(define (cont-frac n d k i)
  (if (> i k)
      0
      (/ (n i)
         (+ (d i)
            (cont-frac n d k (+ i 1))))))

(define n (lambda (i) 1.0))


(define (d k)
  (define (x k)
    (/ (- k 2) 3))
  (cond ((= k 1) 1)
        ((= k 2) 2)
        ((integer? (x k))(+ (d (- k 1)) (d (- k 2)) (d (- k 3))))
        (else 1)))



(+ 2 (cont-frac n d 9 1))
(+ 2 (cont-frac n d 10 1))
(+ 2 (cont-frac n d 100 1))