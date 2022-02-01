# Generated from Math.g4 by ANTLR 4.9.3
# encoding: utf-8
from antlr4 import *
from io import StringIO
import sys
if sys.version_info[1] > 5:
	from typing import TextIO
else:
	from typing.io import TextIO


def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\13")
        buf.write("-\4\2\t\2\4\3\t\3\4\4\t\4\3\2\3\2\3\2\3\2\3\2\3\2\3\2")
        buf.write("\3\2\3\2\7\2\22\n\2\f\2\16\2\25\13\2\3\3\3\3\3\3\3\3\3")
        buf.write("\3\3\3\3\3\3\3\3\3\7\3 \n\3\f\3\16\3#\13\3\3\4\3\4\3\4")
        buf.write("\3\4\3\4\3\4\5\4+\n\4\3\4\2\4\2\4\5\2\4\6\2\2\2/\2\b\3")
        buf.write("\2\2\2\4\26\3\2\2\2\6*\3\2\2\2\b\t\b\2\1\2\t\n\5\4\3\2")
        buf.write("\n\23\3\2\2\2\13\f\f\5\2\2\f\r\7\3\2\2\r\22\5\4\3\2\16")
        buf.write("\17\f\4\2\2\17\20\7\4\2\2\20\22\5\4\3\2\21\13\3\2\2\2")
        buf.write("\21\16\3\2\2\2\22\25\3\2\2\2\23\21\3\2\2\2\23\24\3\2\2")
        buf.write("\2\24\3\3\2\2\2\25\23\3\2\2\2\26\27\b\3\1\2\27\30\5\6")
        buf.write("\4\2\30!\3\2\2\2\31\32\f\5\2\2\32\33\7\5\2\2\33 \5\6\4")
        buf.write("\2\34\35\f\4\2\2\35\36\7\6\2\2\36 \5\6\4\2\37\31\3\2\2")
        buf.write("\2\37\34\3\2\2\2 #\3\2\2\2!\37\3\2\2\2!\"\3\2\2\2\"\5")
        buf.write("\3\2\2\2#!\3\2\2\2$%\7\7\2\2%&\5\2\2\2&\'\7\b\2\2\'+\3")
        buf.write("\2\2\2(+\7\n\2\2)+\7\t\2\2*$\3\2\2\2*(\3\2\2\2*)\3\2\2")
        buf.write("\2+\7\3\2\2\2\7\21\23\37!*")
        return buf.getvalue()


