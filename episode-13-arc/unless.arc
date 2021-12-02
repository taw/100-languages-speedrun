(mac oddeven (v ifeven ifodd)
  `(if (even ,v) ,ifeven ,ifodd))

(prn "Choose a number?")
(let number (int (readline))
  (oddeven number
    (prn number " is even")
    (prn number " is odd"))
)
