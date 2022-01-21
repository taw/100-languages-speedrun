target triple = "x86_64-apple-macosx11.0.0"

@fizz = constant [6 x i8] c"Fizz\0A\00"
@buzz = constant [6 x i8] c"Buzz\0A\00"
@fizzbuzz = constant [10 x i8] c"FizzBuzz\0A\00"
@fnumber = constant [4 x i8] c"%d\0A\00"

define i32 @main() {
start:
  br label %loop

loop:
  %i0 = phi i32 [ 1, %start ], [ %i1, %loop_end ]
  %m15 = srem i32 %i0, 15
  %e15 = icmp eq i32 %m15, 0
  br i1 %e15, label %fizzbuzz, label %not_fizzbuzz

fizzbuzz:
  call i32 (i8*, ...) @printf(
    i8* getelementptr ([10 x i8], [10 x i8]* @fizzbuzz, i64 0, i64 0)
  )
  br label %loop_end

not_fizzbuzz:
  %m5 = srem i32 %i0, 5
  %e5 = icmp eq i32 %m5, 0
  br i1 %e5, label %buzz, label %not_buzz

buzz:
  call i32 (i8*, ...) @printf(
    i8* getelementptr ([6 x i8], [6 x i8]* @buzz, i64 0, i64 0)
  )
  br label %loop_end

not_buzz:
  %m3 = srem i32 %i0, 3
  %e3 = icmp eq i32 %m3, 0
  br i1 %e3, label %fizz, label %not_fizz

fizz:
  call i32 (i8*, ...) @printf(
    i8* getelementptr ([6 x i8], [6 x i8]* @fizz, i64 0, i64 0)
  )
  br label %loop_end

not_fizz:
  call i32 (i8*, ...) @printf(
    i8* getelementptr ([4 x i8], [4 x i8]* @fnumber, i64 0, i64 0),
    i32 %i0
  )
  br label %loop_end

loop_end:
  %i1 = add i32 %i0, 1
  %t = icmp sgt i32 %i1, 100

  br i1 %t, label %exit, label %loop

exit:
  ret i32 0
}
declare i32 @printf(i8*, ...)
