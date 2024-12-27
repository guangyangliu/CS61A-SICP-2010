#lang simply-scheme

(define (square x) (* x x))


(define (square-list items)
  (if (null? items)
      null
      (cons (square (car items)) (square-list (cdr items)))))

(trace square-list)

(square-list '(1 2 3 4))

(define (square-lists items answer)
  (if
   (null? items)
   answer
   (square-lists
    (cdr items)
    (append answer (list (square (car items)))))))

(trace square-lists)
(square-lists '(1 2 3 4) null)

;老师在第一个函数中加了个reverse函数，把结果反转
;但我能想到一个和老师不一样的而且不偷懒的解决方案也很不错呀。