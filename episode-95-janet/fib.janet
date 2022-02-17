#!/usr/bin/env janet

(defn fib [n]
  (if (<= n 2)
    1
    (+ (fib (- n 1)) (fib (- n 2)))))

(loop [n :range [1 31]]
  (print "fib(" n ")=" (fib n)))
