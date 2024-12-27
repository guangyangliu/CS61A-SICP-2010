#lang simply-scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

;(define (accumulate-n op init seqs)
;  (if (pair? seqs)
;      (cons (accumulate op init (car seqs))
;            (accumulate-n op init (cdr seqs)))
;      seqs))
;审题错误：以为是对里边的list求和返回4个求和值，其实是依次对所有list的第一个数求和，然后是第二、再第三...


(define seqs '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))


(accumulate-n + 0 seqs)

;input:((1 2 3) (4 5 6) (7 8 9) (10 11 12))
;eval:sum elements of inner list, and return sum value of each list——审题错误，睁眼说瞎话
;output:(22 26 30)