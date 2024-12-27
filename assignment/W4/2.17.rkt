#lang simply-scheme

(define (last-pair nonemptylist)
  (if
   (null? (cdr nonemptylist))
   nonemptylist
   (last-pair (cdr nonemptylist))))

(last-pair (list 23 72 149 34))