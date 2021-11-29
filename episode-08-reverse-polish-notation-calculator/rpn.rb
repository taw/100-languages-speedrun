#!/usr/bin/env ruby

require "strscan"
require "pathname"

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

class RPN
  def initialize(program_path)
    @string = Pathname(program_path).read
    @program = RPNTokenizer.new.call(@string)
  end

  def call
    stack = []
    @program.each do |token|
      case token[:type]
      when "number"
        stack << token[:value]
      when "+"
        b, a = stack.pop, stack.pop
        stack << a + b
      when "*"
        b, a = stack.pop, stack.pop
        stack << a * b
      when "-"
        b, a = stack.pop, stack.pop
        stack << a - b
      when "/"
        b, a = stack.pop, stack.pop
        stack << a / b
      when "in"
        stack << STDIN.readline.to_f
      when "out"
        puts stack.pop
      else
        raise "Invalid token #{token}"
      end
    end
  end
end

RPN.new(ARGV[0]).call
