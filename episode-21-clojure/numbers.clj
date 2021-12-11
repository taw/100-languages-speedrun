#!/usr/bin/env clojure -M

(println (+ 10 20))
(println (* 1000.0 2000))

; integer overflow
; (print (* 1000000 1000000 1000000 1000000))
(print (* 1000000N 1000000N 1000000N 1000000N))

; Invalid number: 1_000_000_000_000N
; (print (* 1_000_000_000_000N 1_000_000_000_000N))

(println (Math/abs -42))
(println (Math/abs -42.5))

;Syntax error (IllegalArgumentException) compiling at (./numbers.clj:15:1).
;(println (Math/abs -42N))

;class java.lang.String cannot be cast to class java.lang.Number
;(println (+ "Hello, " "World!"))
(println (str "Hello, " "World!"))
