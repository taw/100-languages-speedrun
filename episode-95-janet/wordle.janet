#!/usr/bin/env janet

(math/seedrandom (os/cryptorand 16))

(defn file/readlines [path]
  (string/split "\n" (string/trim (slurp path))))

(defn math/randint [min max]
  (+ min (math/floor (* (math/random) (+ 1 (- max min))))))

(defn array/random [array]
  (get array (math/randint 0 (- (length array) 1))))

(defn readline []
  (string/trimr (file/read stdin :line) "\n"))

(defn string/contains [str c]
  (not (nil? (string/find c str))))

(defn string/char-at [str n]
  (string/slice str n (+ n 1)))

(def words (file/readlines "wordle-answers-alphabetical.txt"))
(def word (array/random words))

(defn report-wordle [guess word]
  (loop [i :range [0 5]]
    (prin (cond
      (= (get word i) (get guess i)) "🟩"
      (string/contains word (string/char-at guess i)) "🟨"
      "🟥")))
  (print))

(while true
  (prin "Guess: ")
  (def guess (readline))
  (if (= 5 (length guess))
    (report-wordle guess word)
    (print "Guess must be 5 letters long"))
  (if (= guess word) (break)))
