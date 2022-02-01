# Generated from Math.g4 by ANTLR 4.9.3
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .MathParser import MathParser
else:
    from MathParser import MathParser

# This class defines a complete listener for a parse tree produced by MathParser.
class MathListener(ParseTreeListener):

    # Enter a parse tree produced by MathParser#Add.
    def enterAdd(self, ctx:MathParser.AddContext):
        pass

    # Exit a parse tree produced by MathParser#Add.
    def exitAdd(self, ctx:MathParser.AddContext):
        pass


    # Enter a parse tree produced by MathParser#Sub.
    def enterSub(self, ctx:MathParser.SubContext):
        pass

    # Exit a parse tree produced by MathParser#Sub.
    def exitSub(self, ctx:MathParser.SubContext):
        pass


    # Enter a parse tree produced by MathParser#TrivialExpr.
    def enterTrivialExpr(self, ctx:MathParser.TrivialExprContext):
        pass

    # Exit a parse tree produced by MathParser#TrivialExpr.
    def exitTrivialExpr(self, ctx:MathParser.TrivialExprContext):
        pass


    # Enter a parse tree produced by MathParser#Div.
    def enterDiv(self, ctx:MathParser.DivContext):
        pass

    # Exit a parse tree produced by MathParser#Div.
    def exitDiv(self, ctx:MathParser.DivContext):
        pass


    # Enter a parse tree produced by MathParser#Mul.
    def enterMul(self, ctx:MathParser.MulContext):
        pass

    # Exit a parse tree produced by MathParser#Mul.
    def exitMul(self, ctx:MathParser.MulContext):
        pass


    # Enter a parse tree produced by MathParser#TrivialTerm.
    def enterTrivialTerm(self, ctx:MathParser.TrivialTermContext):
        pass

    # Exit a parse tree produced by MathParser#TrivialTerm.
    def exitTrivialTerm(self, ctx:MathParser.TrivialTermContext):
        pass


    # Enter a parse tree produced by MathParser#TrivialParensExpr.
    def enterTrivialParensExpr(self, ctx:MathParser.TrivialParensExprContext):
        pass

    # Exit a parse tree produced by MathParser#TrivialParensExpr.
    def exitTrivialParensExpr(self, ctx:MathParser.TrivialParensExprContext):
        pass


    # Enter a parse tree produced by MathParser#Number.
    def enterNumber(self, ctx:MathParser.NumberContext):
        pass

    # Exit a parse tree produced by MathParser#Number.
    def exitNumber(self, ctx:MathParser.NumberContext):
        pass


    # Enter a parse tree produced by MathParser#Identifier.
    def enterIdentifier(self, ctx:MathParser.IdentifierContext):
        pass

    # Exit a parse tree produced by MathParser#Identifier.
    def exitIdentifier(self, ctx:MathParser.IdentifierContext):
        pass



del MathParser