class MathParser ( Parser ):

    grammarFileName = "Math.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "'+'", "'-'", "'*'", "'/'", "'('", "')'" ]

    symbolicNames = [ "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "ID", "NUM", 
                      "WS" ]

    RULE_expr = 0
    RULE_term = 1
    RULE_factor = 2

    ruleNames =  [ "expr", "term", "factor" ]

    EOF = Token.EOF
    T__0=1
    T__1=2
    T__2=3
    T__3=4
    T__4=5
    T__5=6
    ID=7
    NUM=8
    WS=9

    def __init__(self, input:TokenStream, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.9.3")
        self._interp = ParserATNSimulator(self, self.atn, self.decisionsToDFA, self.sharedContextCache)
        self._predicates = None




    class ExprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser


        def getRuleIndex(self):
            return MathParser.RULE_expr

     
        def copyFrom(self, ctx:ParserRuleContext):
            super().copyFrom(ctx)


    class AddContext(ExprContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a MathParser.ExprContext
            super().__init__(parser)
            self.a = None # ExprContext
            self.b = None # TermContext
            self.copyFrom(ctx)

        def expr(self):
            return self.getTypedRuleContext(MathParser.ExprContext,0)

        def term(self):
            return self.getTypedRuleContext(MathParser.TermContext,0)


        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterAdd" ):
                listener.enterAdd(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitAdd" ):
                listener.exitAdd(self)


    class SubContext(ExprContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a MathParser.ExprContext
            super().__init__(parser)
            self.a = None # ExprContext
            self.b = None # TermContext
            self.copyFrom(ctx)

        def expr(self):
            return self.getTypedRuleContext(MathParser.ExprContext,0)

        def term(self):
            return self.getTypedRuleContext(MathParser.TermContext,0)


        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterSub" ):
                listener.enterSub(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitSub" ):
                listener.exitSub(self)


    class TrivialExprContext(ExprContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a MathParser.ExprContext
            super().__init__(parser)
            self.a = None # TermContext
            self.copyFrom(ctx)

        def term(self):
            return self.getTypedRuleContext(MathParser.TermContext,0)


        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterTrivialExpr" ):
                listener.enterTrivialExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitTrivialExpr" ):
                listener.exitTrivialExpr(self)



    def expr(self, _p:int=0):
        _parentctx = self._ctx
        _parentState = self.state
        localctx = MathParser.ExprContext(self, self._ctx, _parentState)
        _prevctx = localctx
        _startState = 0
        self.enterRecursionRule(localctx, 0, self.RULE_expr, _p)
        try:
            self.enterOuterAlt(localctx, 1)
            localctx = MathParser.TrivialExprContext(self, localctx)
            self._ctx = localctx
            _prevctx = localctx

            self.state = 7
            localctx.a = self.term(0)
            self._ctx.stop = self._input.LT(-1)
            self.state = 17
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,1,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    self.state = 15
                    self._errHandler.sync(self)
                    la_ = self._interp.adaptivePredict(self._input,0,self._ctx)
                    if la_ == 1:
                        localctx = MathParser.AddContext(self, MathParser.ExprContext(self, _parentctx, _parentState))
                        localctx.a = _prevctx
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 9
                        if not self.precpred(self._ctx, 3):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 3)")
                        self.state = 10
                        self.match(MathParser.T__0)
                        self.state = 11
                        localctx.b = self.term(0)
                        pass

                    elif la_ == 2:
                        localctx = MathParser.SubContext(self, MathParser.ExprContext(self, _parentctx, _parentState))
                        localctx.a = _prevctx
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 12
                        if not self.precpred(self._ctx, 2):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 2)")
                        self.state = 13
                        self.match(MathParser.T__1)
                        self.state = 14
                        localctx.b = self.term(0)
                        pass

             
                self.state = 19
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,1,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.unrollRecursionContexts(_parentctx)
        return localctx


    class TermContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser


        def getRuleIndex(self):
            return MathParser.RULE_term

     
        def copyFrom(self, ctx:ParserRuleContext):
            super().copyFrom(ctx)


    class DivContext(TermContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a MathParser.TermContext
            super().__init__(parser)
            self.a = None # TermContext
            self.b = None # FactorContext
            self.copyFrom(ctx)

        def term(self):
            return self.getTypedRuleContext(MathParser.TermContext,0)

        def factor(self):
            return self.getTypedRuleContext(MathParser.FactorContext,0)


        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterDiv" ):
                listener.enterDiv(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitDiv" ):
                listener.exitDiv(self)


    class MulContext(TermContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a MathParser.TermContext
            super().__init__(parser)
            self.a = None # TermContext
            self.b = None # FactorContext
            self.copyFrom(ctx)

        def term(self):
            return self.getTypedRuleContext(MathParser.TermContext,0)

        def factor(self):
            return self.getTypedRuleContext(MathParser.FactorContext,0)


        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterMul" ):
                listener.enterMul(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitMul" ):
                listener.exitMul(self)


    class TrivialTermContext(TermContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a MathParser.TermContext
            super().__init__(parser)
            self.a = None # FactorContext
            self.copyFrom(ctx)

        def factor(self):
            return self.getTypedRuleContext(MathParser.FactorContext,0)


        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterTrivialTerm" ):
                listener.enterTrivialTerm(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitTrivialTerm" ):
                listener.exitTrivialTerm(self)



    def term(self, _p:int=0):
        _parentctx = self._ctx
        _parentState = self.state
        localctx = MathParser.TermContext(self, self._ctx, _parentState)
        _prevctx = localctx
        _startState = 2
        self.enterRecursionRule(localctx, 2, self.RULE_term, _p)
        try:
            self.enterOuterAlt(localctx, 1)
            localctx = MathParser.TrivialTermContext(self, localctx)
            self._ctx = localctx
            _prevctx = localctx

            self.state = 21
            localctx.a = self.factor()
            self._ctx.stop = self._input.LT(-1)
            self.state = 31
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,3,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    self.state = 29
                    self._errHandler.sync(self)
                    la_ = self._interp.adaptivePredict(self._input,2,self._ctx)
                    if la_ == 1:
                        localctx = MathParser.MulContext(self, MathParser.TermContext(self, _parentctx, _parentState))
                        localctx.a = _prevctx
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_term)
                        self.state = 23
                        if not self.precpred(self._ctx, 3):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 3)")
                        self.state = 24
                        self.match(MathParser.T__2)
                        self.state = 25
                        localctx.b = self.factor()
                        pass

                    elif la_ == 2:
                        localctx = MathParser.DivContext(self, MathParser.TermContext(self, _parentctx, _parentState))
                        localctx.a = _prevctx
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_term)
                        self.state = 26
                        if not self.precpred(self._ctx, 2):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 2)")
                        self.state = 27
                        self.match(MathParser.T__3)
                        self.state = 28
                        localctx.b = self.factor()
                        pass

             
                self.state = 33
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,3,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.unrollRecursionContexts(_parentctx)
        return localctx


    class FactorContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser


        def getRuleIndex(self):
            return MathParser.RULE_factor

     
        def copyFrom(self, ctx:ParserRuleContext):
            super().copyFrom(ctx)



    class IdentifierContext(FactorContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a MathParser.FactorContext
            super().__init__(parser)
            self.a = None # Token
            self.copyFrom(ctx)

        def ID(self):
            return self.getToken(MathParser.ID, 0)

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterIdentifier" ):
                listener.enterIdentifier(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitIdentifier" ):
                listener.exitIdentifier(self)


    class NumberContext(FactorContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a MathParser.FactorContext
            super().__init__(parser)
            self.a = None # Token
            self.copyFrom(ctx)

        def NUM(self):
            return self.getToken(MathParser.NUM, 0)

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterNumber" ):
                listener.enterNumber(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitNumber" ):
                listener.exitNumber(self)


    class TrivialParensExprContext(FactorContext):

        def __init__(self, parser, ctx:ParserRuleContext): # actually a MathParser.FactorContext
            super().__init__(parser)
            self.a = None # ExprContext
            self.copyFrom(ctx)

        def expr(self):
            return self.getTypedRuleContext(MathParser.ExprContext,0)


        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterTrivialParensExpr" ):
                listener.enterTrivialParensExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitTrivialParensExpr" ):
                listener.exitTrivialParensExpr(self)



    def factor(self):

        localctx = MathParser.FactorContext(self, self._ctx, self.state)
        self.enterRule(localctx, 4, self.RULE_factor)
        try:
            self.state = 40
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [MathParser.T__4]:
                localctx = MathParser.TrivialParensExprContext(self, localctx)
                self.enterOuterAlt(localctx, 1)
                self.state = 34
                self.match(MathParser.T__4)
                self.state = 35
                localctx.a = self.expr(0)
                self.state = 36
                self.match(MathParser.T__5)
                pass
            elif token in [MathParser.NUM]:
                localctx = MathParser.NumberContext(self, localctx)
                self.enterOuterAlt(localctx, 2)
                self.state = 38
                localctx.a = self.match(MathParser.NUM)
                pass
            elif token in [MathParser.ID]:
                localctx = MathParser.IdentifierContext(self, localctx)
                self.enterOuterAlt(localctx, 3)
                self.state = 39
                localctx.a = self.match(MathParser.ID)
                pass
            else:
                raise NoViableAltException(self)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx



    def sempred(self, localctx:RuleContext, ruleIndex:int, predIndex:int):
        if self._predicates == None:
            self._predicates = dict()
        self._predicates[0] = self.expr_sempred
        self._predicates[1] = self.term_sempred
        pred = self._predicates.get(ruleIndex, None)
        if pred is None:
            raise Exception("No predicate with index:" + str(ruleIndex))
        else:
            return pred(localctx, predIndex)

    def expr_sempred(self, localctx:ExprContext, predIndex:int):
            if predIndex == 0:
                return self.precpred(self._ctx, 3)
         

            if predIndex == 1:
                return self.precpred(self._ctx, 2)
         

    def term_sempred(self, localctx:TermContext, predIndex:int):
            if predIndex == 2:
                return self.precpred(self._ctx, 3)
         

            if predIndex == 3:
                return self.precpred(self._ctx, 2)
         




