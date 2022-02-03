#!/usr/bin/env python3

import sys
from WheneverLexer import WheneverLexer
from WheneverParser import WheneverParser
from WheneverEval import WheneverEval
from random import randint

class WheneverProgram:
  def __init__(self, path):
    self.path = path
    with open(path) as f:
      self.text = f.read()
    lexer = WheneverLexer()
    parser = WheneverParser()
    self.program = parser.parse(lexer.tokenize(self.text))
    self.eval = WheneverEval(self)

  # A lot more optimizations are possible
  # total is the sum of all nontrivial counters
  def init_counters(self):
    self.total = 0
    self.trivial = set()
    self.nontrivial = set()
    self.counters = {}
    has_start = ("start" in self.program)

    for id in self.program.keys():
      if id == "start" or not has_start:
        starting_value = 1
      else:
        starting_value = 0

      self.counters[id] = starting_value

      is_trivial = (self.program[id] == {'again': [], 'defer': [], 'actions': [{'action': 'change', 'id': id, 'count': {'value': 1}}]})
      if is_trivial:
        self.trivial.add(id)
      else:
        self.nontrivial.add(id)
        self.total += starting_value

  def is_deferred(self, id):
    for expr in self.program[id]["defer"]:
      if self.eval.bool_eval(expr):
        return True
    return False

  def random_todo(self, actionable, actionable_total):
    i = randint(0, actionable_total - 1)
    for id in actionable:
      i -= self.counters[id]
      if i < 0:
        return id
    raise Exception("Math failure")

  def execute_random_todo(self):
    actionable = self.nontrivial.copy()
    actionable_total = self.total

    while True:
      if actionable_total == 0:
        raise Exception("All actions are deferred")
      id = self.random_todo(actionable, actionable_total)

      if self.is_deferred(id):
        actionable.remove(id)
        actionable_total -= self.counters[id]
      else:
        self.execute_todo(id)
        return

  # defer is checked before we call this
  def execute_todo(self, id):
    todo = self.program[id]
    again = todo["again"]
    remove_todo = True
    for expr in todo["defer"]:
      if self.eval.bool_eval(expr):
        remove_todo = False
    for action in todo["actions"]:
      self.execute_action(action)
    if remove_todo:
      self.update_counter(id, -1)

  def execute_action(self, action):
    action_type = action["action"]
    if action_type == "print":
      s = self.eval.str_eval(action["arg"])
      print(s)
    elif action_type == "change":
      id = action["id"]
      count = self.eval.int_eval(action["count"])
      self.update_counter(id, count)
    else:
      raise Exception(f"Unknown action: {action_type}")

  def update_counter(self, id, change):
    old_value = self.counters[id]
    new_value = old_value + change
    if new_value < 0:
      new_value = 0
    self.counters[id] = new_value
    if id not in self.trivial:
      self.total += (new_value - old_value)

  def run(self):
    self.init_counters()
    while self.total > 0:
      self.execute_random_todo()
    if sum(self.counters.values()) != 0:
      raise Exception("Program entered do-nothing infinite loop")

program = WheneverProgram(sys.argv[1])
program.run()
