#lang simply-scheme
;(magnitude (rectangular 3 4)，涉及到复数数据类型的selector，这些要加载到package里才能运用
;现在的复数数据结构运算包里只有+ - * / 没有selector
;需要用put函数把selectror和(complex)放进去

2 apply-generic

(magnitude (complex 4 4))
(apply-aeneric 'manitude (complex 4 4))

(get 'manitude '(complex) magnitude)

(apply-aeneric 'manitude (rectangular 4 4))
(get 'magnitude '(rectangular) 4 4)






