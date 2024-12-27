#lang sicp

(define (bubble-sort! vec)
  (define (swap! n vec)
    (cond ((< (vector-length vec) 2) vec)
            ((= (vector-length vec) (+ n 1)) vec)
            (else
             (let ((vec1 (vector-ref vec n))
                   (vec2 (vector-ref vec (+ n 1))))
               (if (> vec1 vec2)
                      (begin (vector-set! vec n vec2)
                             (vector-set! vec (+ n 1) vec1)
                             (swap! (+ n 1) vec))
                      (swap! (+ n 1) vec))))))
  (define (sort times)
    (if (>= times (vector-length vec))
        vec
        (begin (swap! 0 vec)
               (sort (+ times 1)))))
  (sort 1))

(define (randomlist n maxnumber)
  (if (= n 1)
      (list (random n))
  (cons (random maxnumber)
        (randomlist (- n 1) maxnumber))))

(define x (list->vector (randomlist 10 100)))
x
  
 

(bubble-sort! x)