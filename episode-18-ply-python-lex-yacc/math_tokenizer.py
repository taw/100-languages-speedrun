#!/usr/bin/env python3

import sys
import ply.lex as lex

tokens = (
  "DIVIDE",
  "EQUALS",
  "ID",
  "LPAREN",
  "MINUS",
  "NUMBER",
  "PLUS",
  "PRINT",
  "READ",
  "RPAREN",
  "SET",
  "TIMES",
)

# Tokens
t_PLUS    = r"\+"
t_MINUS   = r"-"
t_TIMES   = r"\*"
t_DIVIDE  = r"/"
t_EQUALS  = r"="
t_LPAREN  = r"\("
t_RPAREN  = r"\)"

def t_NUMBER(t):
  r"-?\d+(\.\d*)?"
  t.value = float(t.value)
  return t

# We cannot make 't_READ' etc. have higher priority than 't_ID'
# so we need to match them together and figure out token type
# in a function.
def t_NAME(t):
  r"[a-zA-Z_][a-zA-Z0-9_]*"
  keywords = {
    "set" : "SET",
    "read" : "READ",
    "print" : "PRINT",
  }
  t.type = keywords.get(t.value, "ID")
  return t

def t_ignoreme(t):
  r'[ \t\n]|\#.*'
  pass

def t_error(t):
  print(f"Illegal character {t.value[0]!r}")
  t.lexer.skip(1)

# Build the lexer
lexer = lex.lex()

with open(sys.argv[1]) as file:
  while line := file.readline():
    print(f"Line: {line}", end="")
    lexer.input(line)
    while True:
      tok = lexer.token()
      if not tok:
        break
      print(f"  {tok}")
