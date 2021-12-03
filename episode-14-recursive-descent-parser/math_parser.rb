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

  def next_token_is?(*types)
    @tokens[0] && types.include?(@tokens[0][:type])
  end

  def expect_token(*types)
    raise "Parse error" unless next_token_is?(*types)
    @tokens.shift
  end

  def parse_factor
    token = expect_token("number", "id", "(")
    case token[:type]
    when "number", "id"
      token
    when "("
      result = parse_expression
      expect_token(")")
      result
    end
  end

  def parse_product
    result = parse_factor
    while next_token_is?("*", "/")
      op_token = @tokens.shift
      result = {type: op_token[:type], left: result, right: parse_factor}
    end
    result
  end

  def parse_expression
    result = parse_product
    while next_token_is?("+", "-")
      op_token = @tokens.shift
      result = {type: op_token[:type], left: result, right: parse_product}
    end
    result
  end

  def parse_statement
    token = expect_token("read", "set", "print")
    case token[:type]
    when "read"
      token = expect_token("id")
      {type: "read", id: token[:value]}
    when "set"
      var_token = expect_token("id")
      expect_token("=")
      expr = parse_expression
      {type: "set", id: var_token[:value], expr: expr}
    when "print"
      token = expect_token("id")
      {type: "print", id: token[:value]}
    end
  end

  def call
    @lines.each do |line|
      @tokens = tokenize(line)
      next if @tokens.empty?
      statement = parse_statement
      raise "Extra tokens left over" unless @tokens.empty?
      pp statement
    end
  end
end

unless ARGV.size == 1
  STDERR.puts "Usage: #{$0} file.math"
  exit 1
end

MathLanguage.new(ARGV[0]).call
