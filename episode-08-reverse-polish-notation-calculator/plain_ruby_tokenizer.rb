#!/usr/bin/env ruby

class RPNTokenizer
  def call(string)
    tokens = []
    until string.empty?
      if string =~ /\A\s+/
        string = string[$&.size..-1]
      elsif string =~ /\A-?\d+(?:\.\d*)?/
        tokens << { type: "number", value: $&.to_f }
        string = string[$&.size..-1]
      elsif string =~ /\A[\+\-\*\/]|in|out/
        tokens << { type: $& }
        string = string[$&.size..-1]
      else
        raise "Invalid character #{string[0]}"
      end
    end
    tokens
  end
end

pp RPNTokenizer.new.call("1 -2 3.5 + * in - out")
