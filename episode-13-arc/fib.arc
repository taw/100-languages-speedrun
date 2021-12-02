(def fib (n)
  (if (<= n 2)
      1
    (+ (fib (- n 1))
       (fib (- n 2)))))

(up n 1 30
  (prn (fib n)))
