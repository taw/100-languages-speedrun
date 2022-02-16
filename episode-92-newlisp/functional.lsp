#!/usr/bin/env newlisp

(set 'a (list 1 2 3 4 5))
(set 'add10 (lambda (x) (+ x 10)))

(print a "\n")
(print (map (lambda (x) (+ x 10)) a) "\n")
(print (map add10 a) "\n")

(exit)
