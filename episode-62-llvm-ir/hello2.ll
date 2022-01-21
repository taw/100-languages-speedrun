target triple = "x86_64-apple-macosx11.0.0"

@hello = constant [15 x i8] c"Hello, World!\0A\00"

define i32 @main() {
  call i32 (i8*, ...) @printf(
    i8* getelementptr ([15 x i8], [15 x i8]* @hello, i64 0, i64 0)
  )
  ret i32 0
}
declare i32 @printf(i8*, ...)
