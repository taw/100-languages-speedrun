#!/usr/bin/env clojure -M

(defmacro unless [cond & body]
  `(if (not ~cond)
    ~@body))

(println "Give me a number?")
(def n (Integer/parseInt (read-line)))

(if (even? n)
  (println (format "%d is even" n)))
(unless (even? n)
  (println (format "%d is odd" n)))
