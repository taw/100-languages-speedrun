global start

section .text

start:
  ; write(1, "Hello, World!\n", 14)
  mov rax, 0x2000004
  mov rdi, 1
  mov rsi, hello
  mov rdx, 14
  syscall

  ; exit(0)
  mov rax, 0x2000001
  mov rdi, 0
  syscall

section .data
hello:
  db "Hello, World!", 10
