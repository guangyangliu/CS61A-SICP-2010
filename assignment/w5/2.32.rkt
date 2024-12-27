#lang simply-scheme

(define s (list 1 2 3))

(define (subsets s)
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
        (append rest (map
                      (lambda (lst) (cons (car s) lst))
                      rest)))))

;答案我是根据已有公式手算的结果，发现剩余的集合——并找出其计算方式
;解释我没想出来，可能涉及到集合预算
;即集合（元素为n）的子集数量=集合（元素为n-1）的子集数量+（集合（元素为1）和前子集的组合数量）

(subsets s)