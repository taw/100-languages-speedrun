#!/usr/bin/env moon

import split from require "moonscript.util"

readlines = (path) ->
  file = io.open("wordle-answers-alphabetical.txt")
  text = file\read("*a")
  file\close!
  lines = split text, "\n"
  table.remove(lines) -- remove empty "" at the end
  lines

random_element = (array) ->
  array[math.random(#array)]

class Wordle
  new: =>
    @words = readlines("wordle-answers-alphabetical.txt")
  report: (word, guess) =>
    for i=1,5
      letter = guess\sub(i,i)
      if word\sub(i,i) == letter
        io.write "🟩"
      -- non-regexp string.contains?
      elseif word\find(letter, 1, true)
        io.write "🟨"
      else
        io.write "🟥"
    io.write "\n"
  __call: =>
    word = random_element(@words)
    guess = ""
    while guess != word
      io.write "Guess: "
      guess = io.read!
      if #guess == 5
        @report(word, guess)
      else
        print "Guess must be 5 letters long"

game = Wordle()
game()
