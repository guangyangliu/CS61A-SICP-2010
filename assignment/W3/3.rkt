#lang simply-scheme

(define (cont-frac n d k)
  (if (= k 1)
      1
      (/ n (+ d (cont-frac n d (- k 1))))))

(define (gratio k)
  (/ 1 (cont-frac 1.0 1.0 k)))

(gratio 7)



(define (dk k)
  (define (n k)
    (/ (- k 2) 3))
  (cond ((= k 1) 1)
        ((= k 2) 2)
        ((integer? (n k))(+ (dk (- k 1)) (dk (- k 2)) (dk (- k 3))))
        (else 1)))

(define (compute_e k)
  (+ 2 (cont-frac 1.0 (dk k) k)))

(compute_e 1000)
