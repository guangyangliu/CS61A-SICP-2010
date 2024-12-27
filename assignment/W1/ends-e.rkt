#lang simply-scheme
(define (ends-e x)
  (if (empty? x)
      '()
       (se (iflast_e (first x)) (ends-e (bf x)))))


;;(ends-e ’(please put the salami above the blue elephant))
;;(se 'please (ends-e ’(put the salami above the blue elephant)))
;;(se 'please (se the (ends-e ’(salami above the blue elephant))))
;;(se 'please (se the (se above (ends-e ’(salami above the blue elephant))))
;;(se (first x) (ends-e (bf x))

(define (iflast_e y)
  (if (equal? (last y) 'e)
      y
      '()))

(ends-e '(please put the salami above the blue elephant))
