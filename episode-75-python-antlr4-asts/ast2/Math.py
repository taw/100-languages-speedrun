#!/usr/bin/env python3

from antlr4 import *
from MathLexer import MathLexer
from MathParser import MathParser
from collections import namedtuple
import sys

class AddNode:
  def __init__(self, a, b):
    self.a = a
    self.b = b

  def eval(self, context):
    return self.a.eval(context) + self.b.eval(context)

class SubNode:
  def __init__(self, a, b):
    self.a = a
    self.b = b

  def eval(self, context):
    return self.a.eval(context) - self.b.eval(context)

class MulNode:
  def __init__(self, a, b):
    self.a = a
    self.b = b

  def eval(self, context):
    return self.a.eval(context) * self.b.eval(context)

class DivNode:
  def __init__(self, a, b):
    self.a = a
    self.b = b

  def eval(self, context):
    return self.a.eval(context) / self.b.eval(context)

class NumberNode:
  def __init__(self, value):
    self.value = value

  def eval(self, context):
    return self.value

class IdentifierNode:
  def __init__(self, name):
    self.name = name

  def eval(self, context):
    return context.getVar(self.name)

class MathAstBuilder:
  def buildAdd(self, node):
    return AddNode(self.build(node.a), self.build(node.b))

  def buildSub(self, node):
    return SubNode(self.build(node.a), self.build(node.b))

  def buildMul(self, node):
    return MulNode(self.build(node.a), self.build(node.b))

  def buildDiv(self, node):
    return DivNode(self.build(node.a), self.build(node.b))

  def buildNumber(self, node):
    return NumberNode(float(node.getText()))

  def buildIdentifier(self, node):
    return IdentifierNode(node.getText())

  def build(self, node):
    if not isinstance(node, ParserRuleContext):
      raise Exception(f"{node} must be a node, not a {type(node)}")
    name = "build" + type(node).__name__[:-7]
    if name[:12] == "buildTrivial":
      return self.build(node.a)
    return self.__getattribute__(name)(node)

class MathProgram:
  def __init__(self, program):
    self.program = program

  def getVar(self, name):
    if name not in self.vars:
      self.vars[name] = float(input(f"Enter value for {name}: "))
    return self.vars[name]

  def run(self):
    self.vars = {}
    result = self.program.eval(self)
    print(result)

def parseFile(path):
  lexer = MathLexer(FileStream(path))
  stream = CommonTokenStream(lexer)
  parser = MathParser(stream)
  cst = parser.expr()
  ast = MathAstBuilder().build(cst)
  MathProgram(ast).run()

if __name__ == "__main__":
  path = sys.argv[1]
  parseFile(path)
