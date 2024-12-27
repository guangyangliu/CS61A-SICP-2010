#lang simply-scheme
(define (substitute lists oldword newword)
  (define (subword alist)
    (cond ((null? alist) '())
          ((list? alist)
           (cond
             ((equal? (first alist) oldword) (se newword (subword (bf alist))))
             (else (cons (first alist) (subword (bf alist))))))
          ((word? alist)
           (cond
             ((equal? alist oldword) (word newword))
             (else (word alist))))))
  (map subword lists))

;我的答案如果输入列表里的元素是list和word还好，但如果是两者外的pair就有问题
;用pair比用list更保险
;我的代码太复杂，不够优雅
;因为我是为匹配正确结果而写出来的，虽然结果对上了，但还是会出现遗漏，比如pair和list的细微差异
;我对递归的理解还不够深入和抽象，我能想下理解一两层递归，但老师能直接理解到最深一层递归，也就是basecase那层
;tree recursion的思想我要好好看看
;我对domain是list、sentence、word不确定，居然用word和sentence的函数来处理list，本质考察的是list、cons、car和cdr的运算。


(substitute '((lead guitar) (bass guitar) (rhythm guitar) drums) 'guitar 'axe)
;((lead axe) (bass axe) (rhythm axe) drums)


(define (substitute2 alist listoldwords listnewwords)
  (if
   (or (null? listoldwords) (null? listnewwords))
   alist
   (substitute2
    (substitute alist (car listoldwords) (car listnewwords))
    (cdr listoldwords)
    (cdr listnewwords))))
;该题第二部分我的思路感觉比老师更elegent，在第一部分的代码上抽象。
  

;(trace substitute2)
(substitute2 '((4 calling birds) (3 french hens) (2 turtle doves)) '(1 2 3 4) '(one two three four))
;((four calling birds) (three french hens) (two turtle doves))

