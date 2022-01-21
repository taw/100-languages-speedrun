target triple = "x86_64-apple-macosx11.0.0"

@fnumber = constant [4 x i8] c"%d\0A\00"

define i32 @main() {
start:
  br label %loop

loop:
  %i0 = phi i32 [ 1, %start ], [ %i1, %loop ]

  call i32 (i8*, ...) @printf(
    i8* getelementptr ([4 x i8], [4 x i8]* @fnumber, i64 0, i64 0),
    i32 %i0
  )

  %i1 = add i32 %i0, 1
  %t = icmp sgt i32 %i1, 10

  br i1 %t, label %exit, label %loop

exit:
  ret i32 0
}
declare i32 @printf(i8*, ...)
