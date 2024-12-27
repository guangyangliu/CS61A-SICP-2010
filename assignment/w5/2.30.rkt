#lang simply-scheme
(define (square x) (* x x))

;(define (square-list items)
;  (map square items))
;(square-list (list 1 2 3 4))

(define (square-tree tree)
  (cond ((null? tree) null)
        ((pair? tree)
         (cons (square-tree (car tree))
               (square-tree (cdr tree))))
        (else (square tree))))

(define (square-treemap tree)
  (if (pair? tree)
      (cons (square-treemap (car tree))
            (map square-treemap (cdr tree)))
      (square tree)))


;老师这个更优雅，我愣是把(map square-tree tree)拆成了
;(cons (square-treemap (car tree))(map square-treemap (cdr tree)))
;(define (square-tree tree)
;  (if (number? tree)
;      (* tree tree)
;      (map square-tree tree)))


(define tree  (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

tree
(square-tree tree)
(square-treemap tree)
;(trace square-treemap)

(define (tree-map fn tree)
  (if (pair? tree)
      (map (lambda (x) (tree-map fn x)) tree)
;      (cons (tree-map fn (car tree))
;            (map (lambda (x) (tree-map fn x))
;                 (cdr tree)))
      (fn tree)))

(define (square-tree-h tree) (tree-map square tree))

(square-tree-h tree)