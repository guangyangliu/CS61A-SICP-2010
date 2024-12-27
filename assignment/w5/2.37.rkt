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

(define (dot-product v w)
  (accumulate + 0 (map * v w)))
;点积：两个向量点对点乘完后的积
;map新domain用法：1个需要n个参数的函数 和 n个list



(define (matrix-*-vector m v)
  (map (lambda (w) (dot-product v w)) m))
;矩阵*向量=矩阵每行和向量的点积 最终返回一列向量

(define m '((1 2 3) (4 5 6) (7 8 9)))
(define v '(1 2 3))
(define n '((1 2 3) (4 5 6) (7 8 9)))

(dot-product v v)

(matrix-*-vector m v)

(define (transpose mat)
  (accumulate-n cons null mat))
;矩阵转换就是行列转换

(transpose m)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (v) (matrix-*-vector cols v)) m)))
;矩阵相乘=m矩阵的行*n矩阵的列，每一次行列相乘都是新矩阵的一个数
;习题在这把矩阵n转置col，结果变为m每行和col所有行的运算;
;其实就是矩阵col和m里每行的矩阵向量运算

(matrix-*-matrix m n)