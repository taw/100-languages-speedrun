#!/usr/bin/env ruby

require "strscan"

class RPNTokenizer
  def call(string)
    scanner = StringScanner.new(string)
    tokens = []
    until scanner.eos?
      if scanner.scan(/\s+/)
        # do nothing
      elsif scanner.scan(/-?\d+(?:\.\d*)?/)
        tokens << { type: "number", value: scanner.matched.to_f }
      elsif scanner.scan(/[\+\-\*\/]|in|out/)
        tokens << { type: scanner.matched }
      else
        raise "Invalid character #{scanner.peek}"
      end
    end
    tokens
  end
end

pp RPNTokenizer.new.call("1 -2 3.5 + * in - out")
