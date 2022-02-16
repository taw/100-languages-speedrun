#!/usr/bin/env newlisp

(define (fib n)
  (if (<= n 2)
    1
    (+ (fib (- n 1)) (fib (- n 2)))))

(for (i 1 30)
  (print "fib(" i ")=" (fib i) "\n"))
(exit)
