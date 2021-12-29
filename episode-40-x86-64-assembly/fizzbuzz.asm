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

loop:
  ; r12 += 1
  inc r12

  ; if (r12 % 3 == 0) go to divides_by_three
  mov rdx, 0
  mov rax, r12
  mov rdi, 3
  div rdi
  cmp rdx, 0
  je divides_by_3

  ; if (r12 % 3 == 0) go to divides_by_five
  mov rdx, 0
  mov rax, r12
  mov rdi, 5
  div rdi
  cmp rdx, 0
  je divides_only_by_5

does_not_divide_by_3_or_5:
  mov rax, r12
  call print_number
  jmp loop_continue

divides_only_by_5:
  mov rax, 0x2000004
  mov rdi, 1
  mov rsi, buzz
  mov rdx, buzz_len
  syscall
  jmp loop_continue

divides_by_3:
  ; if (r12 % 3 == 0) go to divides_by_five
  mov rdx, 0
  mov rax, r12
  mov rdi, 5
  div rdi
  cmp rdx, 0
  je divides_by_3_and_5

divides_only_3:
  mov rax, 0x2000004
  mov rdi, 1
  mov rsi, fizz
  mov rdx, fizz_len
  syscall
  jmp loop_continue

divides_by_3_and_5:
  mov rax, 0x2000004
  mov rdi, 1
  mov rsi, fizzbuzz
  mov rdx, fizzbuzz_len
  syscall
  jmp loop_continue

loop_continue:
  cmp r12, iterations
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

fizz:
  db "Fizz", 10
fizz_len: equ $ - fizz

buzz:
  db "Buzz", 10
buzz_len: equ $ - buzz

fizzbuzz:
  db "FizzBuzz", 10
fizzbuzz_len: equ $ - fizzbuzz

iterations: equ 100
