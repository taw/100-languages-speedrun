class WheneverEval:
  def __init__(self, program):
    self.program = program

  def int_eval_node(self, node):
    a = self.int_eval(node["a"])
    b = self.int_eval(node["b"])
    return (a, b)

  def int_eval(self, node):
    return self.int(self.eval(node))

  def bool_eval(self, node):
    return self.bool(self.eval(node))

  def str_eval(self, node):
    return self.str(self.eval(node))

  # A lot of aggressive casting to int here
  def eval(self, node):
    if "value" in node:
      return node["value"]
    if "N" in node:
      return self.program.counters[node["N"]]
    if "op" not in node:
      raise Exception(f"Neither op nor value? {node}")
    op = node["op"]
    if op == "-":
      (a, b) = self.int_eval_node(node)
      return a - b
    if op == "*":
      (a, b) = self.int_eval_node(node)
      return a * b
    if op == "/":
      (a, b) = self.int_eval_node(node)
      return a // b
    if op == "%":
      (a, b) = self.int_eval_node(node)
      return a % b
    # Not even clear about this one:
    if op == "+":
      a = self.eval(node["a"])
      b = self.eval(node["b"])
      if isinstance(a, str) or isinstance(b, str):
        return self.str(a) + self.str(b)
      else:
        return self.int(a) + self.int(b)
    if op == "uminus":
      a = self.int_eval(node["a"])
      return -a
    if op == "||":
      a = self.bool_eval(node["a"])
      b = self.bool_eval(node["b"])
      return a or b
    if op == "&&":
      a = self.bool_eval(node["a"])
      b = self.bool_eval(node["b"])
      return a and b
    if op == "!":
      a = self.bool_eval(node["a"])
      return not a
    if op == "<":
      (a, b) = self.int_eval_node(node)
      return a < b
    if op == "<=":
      (a, b) = self.int_eval_node(node)
      return a <= b
    if op == ">":
      (a, b) = self.int_eval_node(node)
      return a > b
    if op == ">=":
      (a, b) = self.int_eval_node(node)
      return a >= b
    if op == "==":
      (a, b) = self.int_eval_node(node)
      return a == b
    if op == "!=":
      (a, b) = self.int_eval_node(node)
      return a != b
    raise Exception(f"TODO: Operation {op} not supported yet")

  def int(self, value):
    if isinstance(value, bool):
      if value == True:
        return 1
      if value == False:
        return 0
    if isinstance(value, int):
      return value
    if isinstance(value, str):
      if re.match(r"^-?\d+", value):
        return int(value)
      else:
        return 0
    raise Exception(f"Invalid type {value}")

  def bool(self, value):
    if isinstance(value, bool):
      return value
    return self.program.counters[value] > 0

  def str(self, value):
    if isinstance(value, bool):
      if value == True:
        return "true"
      if value == False:
        return "false"
    if isinstance(value, str):
      return value
    if isinstance(value, int):
      return str(value)
    raise Exception(f"Invalid type {value}")
