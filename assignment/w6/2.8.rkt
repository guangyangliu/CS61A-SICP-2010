#lang simply-scheme


;number
(define (=zero? arg)
  (= arg 0))

(put '=zero? '(scheme-number scheme-number) (lambda (arg) (= arg 0)))

;rational
(define (=zero? arg)
  (= (add arg arg) (sub arg arg)))

(put '=zero? '(rational rational)
     (lambda (arg) (= (add arg arg) (sub arg arg))))

;complex
(define (=zero? arg)
  (= (add arg arg) (sub arg arg)))

(put '=zero? '(complex complex)
     (lambda (arg) (= (add arg arg) (sub arg arg))))

;generic
(define (=zero? arg) (apply-generic '=zero? arg))
