#lang simply-scheme

(define (every f sen)
  (if (empty? sen)
      '()
      (se (f (first sen)) (every f (bf sen)))))


(define (square x)
  (* x x))

(every first '(nowhere man))

(every square '(1 2 3 4))

(define (evens nums)
  (cond ((empty? nums) '())
        ((= (remainder (first nums) 2) 0)
         (se (first nums) (evens (bf nums))) )
        (else (evens (bf nums))) ))

(define (ewords sent)
  (cond ((empty? sent) '())
        ((member? 'e (first sent))
         (se (first sent) (ewords (bf sent))) )
        (else (ewords (bf sent))) ))

(define (pronouns sent)
  (cond ((empty? sent) '())
        ((member? (first sent) '(I me you he she it him her we us they them))
         (se (first sent) (pronouns (bf sent))) )
        (else (pronouns (bf sent))) ))

(define (keep pred sent)
  (cond((empty? sent) '())
       ((pred (first sent))(se (first sent)(keep pred (bf sent))))
       (else (keep pred (bf sent)))))

(every (lambda (letter) (word letter letter)) 'purple)

(every (lambda (number) (if (even? number) (word number number) number))
'(781 5 76 909 24))

(keep even? '(781 5 76 909 24))

(keep (lambda (letter) (member? letter 'aeiou)) 'bookkeeper)

(keep (lambda (letter) (member? letter 'aeiou)) 'syzygy)

;(keep (lambda (letter) (member? letter 'aeiou)) '(purple syzygy))

(keep (lambda (wd) (member? 'e wd)) '(purple syzygy))