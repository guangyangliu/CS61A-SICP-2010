#lang simply-scheme

;因为输入的 z是'(complex rectangular 3 . 4);
;manitude 只能对 type 是 rectangular 和 polar 的复数计算
;所以需要重新上传一个能对 cpmplex 函数计算的manitude。
;为什么不用重新定义
;当调用（magnitude z） 时
;apply-genric 'magnitude (complex rectangular 3 . 4)
;return (get 'magnitude '(complex))
;((get 'magnitude '(complex) (rectangular 3 . 4)) ;from complex package


;(magnitude (rectangular 3 . 4))
;apply-genric 'magnitude (rectangular 3 . 4) 
;((get 'manitude 'rectangular) (3 . 4) ;from rectangular package
;(magnitude (3 . 4))