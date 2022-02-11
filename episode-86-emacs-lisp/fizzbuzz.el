#!/usr/bin/env emacs -Q --script

; FizzBuzz in Emacs Lisp

(defun divisible (n m)
  (= 0 (% n m)))

(defun fizzbuzz (n)
  (cond
    ((divisible n 15) "FizzBuzz")
    ((divisible n 5) "Buzz")
    ((divisible n 3) "Fizz")
    (t (number-to-string n))))

(dotimes (i 100)
  (princ (fizzbuzz (+ i 1)))
  (princ "\n"))
