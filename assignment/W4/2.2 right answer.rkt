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
