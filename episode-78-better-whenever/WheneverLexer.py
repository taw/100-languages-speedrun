from sly import Lexer

class WheneverLexer(Lexer):
  tokens = { PLUS, MINUS, TIMES, DIVIDE, LPAREN, RPAREN, COMMA, HASH, REL, NUM, ID, EOS, STRING, AND, OR, NOT, PRINT, DEFER, AGAIN, N, TRUE, FALSE, MOD }

  ignore = " \t\r"
  EOS = r"(\n|;|//[^\n]*\n)+"
  PLUS = r"\+"
  MINUS = r"-"
  TIMES = r"\*"
  DIVIDE = r"/"
  MOD = r"%"
  LPAREN = r"\("
  RPAREN = r"\)"
  COMMA = ","
  HASH = "#"
  REL = r"<=|<|>=|>|==|!="
  OR = r"\|\|"
  AND = "&&"
  NOT = "!"
  STRING = r'"[^"]*"'
  NUM = r"[0-9]+"
  ID = r"[a-zA-Z_][a-zA-Z0-9_]*"

  ID['again'] = AGAIN
  ID['defer'] = DEFER
  ID['false'] = FALSE
  ID['N'] = N
  ID['print'] = PRINT
  ID['true'] = TRUE

  def NUM(self, t):
    t.value = int(t.value)
    return t

  def STRING(self, t):
    t.value = t.value[1:-1]
    return t
