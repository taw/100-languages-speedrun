#!/usr/bin/env clojure -M

(println "What's your name?")
(def x (read-line))
(println (format "Hello, %s!" x))
