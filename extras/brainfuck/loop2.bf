# set cell 2 to 48 (ASCII 0)
>++++++
[>++++++++<-]

# copy it to cells 0 and 1
# cell 0 will be high digit
# cell 1 will be low digit
>[<+<+>>-]

# set cell 2 to 10 (newline)
++++++++++

# keep cell 3 as 0 for convenience or maybe not i dont know FIXME
# set cells 4 to 9 (countdowns)

>
>++++++++++

# set cell 5 to 120

>>++++++++++
[-<++++++++++++>]<

# Loop using main counter
[
# bump low digit
<<<<+>>-

# if overflows bump next digit

[
<<<+>>>
++++++++++
]
>>




>>

# print number
<<<<<.>.>.

>>>
-
]
