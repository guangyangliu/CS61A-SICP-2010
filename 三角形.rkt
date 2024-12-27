#lang scheme



(define (t row)
  (define (dis row)
    (if (= row 1)
        (begin (display "*")
               (newline))
        (begin
          (display "*")
          (dis (- row 1)))))
  (if (= row 1)
        (dis 1)
      (begin (t (- row 1))
             (dis row))))

(t 5)
  