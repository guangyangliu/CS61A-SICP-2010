#lang simply-scheme

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

;for make a mobile and test
(define (weight number) number) 

(define a
  (make-mobile
   (make-branch 1 (weight 2))
   (make-branch 3 (make-mobile
                   (make-branch 4 (weight 5))
                   (make-branch 6 (weight 7))))))

a

;b
(define (total-weight mobile)
  (if (pair? mobile)
      (+ (total-weight (branch-structure (left-branch mobile)))
         (total-weight (branch-structure (right-branch mobile))))
      mobile))
  

;先前用number?判断 mobile很奇怪
;如果mobile是pair 那就一直递归计算，直到mobile不是pair，也就是basecase
;此时mobile其实就触底到叶节点了，返回叶节点本身的值
;最后一行代码也把mobile为null的情况考虑进去了，如果为null那就返回null,其实按照mobile的定义不可能为空


;(trace total-weight)
(total-weight a)


;balanced
;mobile balanced: (= (* topleft-lenth weight) (* topright-lenth weight))
;map submobile

;(define (topbalance mobile)
;  (equal? (* (branch-length (left-branch mobile))
;             (total-weight (branch-structure (left-branch mobile))))
;          (* (branch-length (right-branch mobile))
;             (total-weight (branch-structure (right-branch mobile))))))
;
;(define (mobalance mobile)
;  (cond ((null? mobile) '())
;        ((pair? mobile)
;         (and (topbalance mobile)
;              (mobalance (branch-structure (left-branch mobile)))
;              (mobalance (branch-structure (right-branch mobile)))))
;        (else #t)))
;这两个函数的代码虽然能算出结果，但是不好理解

(define (balanced? mobile)
  (if (pair? mobile)
      (and (equal? (torque (left-branch mobile))
                   (torque (right-branch mobile)))
           (balanced? (branch-structure (left-branch mobile)))
           (balanced? (branch-structure (right-branch mobile))))
      #t))
;当参数命名指示参数输入类型时，我总感觉函数必须输入这类参数才行，不然就无法计算
;但有时候，函数的条件语句里考虑到不是该数据类型时的计算方式时，那就不用再担心了
;比如像balanced函数是对mobile做判断，但我担心(branch-structure (left-branch mobile))不是mobile数据类型，运算会报错
;但其实最后一句写了，当它不是mobile数据类型时，它会返回一个值，这里是#t，意即mobile is balance.


(define (torque branch)
  (* (branch-length branch)
     (total-weight (branch-structure branch))))
         

;test balanced?
(define b
  (make-mobile
   (make-branch 6 (weight 3))
   (make-branch 3 (make-mobile
                   (make-branch 3 (weight 3))
                   (make-branch 3 (weight 3))))))

(balanced? a)
(balanced? b)

