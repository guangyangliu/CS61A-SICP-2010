#lang simply-scheme

;
;(+ (- 4.7 (* 0.05 4.7)) (- 6.8 (* 0.1 6.8)))
;(+ (+ 4.7 (* 0.05 4.7)) (+ 6.8 (* 0.1 6.8)))
;
;(/ 1 (+ (/ 1 (- 4.7 (* 0.05 4.7))) (/ 1 (- 6.8 (* 0.1 6.8)))))
;
;(/ 1 (+ (/ 1 (+ 4.7 (* 0.05 4.7))) (/ 1(+ 6.8 (* 0.1 6.8)))))


(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

;(define (div-interval x y)
;  (if (member? 0 y) 'error
;      (mul-interval x
;                    (make-interval (/ 1.0 (upper-bound y))
;                                   (/ 1.0 (lower-bound y))))))
;我把span zero理解为分母是0，而不是区间跨越0

;; An interval spans zero if its lower bound is negative (or zero) and
;; its upper bound is positive (or zero).
;; It's only the divisor that we have to worry about.

(define (div-interval x y)
  (if (and (<= (lower-bound y) 0)
	   (>= (upper-bound y) 0))
      (error "Can't divide by an interval that spans zero.")
      (mul-interval x
		    (make-interval (/ 1 (upper-bound y))
				   (/ 1 (lower-bound y))))))





(define (make-interval a b) (cons a b))

;(define (upper-bound x)
;  (last x))
;
;(define (lower-bound x)
;  (first x))
;答案用的car和cdr，我做题前没考虑domain

(define (upper-bound x)
  (cdr x))

(define (lower-bound x)
  (car x))

;(define (sub-interval x y)
;  (make-interval (- (lower-bound x) (lower-bound y))
;                 (- (upper-bound x) (upper-bound y))))
;理解区间相减时的极值出错，新区间的最小值是原区间的最小减最大，最大值是最大减最小。

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))


