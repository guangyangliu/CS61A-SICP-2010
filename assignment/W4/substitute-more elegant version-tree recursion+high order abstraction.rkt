#lang simply-scheme

(define (substitute alist old new)
  (cond ((null? alist) '())
        ((equal? alist old) new)
        ((pair? alist)
         (cons (substitute (car alist) old new)
               (substitute (cdr alist) old new)))
        (else alist)))
;递归函数给我的感觉：两句代码把递归的开端和剩余部分写完，剩下的全写basecase判断就好
;如果一段代码用了递归还很复杂，那说明想复杂了，一定有更优雅的方式

(substitute '((lead guitar) (bass guitar) (rhythm guitar) drums) 'guitar 'axe)

(define (substitute2 alist olist nlist)
  (if (null? olist)
      alist
      (substitute2
       (substitute alist (car olist) (car nlist))
       (cdr olist)
       (cdr nlist))))


(substitute2 '((4 calling birds) (3 french hens) (2 turtle doves)) '(1 2 3 4) '(one two three four))