#lang scheme



(define (nth n lst)
  (cond ((null? lst) '())
        ((= n 0) (car lst))
        (else (nth (- n 1) (cdr lst)))))




(define (remove x lst)
  (cond ((null? lst) '())
        ((equal? (car lst) x) (cdr lst))
        (else (cons (car lst) (remove x (cdr lst))))))

(define (shuffle deck)
  (if (null? deck)
      '()
      (let ((card (nth (random (length deck)) deck)))
        (cons card (shuffle (remove card deck))) )))

(define ordered-deck '(AH 2H 3H  QH KH AS 2S  QC KC))

(shuffle ordered-deck)

(define-class (deck deckobj)
  (instance-vars (cards (shuffle deckobj)))
  (method (deal)
          (if (null? cards)
               '()
               (let ((top-card (car cards)))
                 (set! cards (cdr cards))
                 top-card)))
  (method (empty?)
          (null? cards)))

;我用的 cond+display 的组合，因为涉及到同时计算多个 expression，以及刷新 cards 值后返回topcard（car cards）值不变的问题
;老师合因为判断条件少用if。
;同时用 let 存储topcard 值，避免刷新cards 的影响;另外也解决 if的arg 里只能放一个 expression 的问题。

              
(define deckobj (instantiate deck ordered-deck))