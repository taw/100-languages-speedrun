# Generated from Math.g4 by ANTLR 4.9.3
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .MathParser import MathParser
else:
    from MathParser import MathParser

# This class defines a complete listener for a parse tree produced by MathParser.
class MathListener(ParseTreeListener):

    # Enter a parse tree produced by MathParser#expr.
    def enterExpr(self, ctx:MathParser.ExprContext):
        pass

    # Exit a parse tree produced by MathParser#expr.
    def exitExpr(self, ctx:MathParser.ExprContext):
        pass


    # Enter a parse tree produced by MathParser#term.
    def enterTerm(self, ctx:MathParser.TermContext):
        pass

    # Exit a parse tree produced by MathParser#term.
    def exitTerm(self, ctx:MathParser.TermContext):
        pass


    # Enter a parse tree produced by MathParser#factor.
    def enterFactor(self, ctx:MathParser.FactorContext):
        pass

    # Exit a parse tree produced by MathParser#factor.
    def exitFactor(self, ctx:MathParser.FactorContext):
        pass


    # Enter a parse tree produced by MathParser#number.
    def enterNumber(self, ctx:MathParser.NumberContext):
        pass

    # Exit a parse tree produced by MathParser#number.
    def exitNumber(self, ctx:MathParser.NumberContext):
        pass


    # Enter a parse tree produced by MathParser#identifier.
    def enterIdentifier(self, ctx:MathParser.IdentifierContext):
        pass

    # Exit a parse tree produced by MathParser#identifier.
    def exitIdentifier(self, ctx:MathParser.IdentifierContext):
        pass



del MathParser