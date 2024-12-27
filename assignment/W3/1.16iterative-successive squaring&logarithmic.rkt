#lang simply-scheme

(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))


(define (expti b n product)
  (if (= n 0)
      product
      (expti b
             (- n 1)
             (* b product))))
          
(expti 2 2 1)
          

(define (fr n)
  (if (= n 1)
      1
      (* n (fr (- n 1)))))

  
(define (f product i n)
  (if (> i n)
      product
      (f (* product i)
         (+ i 1)
         n)))


(fr 6)
(f 1 1 6)


(define (square b) (* b b))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))


(define (expt-iter b n product)
  (cond ((= n 0) product)
        ((even? n)
         (expt-iter (square b)
                    (/ n 2)
                    product))
        (else (expt-iter b
                         (- n 1)
                         (* b product)))))


(trace fast-expt)

(trace expt-iter)

;(fast-expt 2 3)
(fast-expt 2 4)

;(expt-iter 2 3 1)
(expt-iter 2 4 1)
