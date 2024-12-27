#lang sicp

;(define (vector-append vec1 vec2)
;  (define (loop newvec newlength vec veclength)
;    (if (= veclength 0)
;        #t ;do nothing
;        (begin
;          (vector-set! newvec (- newlength 1) (vector-ref vec (- veclength 1)))
;          (loop newvec (- newlength 1) vec (- veclength 1)))))
;  (let ((vec1length (vector-length vec1))
;        (vec2length (vector-length vec2)))
;    (let ((newlength (+ vec1length vec2length))
;          (newvec (make-vector (+ vec1length vec2length))))
;    (begin (loop newvec newlength vec2 vec2length)
;           (loop newvec vec1length vec1 vec1length)
;           newvec))))

(define (vector-append vec1 vec2)
  (define (loop newvec oldvec n i)
    (if (>= n 0)
        (begin (vector-set! newvec i (vector-ref oldvec n))
               (loop newvec oldvec (- n 1) (- i 1)))))
  (let ((newvec (make-vector (+ (vector-length vec1) (vector-length vec2)))))
    (loop newvec vec1 (- (vector-length vec1) 1) (- (vector-length vec1) 1))
    (loop newvec vec2 (- (vector-length vec2) 1) (- (vector-length newvec) 1))
    newvec))




    



(define vec1 '#(1 2 3))
(define vec2 '#(4 5 6))
vec1
vec2    
(vector-append vec1 vec2)




    
      
