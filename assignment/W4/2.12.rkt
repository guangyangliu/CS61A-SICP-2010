#lang simply-scheme

(define (make-interval a b) (cons a b))
(define (upper-bound x)
  (cdr x))
(define (lower-bound x)
  (car x))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

;错误：没有参考上题的函数，对(cons a b)和(cons a '(b))的理解不清晰。我把pair当成list在看了。

;(define (make-center-percent center percent)
;  (cons (- center (* center percent))(+ center (* center percent))))
;没理解percent的定义，percent虽然翻译为百分比，但说x percent的时候就是在说x个百分比，因此计算x时要*0.01

;(define (percent x)
;   (/ (- (center x) (car x)) (center x)))
;可惜没乘100，不然就对了
;我的写法更简洁：
;(* 100 (/ (- (center x) (car x)) (center x))))

(define (make-center-percent c p)
  (let ((w (* c p 0.01)))
    (make-interval (- c w) (+ c w))))
;需要熟悉let的使用，这块我了解的少

(define (percent i)
  (* 100 (/ (/ (- (upper-bound i) (lower-bound i)) 2)
	    (/ (+ (lower-bound i) (upper-bound i)) 2))))
(define (percent2 x)
  (* 100 (/ (- (center x) (lower-bound x)) (center x))))

(make-center-percent 10 10)

(percent '(9 . 11.0))
(percent2 '(9.0 . 11.0))
  

