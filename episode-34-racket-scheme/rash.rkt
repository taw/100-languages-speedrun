#!/usr/bin/env racket
#lang rash

(define (print-upcase s)
  (display (string-upcase s)))

ls
ls *.rkt | wc -l
ls *.rkt |>> print-upcase
