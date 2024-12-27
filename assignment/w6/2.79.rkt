#lang simply-scheme


;number
(define (equ? x y)
  (= x y))

(put 'equ? '(scheme-number scheme-number) equ?)

;rational
(define (equ? x y)
  (and
   (= (number x) (number y))
   (= (denom x) (denom y))))

(put 'equ? '(rational rational) equ?)

;complex
;(define (equ? z1 z2)
;  (= (sub-complex z1 z2) 0))
;wrong version

(define (equ? x y)
  (and (= (real-part x) (real-part y))
       (= (imag-part x) (imag-part y))))

(put 'equ? '(complex complex) equ?)


(define (equ? x y) (apply-generic 'equ? x y))
