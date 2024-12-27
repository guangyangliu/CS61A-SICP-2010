#lang simply-scheme

(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (trace iter)
  (iter items null))


(square-list '(1 2 3 4))

;because list is constructed by (cons new-member rest-of-list)