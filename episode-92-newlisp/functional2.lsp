#!/usr/bin/env newlisp

(define (adder n) (lambda (x) (+ x n)))

(set 'a (list 1 2 3 4 5))
(set 'add10 (adder 10))

(print a "\n")
(print (map (lambda (x) (+ x 10)) a) "\n")
(print (map add10 a) "\n")

(exit)
