#!/usr/bin/env python3

from antlr4 import *
from MathLexer import MathLexer
from MathParser import MathParser
from MathListener import MathListener
import sys

class MathProgram(MathListener):
  def exitNumber(self, node):
    value = float(node.getText())
    self.stack.append(value)

  def exitIdentifier(self, node):
    value = self.getVar(node.getText())
    self.stack.append(value)

  def exitAdd(self, node):
    b = self.stack.pop()
    a = self.stack.pop()
    self.stack.append(a + b)

  def exitSub(self, node):
    b = self.stack.pop()
    a = self.stack.pop()
    self.stack.append(a - b)

  def exitMul(self, node):
    b = self.stack.pop()
    a = self.stack.pop()
    self.stack.append(a * b)

  def exitDiv(self, node):
    b = self.stack.pop()
    a = self.stack.pop()
    self.stack.append(a / b)

  def getVar(self, name):
    if name not in self.vars:
      self.vars[name] = float(input(f"Enter value for {name}: "))
    return self.vars[name]

  def run(self, node):
    self.stack = []
    self.vars = {}
    ParseTreeWalker().walk(self, node)
    result = self.stack[0]
    print(result)

def parseFile(path):
  lexer = MathLexer(FileStream(path))
  stream = CommonTokenStream(lexer)
  parser = MathParser(stream)
  tree = parser.expr()
  MathProgram().run(tree)

if __name__ == "__main__":
  path = sys.argv[1]
  parseFile(path)
