#lang simply-scheme

(define (sumfactor n i)
  (cond ((= i n) 0)
        ((integer? (/ n i)) (+ i (sumfactor n (+ i 1))))
        (else  (sumfactor n (+ i 1)))))

(define (isperf? n)
  (if (= (sumfactor n 1) n)
      #T
      #F))

(define (next-perf n)
  (if (isperf? n)
      n
      (next-perf (+ n 1))))

(sumfactor 28 1)
(isperf? 6)
(isperf? 28)

(trace next-perf)
(next-perf 1)
(next-perf 6)
(next-perf 7)
(next-perf 28)
(next-perf 29)
(next-perf 496)
(next-perf 497)
(next-perf 8128)
;(next-perf 8129) ;计算一晚上到40万没结果，短时间内计算不完。