#lang simply-scheme


(define (switch x)
  (se (switch_first (first x)) (switch_rest (bf x))))

(define (switch_first wd)
      (cond ((equal? wd 'you) 'I)
            ((equal? wd 'I) 'you)
            ((equal? wd 'me) 'you)
            (else wd)))

(define (switch_rest sen)
  (if (empty? sen)
      '()
      (se (zh(first sen))
          (switch (bf sen)))))

(define (zh wd)
      (cond ((equal? wd 'you) 'me)
            ((equal? wd 'I) 'you)
            ((equal? wd 'me) 'you)
            (else wd)))

(switch '(you told me that I should wake you up))