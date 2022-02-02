.class public Loop
.super java/lang/Object

.method public static main([Ljava/lang/String;)V
	.limit locals 1
	.limit stack 2

  iconst_1 ; push value 1 on stack
	istore 0 ; save that to local variable #0

loop:

	iload 0   ; push local #0 to stack
	bipush 10 ; push byte value 10 on stack
	if_icmpgt end_loop ; if local #0 > 10, goto end_loop

	getstatic java/lang/System/out Ljava/io/PrintStream; ; push System.out on stack
  iload 0 ; load local #0
	invokevirtual java/io/PrintStream/println(I)V ; print it

	iinc 0 1 ; increase local variable #0 by 1

	goto loop

end_loop:

	return

.end method
