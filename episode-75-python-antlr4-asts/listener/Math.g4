grammar Math;

expr : a=expr '+' b=term # Add
     | a=expr '-' b=term # Sub
     | a=term # TrivialExpr
     ;

term : a=term '*' b=factor # Mul
     | a=term '/' b=factor # Div
     | a=factor # TrivialTerm
     ;

factor : '(' a=expr ')' # TrivialParensExpr
       | a=NUM # Number
       | a=ID  # Identifier
       ;

ID : [a-zA-Z_] [a-zA-Z0-9_]* ;
NUM : '-'? [0-9]+ ( '.' [0-9]*)?;

WS : [ \t\r\n]+ -> skip; // ignore all whitespace
