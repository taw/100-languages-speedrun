#!/usr/bin/env ruby

require "memoist"

class WordleBot
  extend Memoist

  memoize def dictionary
    @dictionary ||= File.readlines("wordle-answers-alphabetical.txt").map(&:chomp)
  end

  memoize def report(guess, word)
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

  # Try to pick a guess that minimizes worst case outcome
  def score(guess)
    @candidates.group_by{|word| report(guess, word)}.values.map(&:size).max
  end

  def best_guess
    dictionary.min_by{|guess| score(guess)}
  end

  # This is quite slow, especially the first word, as we do O(N^2) checks
  # So to save some time, result of first one is pre-calculated here
  def play
    @candidates = dictionary
    guess = "arise"
    loop do
      puts guess
      result = gets.chomp
      break if result == "🟩🟩🟩🟩🟩"
      @candidates.select!{|word| report(guess, word) == result}
      guess = best_guess
    end
  end
end

WordleBot.new.play
