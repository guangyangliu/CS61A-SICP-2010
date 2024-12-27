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
  (define incorrecttimes 0)
  (define call-the-cops
    (lambda () (display "call 110")))
  (define (dispatch p m)
    (cond ((eq? p password)
           (set! incorrecttimes 0)
           (cond ((eq? m 'withdraw)
                  ;(set! incorrecttimes 0)原来我写在这，可以提前就省一行
                  withdraw)
                 ((eq? m 'deposit)
                  ;(set! incorrecttimes 0)
                   deposit)
                 (else (error "Unknown request -- MAKE-ACCOUNT"
                              m))))
          (else (set! incorrecttimes (+ incorrecttimes 1))
                (lambda (x)
                  (if (> incorrecttimes 7)
                      (call-the-cops)
                       "incorrect-passwords" )))
                 ))
  dispatch)

(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40)

