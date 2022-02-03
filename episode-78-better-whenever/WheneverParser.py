from sly import Parser
from WheneverLexer import WheneverLexer

class WheneverParser(Parser):
  tokens = WheneverLexer.tokens

  @_("")
  def program(self, p):
    return {}

  @_("EOS program")
  def program(self, p):
    return p.program

  @_("todo program")
  def program(self, p):
    program = p.program
    id, todo = p.todo
    if id in program:
      raise Exception(f"Duplicate todo id: {id}")
    program[id] = todo
    return program

  @_("id modifiers actions EOS")
  def todo(self, p):
    again = []
    defer = []
    for mod in p.modifiers:
      if "again" in mod:
        again.append(mod["again"])
      if "defer" in mod:
        defer.append(mod["defer"])
    return (p.id, {"again": again, "defer": defer, "actions": p.actions})

  @_("")
  def modifiers(self, p):
    return []

  @_("modifier modifiers")
  def modifiers(self, p):
    return [p.modifier] + p.modifiers

  @_("DEFER LPAREN expr RPAREN")
  def modifier(self, p):
    return {"defer": p.expr}

  @_("AGAIN LPAREN expr RPAREN")
  def modifier(self, p):
    return {"again": p.expr}

  @_("action")
  def actions(self, p):
    return [p.action]

  @_("action COMMA actions")
  def actions(self, p):
    return [p.action] + p.actions

  @_("id")
  def action(self, p):
    return {"action": "change", "id": p.id, "count": {"value": 1}}

  @_("MINUS id")
  def action(self, p):
    return {"action": "change", "id": p.id, "count": {"value": -1}}

  @_("id HASH expr")
  def action(self, p):
    return {"action": "change", "id": p.id, "count": p.expr}

  @_("MINUS id HASH expr")
  def action(self, p):
    return {"action": "change", "id": p.id, "count": {"op": "uminus", "a": p.expr}}

  @_("PRINT LPAREN expr RPAREN")
  def action(self, p):
    return {"action": "print", "arg": p.expr}

  # expr, going through all the priority levels
  @_("exprlo")
  def expr(self, p):
    return p.exprlo

  ### expr logical or
  @_("exprla")
  def exprlo(self, p):
    return p.exprla

  @_("exprlo OR exprla")
  def exprlo(self, p):
    return {"op": "||", "a": p.exprlo, "b": p.exprla}

  ### expr logical and
  @_("exprr")
  def exprla(self, p):
    return p.exprr

  @_("exprla AND exprr")
  def exprla(self, p):
    return {"op": "&&", "a": p.exprla, "b": p.exprr}

  ### expr relational
  ### do not support chaining them without parentheses
  @_("expra")
  def exprr(self, p):
    return p.expra

  @_("expra REL expra")
  def exprr(self, p):
    return {"op": p.REL, "a": p.expra0, "b": p.expra1}

  ### expr additive
  @_("expra PLUS exprm")
  def expra(self, p):
    return {"op": "+", "a": p.expra, "b": p.exprm}

  @_("expra MINUS exprm")
  def expra(self, p):
    return {"op": "-", "a": p.expra, "b": p.exprm}

  @_("exprm")
  def expra(self, p):
    return p.exprm

  ### expr multiplicative
  @_("exprm TIMES expru")
  def exprm(self, p):
    return {"op": "*", "a": p.exprm, "b": p.expru}

  @_("exprm DIVIDE expru")
  def exprm(self, p):
    return {"op": "/", "a": p.exprm, "b": p.expru}

  @_("exprm MOD expru")
  def exprm(self, p):
    return {"op": "%", "a": p.exprm, "b": p.expru}

  #### expr unary
  @_("expru")
  def exprm(self, p):
    return p.expru

  @_("value")
  def expru(self, p):
    return p.value

  @_("NOT expru")
  def expru(self, p):
    return {"op": "!", "a": p.expru}

  @_("MINUS expru")
  def expru(self, p):
    return {"op": "uminus", "a": p.expru}

  ### primitive value
  @_("LPAREN expr RPAREN")
  def value(self, p):
    return p.expr

  # No reason to distinguish between foo and "foo" yet
  @_("ID")
  def value(self, p):
    return {"value": p.ID}

  @_("NUM")
  def value(self, p):
    return {"value": p.NUM}

  @_("N LPAREN id RPAREN")
  def value(self, p):
    return {"N": p.id}

  @_("STRING")
  def value(self, p):
    return {"value": p.STRING}

  @_("TRUE")
  def value(self, p):
    return {"value": True}

  @_("FALSE")
  def value(self, p):
    return {"value": False}

  @_("ID")
  def id(self, p):
    return p.ID

  @_("NUM")
  def id(self, p):
    return p.NUM

  def error(self, token):
    if token:
      lineno = getattr(token, "lineno", 0)
      if lineno:
        raise Exception(f"sly: Syntax error at line {lineno}, token={token.type}")
      else:
        raise Exception(f"sly: Syntax error, token={token.type}")
    else:
        raise Exception("sly: Parse error in input. EOF")
