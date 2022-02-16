#!/usr/bin/env newlisp

(set 'a "Żółw")
(set 'b "💩")

(print (length a) "\n")
(print (length b) "\n")

(print (utf8len a) "\n")
(print (utf8len b) "\n")

(print (upper-case a) "\n")
(print (lower-case a) "\n")

(exit)
