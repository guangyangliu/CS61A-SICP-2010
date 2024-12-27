#lang simply-scheme
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))


(define (factorial_term a) a)

(define (next a)
  (+ a 1))

(accumulate * 1 factorial_term 1 next 10)

(define (filtered-accumulate combiner null-value term a next b predicate)
  (cond ((> a b) null-value)
        ((predicate a) (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b predicate)))
        (else (filtered-accumulate combiner null-value term (next a) next b predicate))))

(define (isPrimeHelper x k)
  (if (= x k) #t
  (if (= (remainder x k) 0) #f
      (isPrimeHelper x (+ k 1)))))

(define (prime? x )
    (cond
      (( = x 1 ) #t)
      (( = x 2 ) #t)
      ( else (isPrimeHelper x 2 ) )))




(filtered-accumulate + 0 (lambda (x) (* x x)) 1 next 10 prime?)