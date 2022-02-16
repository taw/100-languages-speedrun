#!/usr/bin/env newlisp

(define (random-element lst) (nth (rand (length lst)) lst))

(define (report-wordle guess word)
  (dotimes (i 5)
    (print
      (cond
        ((= (nth i guess) (nth i word)) "🟩")
        ((= (member (nth i guess) word) "🟨"))
        (true "🟥"))))
  (print "\n"))

; we need to seed random generator, or it will always return same number
(seed (time-of-day))

(define words (parse (read-file "wordle-answers-alphabetical.txt")))
(define word (random-element words))

(set 'guess "")
(while (!= guess word)
  (print "Guess: ")
  (set 'guess (read-line))
  (if (= 5 (length guess))
    (report-wordle guess word)
    (print "Guess must be 5 characters\n")))
(exit)
