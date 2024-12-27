#lang simply-scheme

;Extend the calculator program from lecture to include words as data,
;providing the operations first, butfirst, last, butlast, and word.
;Unlike Scheme, your calculator should treat words as self-evaluating expressions
;except when seen as the operator of a compound expression.
;That is, it should work like these examples:
;calc: foo
;foo
;calc: (first foo)
;f
;calc: (first (butfirst hello))
;e

;; Scheme calculator -- evaluate simple expressions

; The read-eval-print loop:

(define (calc)
  (display "calc: ")
  (print (calc-eval (read)))
  (newline)
  (calc))

; Evaluate an expression:t

(define (calc-eval exp)
  (cond ((number? exp) exp)
        ((word? exp) exp)
	((list? exp) (calc-apply (car exp) (map calc-eval (cdr exp))))
	(else (error "Calc: bad expression:" exp))))

; Apply a function to arguments:

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (calc-apply fn args)
  (cond ((eq? fn '+) (accumulate + 0 args))
        ((eq? fn '-) (cond ((null? args) (error "Calc: no args to -"))
                           ((= (length args) 1) (- (car args)))
                           (else (- (car args) (accumulate + 0 (cdr args))))))
        ((eq? fn '*) (accumulate * 1 args))
        ((eq? fn '/) (cond ((null? args) (error "Calc: no args to /"))
                           ((= (length args) 1) (/ (car args)))
                           (else (/ (car args) (accumulate * 1 (cdr args))))))
        ((eq? fn 'first) (if (= (length args) 1)
                             (first (car args))
                             (error "Calc: need 1 arg")))
        ((eq? fn 'butfirst) (if (= (length args) 1)
                             (butfirst (car args))
                             (error "Calc: need 1 arg")))
        ((eq? fn 'last) (if (= (length args) 1)
                            (last (car args))
                            (error "Calc: need 1 arg")))
        ((eq? fn 'butlast) (if (= (length args) 1)
                               (butlast (car args))
                               (error "Calc: need 1 arg")))
        ((eq? fn 'word) (if (= (length args) 1)
                             (word (car args))
                             (error "Calc: need 1 arg")))
        (else (error "Calc: bad operator:" fn))))