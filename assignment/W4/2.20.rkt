#lang simply-scheme

(define (same-parity x . y)
  (cond ((null? x) '())
        ((even? x) (cons x (evenlist y)))
        (else (cons x (oddlist y)))))

(define (evenlist y)
  (cond ((null? y) '())
        ((even? (car y)) (cons (car y) (evenlist (cdr y))))
        (else (evenlist (cdr y)))))

(define (oddlist y)
  (cond ((null? y) '())
        ((odd? (car y)) (cons (car y) (oddlist (cdr y))))
        (else (oddlist (cdr y)))))

;解题要点是知道把第一个数和剩下的数分开处理，需要辅助函数。
;虽然我知道这点，但两个辅助函数写的不够优雅，因为我不确信数除了偶数就是奇数。
;在作者的答案中，我模糊理解了filter函数的使用(filter predicate list)

;;作者答案
;Instead, the easiest thing to do is to define a helper procedure that
;*does* expect a list of numbers as its one argument.  An advantage is
;that we can then separate out the first number, which is always
;accepted, as a special case:
;
;(define (same-parity tester . others)
;  (define (helper numlist)
;    (cond ((null? numlist) nil)
;	  ((equal? (even? tester) (even? (car numlist)))
;	   (cons (car numlist) (helper (cdr numlist))))
;	  (else (helper (cdr numlist)))))
;  (cons tester (helper others)))
;
;Once we know about higher-order functions, there's an even easier
;solution:
;
;(define (same-parity tester . others)
;  (cons tester
;	(filter (lambda (num) (equal? (even? tester) (even? num)))
;		others)))



(oddlist '(1 2 3 4 5 6 7))
(evenlist '(1 2 3 4 5 6 7))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
(same-parity 1)
(same-parity '())