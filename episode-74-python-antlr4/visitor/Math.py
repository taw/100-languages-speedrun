#!/usr/bin/env python3

from antlr4 import *
from MathLexer import MathLexer
from MathParser import MathParser
import sys

class MathProgram:
  def __init__(self, program):
    self.program = program

  def evalExpr(self, node):
    children = node.children
    if len(children) == 3:
      a = self.evalExpr(children[0])
      b = children[1].getText()
      c = self.evalTerm(children[2])
      if b == "+":
        return a + c
      else:
        return a - c
    else:
      return self.evalTerm(children[0])

  def evalTerm(self, node):
    children = node.children
    if len(children) == 3:
      a = self.evalTerm(children[0])
      b = children[1].getText()
      c = self.evalFactor(children[2])
      if b == "*":
        return a * c
      else:
        return a / c
    else:
      return self.evalFactor(children[0])

  def evalFactor(self, node):
    children = node.children
    if len(children) == 3:
      return self.evalExpr(children[1])
    elif node.number():
      return float(node.number().getText())
    else:
      return self.getVar((node.identifier().getText()))

  def getVar(self, name):
    if name not in self.vars:
      self.vars[name] = float(input(f"Enter value for {name}: "))
    return self.vars[name]

  def run(self):
    self.vars = {}
    result = self.evalExpr(self.program)
    print(result)

def parseFile(path):
  lexer = MathLexer(FileStream(path))
  stream = CommonTokenStream(lexer)
  parser = MathParser(stream)
  tree = parser.expr()
  MathProgram(tree).run()

if __name__ == "__main__":
  path = sys.argv[1]
  parseFile(path)
