global start

section .text

; number to use goes into rax
print_number:
  ; we'll build the string to print backwards
  ; so 1234 will be built step by step as
  ; "\n" "4\n" "34\n" "234\n" "1234\n"
  mov rbx, buffer_last_byte
  mov [rbx], byte 10

print_number_loop:
  ; make space for another character
  dec rbx

  ; div instruction is more complicated it uses 2 registers for input, and 2 for output
  ; input is always rdx:rax
  ; rdx = input % 10
  ; rax = input / 10
  mov rdx, 0
  mov rdi, 10
  div rdi

  ; we add 48 to turn numbers 0-9 to ascii codes for digits 48-57
  ; then store it in a string
  add rdx, 48
  mov [rbx], dl

  ; if rax is 0, we're done, otherwise continue
  cmp rax, 0
  jne print_number_loop

  ; time to tell operating system what we want to print
  ; we know how many bytes to print by how far rbx moved from end of the buffer
  ; write(1, rbx, buffer_after-rbx)
  mov rax, 0x2000004
  mov rdi, 1
  mov rsi, rbx
  mov rdx, buffer_after
  sub rdx, rsi
  syscall

  ; return to caller
  ret

start:
  ; call print_number(12345678)
  ; it saves return address on stack
  ; when ret is called we return to continue this code
  mov rax, 12345678
  call print_number

  ; exit(0)
  mov rax, 0x2000001
  mov rdi, 0
  syscall

section .data
buffer:
  db "                        "
buffer_last_byte: equ $ - 1
buffer_after: equ $
