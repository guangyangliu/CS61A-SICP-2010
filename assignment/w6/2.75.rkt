#lang simply-scheme


;(define (mmake-from-mag-ang x y)
;  (define (dispatch op)
;    (cond ((eq? op 'real-part)
;           (* (magnitude z) (cos (angle z))))
;          ((eq? op 'imag-part)
;           (* (magnitude z) (sin (angle z))))
;          ((eq? op 'magnitude) x)
;          ((eq? op 'angle) y)
;          (else
;           (error "Unknown op -- MAKE-FROM-MAG-ANG" op))))
;  dispatch)

(define (mmake-from-mag-ang r a)
  (define (dispatch op)
    (cond ((eq? op 'real-part)
           (* r (cos a)))
          ((eq? op 'imag-part)
           (* r (sin a)))
          ((eq? op 'magnitude) r)
          ((eq? op 'angle) a)
          (else
           (error "Unknown op -- MAKE-FROM-MAG-ANG" op))))
  dispatch)