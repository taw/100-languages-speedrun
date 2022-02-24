# set cell 2 to 48 (ASCII 0)
>++++++
[>++++++++<-]

# copy it to cells 0 and 1
# cell 0 will be high digit
# cell 1 will be low digit
>[<+<+>>-]

# set cell 2 to 10 (newline)
++++++++++

# set cells 3 and 4 to 10 (countdowns)

>++++++++++
>++++++++++

<
[
>
[
# print current value
<<<<.>.>.

# bump lower digit
<+>>>-
]

# big digit goes up and all counters reset
++++++++++
<-
<<----------
<+
>>>
]
