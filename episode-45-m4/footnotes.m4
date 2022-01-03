define(`footnotecounter',`1')dnl
define(`nextfootnotecounter',`define(`footnotecounter',eval(1+footnotecounter))')dnl)
define(`footnote',`[footnotecounter]divert(1)[footnotecounter] $1 nextfootnotecounter
divert')dnl
define(`footnotes',`
Footnotes:
undivert')dnl

Preprocessors footnote("like CPP or M4") are terrible for programming footnote("or pretty much anything else").
footnotes
