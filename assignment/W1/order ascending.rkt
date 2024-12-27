#lang simply-scheme

(define (order x)
  (if (= (count x) 1)
      #t
      (and(< (first x) (first (bf x))) (order (bf x)))))

(order '(2 5 1 6 7 1))