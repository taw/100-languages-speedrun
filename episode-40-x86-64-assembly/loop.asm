global start

section .text

start:
  ; rbx = 5
  ; start the loop
  mov rbx, 5
  jmp loop_check

loop_iteration:
  ; inside loop body
  ; write(1, "Hello, World!\n", 14)
  mov rax, 0x2000004
  mov rdi, 1
  mov rsi, hello
  mov rdx, hello_len
  syscall
  ; rbx -= 1
  dec rbx

loop_check:
  ; check if we want to run the loop or not
  ; if (rbx != 0) goto loop_iteration
  cmp rbx, 0
  jne loop_iteration

  ; we're outside the loop now
  ; exit(0)
  mov rax, 0x2000001
  mov rdi, 0
  syscall

section .data
hello:
  db "Hello, World!", 10
hello_len: equ $ - hello
