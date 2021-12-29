global start

section .text

print_number:
  mov rbx, buffer_last_byte
  mov [rbx], byte 10
print_number_loop:
  dec rbx
  mov rdx, 0
  mov rdi, 10
  div rdi
  add rdx, 48
  mov [rbx], dl
  cmp rax, 0
  jne print_number_loop
  mov rax, 0x2000004
  mov rdi, 1
  mov rsi, rbx
  mov rdx, buffer_after
  sub rdx, rsi
  syscall
  ret

start:
  ; r12 = 0
  mov r12, 0

  ; do {
  ;  r12 = r12 + 1; print_number(r12);
  ; } while (r12 < 10);
loop:
  inc r12
  mov rax, r12
  call print_number
  cmp r12, 10
  jl loop

  ; exit(0)
  mov rax, 0x2000001
  mov rdi, 0
  syscall

section .data
buffer:
  db "                        "
buffer_last_byte: equ $ - 1
buffer_after: equ $
