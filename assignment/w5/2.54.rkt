#lang simply-scheme

(define (newequal? a b)
  (cond ((null? a) (if (null? b) #t #f))
        ((pair? a)
         (and (newequal? (car a) (car b))
              (newequal? (cdr a) (cdr b))))
        (else (eq? a b))))

;我不确定我的答案是否对，因为偷懒了没考虑其他数据类型情况，比如布尔值，全让eq自己处理了
;(define (equal? a b)
;  (cond ((and (symbol? a) (symbol? b)) (eq? a b))
;	((or (symbol? a) (symbol? b)) #f)
;	((and (number? a) (number? b)) (= a b))       ;; not required but
;	((or (number? a) (number? b)) #f)             ;; suggested in footnote
;	((and (null? a) (null? b)) #t)
;	((or (null? a) (null? b)) #f)
;	((equal? (car a) (car b)) (equal? (cdr a) (cdr b)))
;	(else #f)))
;老师的答案可以写的更简单，但可能会难懂，他认为不值得
;他认为这是最干净和易懂的写法，还是那句话，程序首先是让人懂，顺便让程序执行。

        
(newequal? '(this is a list) '(this is a list))
(newequal? '(this is a list) '(this (is a) list))

(newequal? '() '())

(newequal? #t #f)

(define a (list 1 2 3))
(define b (list 1 2 3))
(newequal? a b)

(trace newequal?)
(newequal? a b)
(eq? a b)


(define (equal? a b)
  (cond ((and (symbol? a) (symbol? b)) (eq? a b))
	((or (symbol? a) (symbol? b)) #f)
	((and (number? a) (number? b)) (= a b))       ;; not required but
	((or (number? a) (number? b)) #f)             ;; suggested in footnote
	((and (null? a) (null? b)) #t)
	((or (null? a) (null? b)) #f)
	((equal? (car a) (car b)) (equal? (cdr a) (cdr b)))
	(else #f)))
