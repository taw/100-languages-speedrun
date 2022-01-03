define(`oddeven',`ifelse(eval($1%2),0,`$1 is even',`$1 is odd')')dnl
oddeven(69)
oddeven(420)
