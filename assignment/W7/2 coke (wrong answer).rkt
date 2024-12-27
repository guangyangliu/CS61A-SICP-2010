(define-class (coke-machine coke-number price)   ;审题错误，把容量当可填装的数量
  (instance-vars (machine-deposit 0)
   (user-deposit 0)
   (cokes coke-number))
  (method (deposit number)
          (set! machine-deposit (+ machine-deposit number))
          (set! user-deposit (+ user-deposit number)))
  (method (coke)
          (if (> user-deposit price)
              (if (> cokes 0)
                  (ask self 'update)
                  '(machine empty))
              '(not enough money)))
  (method (update)
          (display (- user-deposit price))
          (newline)
          (set! machine-deposit (- machine-deposit (- user-deposit price)))
          (set! cokes (- cokes 1))
          (set! user-deposit 0))
  ;因为增加了存款用来统计赚的钱，且要更新的状态较多，所以写了个 update method
  ;在用户取走一罐可乐后，在找零和刷新投币金额上，老师用 let 处理的更好
  (method (fill number)
          (set! cokes (+ cokes number))))

(define my-machine (instantiate coke-machine 80 70))
(ask my-machine 'price)
(ask my-machine 'cokes)
(ask my-machine 'deposit 25)
(ask my-machine 'coke)
(ask my-machine 'machine-deposit)
(ask my-machine 'user-deposit)

              
          