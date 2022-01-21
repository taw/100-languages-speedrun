target triple = "x86_64-apple-macosx11.0.0"

define i32 @main() {
  ; There are no "assign constant" instructions in the LLVM IR
  %1 = add i32 13, 0
  %2 = add i32 3, 0
  %3 = add i32 30, 0
  ; Now do the math
  %4 = mul i32 %1, %2
  %5 = add i32 %4, %3
  ret i32 %5
}
