#lang simply-scheme
(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch p m)
    (cond ((eq? p password)
           (cond ((eq? m 'withdraw) withdraw)
                 ((eq? m 'deposit) deposit)
                 ((eq? m 'verify));在创造联合账号时验证原账号密码用
                 (else (error "Unknown request -- MAKE-ACCOUNT"
                              m))))
          (else (error "incorrect password"
                       p))))
  dispatch)




(define (make-joint protect-account protect-password new-password)
  (define (dispatch np m)
    (if (eq? np new-password)
        (protect-account protect-password m)
        (error "incorrect password" new-password)))
  (if (protect-account protect-password 'verify);用于在创建联合账户时用
      dispatch
      (display "incorrect old-password")))
;我的代码命名都太长了

(define peter-acc (make-account 100 'open-sesame))


(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))
;如果创建账户时不验证，用户会以为创建成功了
;老师还有个更聪明的方式时：创建账户时做一次金额为 0 的操作，判断返回值是否为数字，来判断密码是否正确


((paul-acc 'rosebud 'withdraw) 50)
((paul-acc 'rosebud 'deposit) 50)

((peter-acc 'open-sesame 'withdraw) 50)
((peter-acc 'open-sesame 'deposit) 50)