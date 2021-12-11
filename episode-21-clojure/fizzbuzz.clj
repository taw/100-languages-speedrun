#!/usr/bin/env clojure -M

(defn fizzbuzz [n]
  (if (= (mod n 15) 0)
    "FizzBuzz"
    (if (= (mod n 3) 0)
      "Fizz"
      (if (= (mod n 5) 0)
        "Buzz"
        n))))

(doseq [i (range 1 101)]
  (println (fizzbuzz i)))
