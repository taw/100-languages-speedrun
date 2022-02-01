#!/usr/bin/env python3

from antlr4 import *
from MathLexer import MathLexer
from MathParser import MathParser
import sys

class MathProgram:
  def __init__(self, program):
    self.program = program

  def evalAdd(self, node):
    return self.eval(node.a) + self.eval(node.b)

  def evalSub(self, node):
    return self.eval(node.a) - self.eval(node.b)

  def evalMul(self, node):
    return self.eval(node.a) * self.eval(node.b)

  def evalDiv(self, node):
    return self.eval(node.a) / self.eval(node.b)

  def evalNumber(self, node):
    return float(node.getText())

  def evalIdentifier(self, node):
    return self.getVar(node.getText())

  def getVar(self, name):
    if name not in self.vars:
      self.vars[name] = float(input(f"Enter value for {name}: "))
    return self.vars[name]

  def eval(self, node):
    if not isinstance(node, ParserRuleContext):
      raise Exception(f"{node} must be a node, not a {type(node)}")
    name = "eval" + type(node).__name__[:-7]
    if name[:11] == "evalTrivial":
      return self.eval(node.a)
    return self.__getattribute__(name)(node)

  def run(self):
    self.vars = {}
    result = self.eval(self.program)
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
