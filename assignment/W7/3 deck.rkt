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
          (cond ((null? cards) '())
                (else
                 (display (car cards))
                 (newline)
                 (set! cards (cdr cards)))))
  (method (empty?)
          (if (null? cards)
              #t
              #f)))
              
(define deckobj (instantiate deck ordered-deck))