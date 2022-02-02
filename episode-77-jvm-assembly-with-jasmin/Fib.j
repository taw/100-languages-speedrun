.class public Fib
.super java/lang/Object

.method public static fib(I)I
	.limit stack 3
  iload_0
	iconst_2
	if_icmple small_fib

big_fib:
	iload_0
	iconst_1
	isub
	invokestatic Fib/fib(I)I  ; push fib(i-1) to stack

	iload_0
	iconst_2
	isub
	invokestatic Fib/fib(I)I  ; push fib(i-2) to stack

	iadd
	ireturn ; return fib(i-1) + fib(i-2)

small_fib:
	iconst_1
	ireturn ; return 1
.end method

.method public static main([Ljava/lang/String;)V
	.limit locals 1
	.limit stack 2

  iconst_1 ; push value 1 on stack
	istore 0 ; save that to local variable #0

loop:

	iload 0   ; push local #0 to stack
	bipush 30 ; push byte value 10 on stack
	if_icmpgt end_loop ; if local #0 > 10, goto end_loop

	getstatic java/lang/System/out Ljava/io/PrintStream;
	ldc "fib("
	invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V ; print "fib("

	getstatic java/lang/System/out Ljava/io/PrintStream;
  iload 0 ; load local #0
	invokevirtual java/io/PrintStream/print(I)V ; print i

	getstatic java/lang/System/out Ljava/io/PrintStream;
	ldc ")="
	invokevirtual java/io/PrintStream/print(Ljava/lang/String;)V ; print ")="

	getstatic java/lang/System/out Ljava/io/PrintStream; ; push System.out on stack
  iload 0 ; load local #0
	invokestatic Fib/fib(I)I
	invokevirtual java/io/PrintStream/println(I)V ; print fib(i)

	iinc 0 1 ; increase local variable #0 by 1

	goto loop

end_loop:

	return

.end method
