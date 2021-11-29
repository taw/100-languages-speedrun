#!/usr/bin/env ruby

require "lex"

class RPNLexer < Lex::Lexer
  tokens(
    :NUMBER,
    :PLUS,
    :MINUS,
    :TIMES,
    :DIVIDE,
    :IN,
    :OUT
  )

  rule(:PLUS,   /\+/)
  rule(:MINUS,  /\-/)
  rule(:TIMES,  /\*/)
  rule(:DIVIDE, /\//)
  rule(:IN,     /in/)
  rule(:OUT,    /out/)

  rule(:NUMBER, /[0-9]+(?:\.[0-9]*)?/) do |lexer, token|
    token.value = token.value.to_f
    token
  end

  # Define a rule so we can track line numbers
  rule(:newline, /\n+/) do |lexer, token|
    lexer.advance_line(token.value.size)
  end

  # A string containing ignored characters (spaces and tabs)
  ignore " \t"

  error do |lexer, char|
    puts "Illegal character: #{char}"
  end
end

my_lexer = RPNLexer.new

out = my_lexer.lex("1 2 3 +")

pp out.next
pp out.next
pp out.next
pp out.next
