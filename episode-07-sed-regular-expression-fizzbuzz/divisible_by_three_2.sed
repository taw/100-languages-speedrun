#!/usr/bin/sed -Ef

# Replace numbers by their reminder by 3, to simplify the regular expressions
s/[369]/0/g
s/[47]/1/g
s/[58]/2/g

# Do the final substitution
s/^((((0?)(0?)*1|1)(2(0?)*1|(0?))*(2(0?)*2|1)|((0?)(0?)*2|2))((1(0?)*1|2)(2(0?)*1|(0?))*(2(0?)*2|1)|(1(0?)*2|(0?)))*((1(0?)*1|2)(2(0?)*1|(0?))*(2(0?)*(0?)|2)|(1(0?)*(0?)|1))|(((0?)(0?)*1|1)(2(0?)*1|(0?))*(2(0?)*(0?)|2)|((0?)(0?)*(0?)|(0?))))$/Divisible by 3/
s/^((((0?)(0?)*1|1)(2(0?)*1|(0?))*(2(0?)*2|1)|((0?)(0?)*2|2))((1(0?)*1|2)(2(0?)*1|(0?))*(2(0?)*2|1)|(1(0?)*2|(0?)))*((1(0?)*1|2)(2(0?)*1|(0?))*(2(0?)*1|(0?))|(1(0?)*1|2))|(((0?)(0?)*1|1)(2(0?)*1|(0?))*(2(0?)*1|(0?))|((0?)(0?)*1|1)))$/Remainder 1/
s/^((((0?)(0?)*1|1)(2(0?)*1|(0?))*(2(0?)*2|1)|((0?)(0?)*2|2))((1(0?)*1|2)(2(0?)*1|(0?))*(2(0?)*2|1)|(1(0?)*2|(0?)))*((1(0?)*1|2)(2(0?)*1|(0?))*(2(0?)*2|1)|(1(0?)*2|(0?)))|(((0?)(0?)*1|1)(2(0?)*1|(0?))*(2(0?)*2|1)|((0?)(0?)*2|2)))$/Remainder 2/
