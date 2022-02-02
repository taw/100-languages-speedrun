.class public FizzBuzz
.super java/lang/Object

.method public static main([Ljava/lang/String;)V
	.limit locals 1
	.limit stack 2

  iconst_0 ; push value 0 on stack
	istore 0 ; save that to local variable #0

loop:

	iinc 0 1 ; increase local variable #0 by 1

	iload 0   ; push local #0 to stack
	bipush 100 ; push byte value 10 on stack
	if_icmpgt end_loop ; if local #0 > 100, goto end_loop

	iload 0
	bipush 15
	irem
	ifeq fizzbuzz

	iload 0
	iconst_5
	irem
	ifeq buzz

	iload 0
	iconst_3
	irem
	ifeq fizz

print_number:

	getstatic java/lang/System/out Ljava/io/PrintStream; ; push System.out on stack
  iload 0 ; load local #0
	invokevirtual java/io/PrintStream/println(I)V ; print it
	goto loop

fizz:

	getstatic java/lang/System/out Ljava/io/PrintStream;
  ldc "Fizz"
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
	goto loop

buzz:

	getstatic java/lang/System/out Ljava/io/PrintStream;
  ldc "Buzz"
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
	goto loop

fizzbuzz:

	getstatic java/lang/System/out Ljava/io/PrintStream;
  ldc "FizzBuzz"
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
	goto loop

end_loop:

	return

.end method
