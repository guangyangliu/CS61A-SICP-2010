(define-class (random-generator maxnumber)
  (instance-vars (count 0))
  (method (number)
          (set! count (+ count 1))
          (random maxnumber))
  (method (count)
          count))

(define r30 (instantiate random-generator 30))