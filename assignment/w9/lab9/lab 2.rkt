#lang sicp


(define x (cons 1 3))
(define y 2)

(set-cdr! x y)


;(set! (cdr x) y)
;(set! <variable> <new value>)
;(cdr x) is not a binding variable.