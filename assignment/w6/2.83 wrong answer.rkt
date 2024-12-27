#lang simply-scheme

(define (install-raise-package)
  (define (integer->rational number)
    (make-rat n 1))
  (define (rational->real number)
    (/ (car number) (cdr number)))
  (define (real->complex number)
    (make-from-real-imag number 0))
;  (define (raise number)
;    (let ((type-tag (type-tag number)))
;      (cond ((equal? type-tag 'complex) number)
;            ((equal? type-tag 'real) (real->complex number))
;            ((equal? type-tag 'rational) (rational->real number))
;            ((equal? type-tag 'integer) (integer->rational number))
;            (else (error "no method for the type" number)))))
  (put 'raise 'integer integer->rational)
  (put 'raise 'rational rational->real)
  (put 'raise 'real real->complex))

(define (raise arg)
  (let ((proc (get 'raise (type-tag arg))))
    (if proc
        (proc (contents arg))
        (error
         "No method for this type"
         ))))
  

