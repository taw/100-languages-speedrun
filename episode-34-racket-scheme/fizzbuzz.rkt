#!/usr/bin/env racket
#lang racket

; FizzBuzz
(define (fizzbuzz n)
  (cond ((zero? (remainder n 15)) "FizzBuzz")
        ((zero? (remainder n 5)) "Buzz")
        ((zero? (remainder n 3)) "Fizz")
        (else n)))

(define (fizzbuzz-loop start end)
  (for ([n (range start (+ 1 end))])
    (display (fizzbuzz n))
    (newline)))

(fizzbuzz-loop 1 30)
