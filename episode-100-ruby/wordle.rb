#!/usr/bin/env ruby

class Wordle
  def dictionary
    @dictionary ||= File.readlines("wordle-answers-alphabetical.txt").map(&:chomp)
  end

  def word
    @word ||= dictionary.sample
  end

  def report(guess)
    5.times.map{|i|
      if guess[i] == word[i]
        "🟩"
      elsif word.include?(guess[i])
        "🟨"
      else
        "🟥"
      end
    }.join
  end

  def play
    loop do
      print "Guess: " # Do I want this?
      guess = gets.chomp
      puts report(guess)
      break if guess == word
    end
  end
end

Wordle.new.play
