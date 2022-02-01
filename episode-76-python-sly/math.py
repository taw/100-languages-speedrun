#!/usr/bin/env python3

from sly import Lexer, Parser
import sys

class MathLexer(Lexer):
  tokens = { PLUS, MINUS, TIMES, DIVIDE, LPAREN, RPAREN, NUM, ID }
  ignore = " \t\r\n"
  PLUS = r"\+"
  MINUS = r"-"
  TIMES = r"\*"
  DIVIDE = r"/"
  LPAREN = r"\("
  RPAREN = r"\)"
  NUM = r"-?[0-9]+(\.[0-9]*)?"
  ID = r"[a-zA-Z_][a-zA-Z0-9_]*"

class MathParser(Parser):
  tokens = MathLexer.tokens

  def __init__(self):
    self.vars = {}

  @_("expr PLUS term")
  def expr(self, p):
    return p.expr + p.term

  @_("expr MINUS term")
  def expr(self, p):
    return p.expr - p.term

  @_("term")
  def expr(self, p):
    return p.term

  @_("term TIMES factor")
  def term(self, p):
    return p.term * p.factor

  @_("term DIVIDE factor")
  def term(self, p):
    return p.term / p.factor

  @_("factor")
  def term(self, p):
    return p.factor

  @_("LPAREN expr RPAREN")
  def factor(self, p):
    return p.expr

  @_("NUM")
  def factor(self, p):
    return float(p.NUM)

  @_("ID")
  def factor(self, p):
    return self.getVar(p.ID)

  def getVar(self, name):
    if name not in self.vars:
      self.vars[name] = float(input(f"Enter value for {name}: "))
    return self.vars[name]

if __name__ == "__main__":
  path = sys.argv[1]
  with open(path) as f:
    text = f.read()
    lexer = MathLexer()
    parser = MathParser()
    result = parser.parse(lexer.tokenize(text))
    print(result)
