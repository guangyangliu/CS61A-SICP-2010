#lang sicp

(define (vector-filter pred vec)
  (define (counter n count);input n (length of vec) and count the pred times,which could be use to make a new vector.
      (cond ((= n (vector-length vec)) count)
             ((pred (vector-ref vec n)) (begin (set! count (+ count 1))
                                                  (counter (+ n 1) count)))
             (else (counter (+ n 1) count))))
  (define (fill n count newvec);fill the new vector with the filtered values.
    (cond ((= n (vector-length vec)) newvec)
             ((pred (vector-ref vec n)) (begin (vector-set! newvec count (vector-ref vec n))
                                               (set! count (+ count 1))
                                               (fill (+ n 1) count newvec)))
             (else (fill (+ n 1) count newvec))))
  (fill 0 0 (make-vector (counter 0 0))))


             
    
(vector-filter (lambda (x) (equal? x 1)) '#(1 1 5 5 5 1 1))

      