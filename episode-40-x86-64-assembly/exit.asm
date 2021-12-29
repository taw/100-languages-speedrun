global start

section .text

start:
  ; Tell operating system to exit with code 7
  mov rax, 0x2000001 ; B8 01 00 00 02
  mov rdi, 7         ; BF 07 00 00 00
  syscall            ; 0F 05

section .data
