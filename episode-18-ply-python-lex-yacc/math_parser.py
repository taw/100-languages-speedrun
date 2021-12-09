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

def p_line_statement(p):
  'line : statement'
  p[0] = p[1]

def p_line_empty(p):
  'line :'
  p[0] =  {"op": "ignore"}

def p_statement_set(p):
  "statement : SET ID EQUALS expression"
  p[0] = {"op": "set", "var": p[2], "value": p[4]}

def p_statement_print(p):
  "statement : PRINT expression"
  p[0] = {"op": "print", "value": p[2]}

def p_statement_read(p):
  "statement : READ ID"
  p[0] = {"op": "read", "var": p[2]}

def p_expression_plus(p):
  "expression : expression PLUS product"
  p[0] = {"op": "+", "left": p[1], "right": p[3]}

def p_expression_minus(p):
  "expression : expression MINUS product"
  p[0] = {"op": "-", "left": p[1], "right": p[3]}

def p_expression_product(p):
  "expression : product"
  p[0] = p[1]

def p_product_times(p):
  "product : product TIMES factor"
  p[0] = {"op": "*", "left": p[1], "right": p[3]}

def p_product_divide(p):
  "product : product DIVIDE factor"
  p[0] = {"op": "/", "left": p[1], "right": p[3]}

def p_product_factor(p):
  "product : factor"
  p[0] = p[1]

def p_factor_number(p):
  "factor : NUMBER"
  p[0] = {"op": "number", "value": p[1]}

def p_factor_var(p):
  "factor : ID"
  p[0] = {"op": "var", "value": p[1]}

def p_factor_paren(p):
  "factor : LPAREN expression RPAREN"
  p[0] = p[2]

def p_error(p):
  print(f"Syntax error at {p!r}")

import ply.yacc as yacc
yacc.yacc()

with open(sys.argv[1]) as file:
  while line := file.readline():
    print(f"Line: {line}", end="")
    r = yacc.parse(line)
    print(f"  {r}")
