grammar Math;

expr : expr ('+' | '-') term
     | term;

term : term ('*' | '/') factor
     | factor;

factor : '(' expr ')'
       | number
       | identifier;

number: NUM;
identifier: ID;

ID : [a-zA-Z_] [a-zA-Z0-9_]* ;
NUM : '-'? [0-9]+ ( '.' [0-9]*)?;

WS : [ \t\r\n]+ -> skip; // ignore all whitespace
