#lang simply-scheme

;我做错的题
;(for-each (lambda (x) (display (negative? x)) (newline) )
;          (list 57 321 88))
;会错题了，我以为是试试执行for-each输出结果为true的值
;其实是告诉我返回任意值比如true，真实计算返回的值不用也不显示
;知道implementation的意思了，是说明程序执行的代码是什么，而不是让我去执行

;老师答案
;(define (for-each proc lst)
;  (if (null? lst)
;      #t
;      (let ((ignored-result (proc (car lst))))
;	(for-each proc (cdr lst)))))
;
;(define (for-each proc lst)
;  (if (null? lst)
;      #t
;      (begin (proc (car lst))
;	     (for-each proc (cdr lst)))))
;
;(define (for-each proc lst)
;  (cond ((null? lst) #t)
;	(else (proc (car lst))
;	      (for-each proc (cdr lst)))))

;又用到let，我得好好掌握let了。let解决了赋值不用的问题；还解决了计算两行表达式的问题
;cond也解决了在一个条件下计算两个表达式的问题，这个我之前还真没留意。
