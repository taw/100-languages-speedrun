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
        buf.write("/\4\2\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\3\2\3\2\3\2")
        buf.write("\3\2\3\2\3\2\7\2\23\n\2\f\2\16\2\26\13\2\3\3\3\3\3\3\3")
        buf.write("\3\3\3\3\3\7\3\36\n\3\f\3\16\3!\13\3\3\4\3\4\3\4\3\4\3")
        buf.write("\4\3\4\5\4)\n\4\3\5\3\5\3\6\3\6\3\6\2\4\2\4\7\2\4\6\b")
        buf.write("\n\2\4\3\2\3\4\3\2\5\6\2-\2\f\3\2\2\2\4\27\3\2\2\2\6(")
        buf.write("\3\2\2\2\b*\3\2\2\2\n,\3\2\2\2\f\r\b\2\1\2\r\16\5\4\3")
        buf.write("\2\16\24\3\2\2\2\17\20\f\4\2\2\20\21\t\2\2\2\21\23\5\4")
        buf.write("\3\2\22\17\3\2\2\2\23\26\3\2\2\2\24\22\3\2\2\2\24\25\3")
        buf.write("\2\2\2\25\3\3\2\2\2\26\24\3\2\2\2\27\30\b\3\1\2\30\31")
        buf.write("\5\6\4\2\31\37\3\2\2\2\32\33\f\4\2\2\33\34\t\3\2\2\34")
        buf.write("\36\5\6\4\2\35\32\3\2\2\2\36!\3\2\2\2\37\35\3\2\2\2\37")
        buf.write(" \3\2\2\2 \5\3\2\2\2!\37\3\2\2\2\"#\7\7\2\2#$\5\2\2\2")
        buf.write("$%\7\b\2\2%)\3\2\2\2&)\5\b\5\2\')\5\n\6\2(\"\3\2\2\2(")
        buf.write("&\3\2\2\2(\'\3\2\2\2)\7\3\2\2\2*+\7\n\2\2+\t\3\2\2\2,")
        buf.write("-\7\t\2\2-\13\3\2\2\2\5\24\37(")
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
    RULE_number = 3
    RULE_identifier = 4

    ruleNames =  [ "expr", "term", "factor", "number", "identifier" ]

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

        def term(self):
            return self.getTypedRuleContext(MathParser.TermContext,0)


        def expr(self):
            return self.getTypedRuleContext(MathParser.ExprContext,0)


        def getRuleIndex(self):
            return MathParser.RULE_expr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterExpr" ):
                listener.enterExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitExpr" ):
                listener.exitExpr(self)



    def expr(self, _p:int=0):
        _parentctx = self._ctx
        _parentState = self.state
        localctx = MathParser.ExprContext(self, self._ctx, _parentState)
        _prevctx = localctx
        _startState = 0
        self.enterRecursionRule(localctx, 0, self.RULE_expr, _p)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 11
            self.term(0)
            self._ctx.stop = self._input.LT(-1)
            self.state = 18
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,0,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    localctx = MathParser.ExprContext(self, _parentctx, _parentState)
                    self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                    self.state = 13
                    if not self.precpred(self._ctx, 2):
                        from antlr4.error.Errors import FailedPredicateException
                        raise FailedPredicateException(self, "self.precpred(self._ctx, 2)")
                    self.state = 14
                    _la = self._input.LA(1)
                    if not(_la==MathParser.T__0 or _la==MathParser.T__1):
                        self._errHandler.recoverInline(self)
                    else:
                        self._errHandler.reportMatch(self)
                        self.consume()
                    self.state = 15
                    self.term(0) 
                self.state = 20
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,0,self._ctx)

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

        def factor(self):
            return self.getTypedRuleContext(MathParser.FactorContext,0)


        def term(self):
            return self.getTypedRuleContext(MathParser.TermContext,0)


        def getRuleIndex(self):
            return MathParser.RULE_term

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterTerm" ):
                listener.enterTerm(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitTerm" ):
                listener.exitTerm(self)



    def term(self, _p:int=0):
        _parentctx = self._ctx
        _parentState = self.state
        localctx = MathParser.TermContext(self, self._ctx, _parentState)
        _prevctx = localctx
        _startState = 2
        self.enterRecursionRule(localctx, 2, self.RULE_term, _p)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 22
            self.factor()
            self._ctx.stop = self._input.LT(-1)
            self.state = 29
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,1,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    localctx = MathParser.TermContext(self, _parentctx, _parentState)
                    self.pushNewRecursionContext(localctx, _startState, self.RULE_term)
                    self.state = 24
                    if not self.precpred(self._ctx, 2):
                        from antlr4.error.Errors import FailedPredicateException
                        raise FailedPredicateException(self, "self.precpred(self._ctx, 2)")
                    self.state = 25
                    _la = self._input.LA(1)
                    if not(_la==MathParser.T__2 or _la==MathParser.T__3):
                        self._errHandler.recoverInline(self)
                    else:
                        self._errHandler.reportMatch(self)
                        self.consume()
                    self.state = 26
                    self.factor() 
                self.state = 31
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,1,self._ctx)

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

        def expr(self):
            return self.getTypedRuleContext(MathParser.ExprContext,0)


        def number(self):
            return self.getTypedRuleContext(MathParser.NumberContext,0)


        def identifier(self):
            return self.getTypedRuleContext(MathParser.IdentifierContext,0)


        def getRuleIndex(self):
            return MathParser.RULE_factor

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterFactor" ):
                listener.enterFactor(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitFactor" ):
                listener.exitFactor(self)




    def factor(self):

        localctx = MathParser.FactorContext(self, self._ctx, self.state)
        self.enterRule(localctx, 4, self.RULE_factor)
        try:
            self.state = 38
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [MathParser.T__4]:
                self.enterOuterAlt(localctx, 1)
                self.state = 32
                self.match(MathParser.T__4)
                self.state = 33
                self.expr(0)
                self.state = 34
                self.match(MathParser.T__5)
                pass
            elif token in [MathParser.NUM]:
                self.enterOuterAlt(localctx, 2)
                self.state = 36
                self.number()
                pass
            elif token in [MathParser.ID]:
                self.enterOuterAlt(localctx, 3)
                self.state = 37
                self.identifier()
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


    class NumberContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def NUM(self):
            return self.getToken(MathParser.NUM, 0)

        def getRuleIndex(self):
            return MathParser.RULE_number

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterNumber" ):
                listener.enterNumber(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitNumber" ):
                listener.exitNumber(self)




    def number(self):

        localctx = MathParser.NumberContext(self, self._ctx, self.state)
        self.enterRule(localctx, 6, self.RULE_number)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 40
            self.match(MathParser.NUM)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class IdentifierContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def ID(self):
            return self.getToken(MathParser.ID, 0)

        def getRuleIndex(self):
            return MathParser.RULE_identifier

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterIdentifier" ):
                listener.enterIdentifier(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitIdentifier" ):
                listener.exitIdentifier(self)




    def identifier(self):

        localctx = MathParser.IdentifierContext(self, self._ctx, self.state)
        self.enterRule(localctx, 8, self.RULE_identifier)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 42
            self.match(MathParser.ID)
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
                return self.precpred(self._ctx, 2)
         

    def term_sempred(self, localctx:TermContext, predIndex:int):
            if predIndex == 1:
                return self.precpred(self._ctx, 2)
         




