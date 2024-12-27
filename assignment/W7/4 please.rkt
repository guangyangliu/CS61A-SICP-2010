


(define-class (original name)
  (method (go direction)
          (se name '(moved to) direction)))

(define lgy (instantiate original 'ygl))

(define-class (miss-manners name)
  (method (please go direction)
          (ask name go direction)))

(define fussy-lgy (instantiate miss-manners lgy))

;当把另一个对象作参数时，ask 该对象做事不用使用parent，能直接ask 其本身的 method
;self 是指对象，一个待输入信息的函数，不要把对象当成字符运算
;当arg 是对象时，不用给对象加‘，加了就变成字符了，失去对象的属性


;老师的答案，用词更标准的符合题意（我的贴合测试例子）
;(define-class (miss-manners object)
;  (method (please message arg)
;          (ask obj message arg)))
;
;多个 arg 时
;(define-class (miss-manners obj)
;  (method (please message . arg)
;          (apply ask obj message arg)))
