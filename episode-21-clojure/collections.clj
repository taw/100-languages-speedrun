#!/usr/bin/env clojure -M

(def a-set #{2 -2 7})
(def a-vec [20 22 -30])
(def a-list '(10 20 -30 40))
(def a-map {:name "Bob" :surname "Smith" :age 30})

; Printing works
(println a-set)
(println a-vec)
(println a-list)
(println a-map)

(println (map inc a-list))

; Unable to find static field: abs in class java.lang.Math
; (println (map Math/abs a-list))
(println (map (fn [x] (Math/abs x)) a-list))

; returns a list not a set or a vector
(println (map (fn [x] (Math/abs x)) a-set))
(println (map (fn [x] (Math/abs x)) a-vec))
