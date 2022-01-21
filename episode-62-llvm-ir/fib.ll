target triple = "x86_64-apple-macosx11.0.0"

@format = constant [14 x i8] c"fib(%d) = %d\0A\00"

define i32 @fib(i32 %a) {
start_fib:
  ; if (a <= 2) { fib_small } else { fib_big }
  %t = icmp sle i32 %a, 2
  br i1 %t, label %fib_small, label %fib_big

fib_big:
  ; f1 = fib(a-1)
  %a1 = sub i32 %a, 1
  %f1 = call i32 @fib(i32 %a1)

  ; f2 = fib(a-1)
  %a2 = sub i32 %a, 2
  %f2 = call i32 @fib(i32 %a2)

  ; return f1 + f2
  %e = add i32 %f1, %f2
  ret i32 %e

fib_small:
  ; return 1
  ret i32 1
}

define i32 @main() {
start:
  br label %loop

loop:
  %i0 = phi i32 [ 1, %start ], [ %i1, %loop ]
  %j = call i32 @fib(i32 %i0)

  call i32 (i8*, ...) @printf(
    i8* getelementptr ([14 x i8], [14 x i8]* @format, i64 0, i64 0),
    i32 %i0,
    i32 %j
  )

  %i1 = add i32 %i0, 1
  %t = icmp sgt i32 %i1, 20

  br i1 %t, label %exit, label %loop

exit:
  ret i32 0
}
declare i32 @printf(i8*, ...)
