#lang sicp

;3a
(define list1 (list (list 'a) 'b))

(define list2 (list (list 'x) 'y))

(set-cdr! (car list2) (cdr list1))
(set-cdr! (car list1) (car list2))

list1
list2

;> list1
;((a x b) b)
;> list2
;((x b) y)

;3b
(set-car! (cdr list1) (cadr list2))
list1
list2