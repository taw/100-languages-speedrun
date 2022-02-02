.class public Person
.super java/lang/Object

.field public name Ljava/lang/String;
.field public surname Ljava/lang/String;

.method public <init>(Ljava/lang/String;Ljava/lang/String;)V
  .limit locals 4
  .limit stack 4
  ; local 0 - this
  ; local 1 - argument name
  ; local 2 - argument surname

  ; call super this.<init>();
  aload_0
  invokespecial java/lang/Object/<init>()V

  ; this.name = argument_name
  aload_0
  aload_1
  putfield Person/name Ljava/lang/String;

  ; this.surname = argument_surname
  aload_0
  aload_2
  putfield Person/surname Ljava/lang/String;

  return
.end method

.method public toString()Ljava/lang/String;
  .limit locals 4
  .limit stack 4
  ; local 0 - this

  ; push this.name
  aload_0
  getfield Person/name Ljava/lang/String;

  ; push " "
  ldc " "

  ; call String.concat, getting: this.name + " "
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;

  ; push this.surname
  aload_0
  getfield Person/surname Ljava/lang/String;

  ; call String.concat, getting: this.name + " " + this.surname
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;

  areturn
.end method

.method public static main([Ljava/lang/String;)V
	.limit locals 4
	.limit stack 4

  ; local Person a = new Person("Alice", "Smith")
  new Person
  dup
  ldc "Alice"
  ldc "Smith"
  invokespecial Person/<init>(Ljava/lang/String;Ljava/lang/String;)V
  astore_1

	getstatic java/lang/System/out Ljava/io/PrintStream;

  ; push a.toString()
  aload_1
  invokevirtual Person/toString()Ljava/lang/String;

	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

	return

.end method
