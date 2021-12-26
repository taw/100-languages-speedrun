#!/usr/bin/env racket
#lang racket

(define (fizzbuzz n)
  (cond ((zero? (remainder n 15)) "FizzBuzz")
        ((zero? (remainder n 5)) "Buzz")
        ((zero? (remainder n 3)) "Fizz")
        (else n)))

(define-syntax-rule (do-range var start end . body)
  (let ([r (range start (+ 1 end))])
    (for ([var r]) . body)))

(do-range n 1 30
  (display (fizzbuzz n))
  (newline))
