#lang simply-scheme
(define (square x)(* x x))

(define (squares y)
  (if (empty? y)
      '()
      (se (square (first y)) (squares (bf y)))))

 (squares '(2 3 4 5))