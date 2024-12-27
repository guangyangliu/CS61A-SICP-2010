#lang simply-scheme

(define (=zero? arg)
  (apply-generic '=zero? arg))

;scheme-number

;(define (=zero? n)
;  (equ? n 0))

(put '=zero? '(scheme-number) =)
;如果是 scheme-number 就用primitive procedure

;rational
(define (=zero? n)
  (equ? (add-rat n n)
     (sub-rat n n)))

 (put '=zero? '(rational) zero?)


;complex
(define (=zero? n)
  (equ? (add-complex n n)
     (sub-complex n n)))

  (put '=zero? '(complex) zero?)

;老师的做法是，先给定不同数据类型中0 的表示方式，再判断其是否 equ？