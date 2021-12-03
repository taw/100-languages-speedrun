#!/usr/bin/env ruby

require "strscan"
require "pathname"

class MathLanguage
  def initialize(path)
    @lines = Pathname(path).readlines
  end

  def tokenize(string)
    scanner = StringScanner.new(string)
    tokens = []
    until scanner.eos?
      if scanner.scan(/\s+/)
        # do nothing
      elsif scanner.scan(/#.*/)
        # comments - ignore rest of line
      elsif scanner.scan(/-?\d+(?:\.\d*)?/)
        tokens << { type: "number", value: scanner.matched.to_f }
      elsif scanner.scan(/[\+\-\*\/=()]|set|read|print/)
        tokens << { type: scanner.matched }
      elsif scanner.scan(/[a-zA-Z][a-zA-Z0-9]*/)
        tokens << { type: "id", value: scanner.matched }
      else
        raise "Invalid character #{scanner.rest}"
      end
    end
    tokens
  end

  def call
    @lines.each do |line|
      tokens = tokenize(line)
      puts "Line: \"#{line.chomp}\" has tokens:"
      tokens.each do |token|
        p token
      end
    end
  end
end

unless ARGV.size == 1
  STDERR.puts "Usage: #{$0} file.math"
  exit 1
end

MathLanguage.new(ARGV[0]).call
