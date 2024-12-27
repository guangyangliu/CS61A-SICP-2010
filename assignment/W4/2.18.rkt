#lang simply-scheme

(define (reverse alist)
  (if
   (null? (cdr alist))
   alist
   (append (reverse (cdr alist)) (list (car alist)))))

(reverse (list 1 4 9 16 25))
;(25 16 9 4 1)