#lang simply-scheme

;用老师的思路重做确实太舒适了
;我原来做题过程：不喜欢用辅助函数，只想用一个函数算出结果
;这导致代码长，难写难看，更致命的是混淆思路

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;a
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))


(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

;b
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (branch-weight branch)
  (if (number? (branch-structure branch))
      (branch-structure branch)
      (total-weight (branch-structure branch))))

;c
(define (balanced? mobile)
  (and (equal? (torque (left-branch mobile))
               (torque (right-branch mobile)))
       (branch-balanced? (left-branch mobile))
       (branch-balanced? (right-branch mobile))))
       

(define (branch-balanced? branch)
  (if (number? (branch-structure branch))
      #t
      (balanced? (branch-structure branch))))

(define (torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

;d
;if constructors change to cons
;my program only need replace cadr of selectors by cdr.

;for test
(define (weight number) number)

(define a
  (make-mobile
   (make-branch 1 (weight 2))
   (make-branch 3 (make-mobile
                   (make-branch 4 (weight 5))
                   (make-branch 6 (weight 7))))))
a

(total-weight a)
(balanced? a)