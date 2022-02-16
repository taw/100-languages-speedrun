#!/usr/bin/env newlisp

(for (i 1 100)
  (print
    (cond
      ((= 0 (% i 15)) "FizzBuzz")
      ((= 0 (% i 5)) "Buzz")
      ((= 0 (% i 3)) "Fizz")
      (true i))
    "\n"))
(exit)
