.global _start

.text
print_number:
  ldr x1, =buffer
  add x1, x1, 31
  mov x2, 2
  mov x3, 10

print_number_loop:
  sdiv x4, x0, x3
  msub x5, x4, x3, x0
  add x5, x5, 48
  strb w5, [x1]

  cmp x4, 0
  b.eq print_number_loop_done

  mov x0, x4
  sub x1, x1, 1
  add x2, x2, 1
  b print_number_loop

print_number_loop_done:
  mov x8, 64
  mov x0, 1
  svc 0
  ret

_start:

  mov x19, 1

loop:
  mov x0, x19
  bl print_number

  add x19, x19, 1
  cmp x19, 20
  b.le loop

  /* _exit(7) */
  mov x8, 93
  mov x0, 7
  svc 0

.data
/* just put some random stuff in the buffer */
/* we'll overwrite it before printin anyway (except final \n) */
buffer:
  .ascii "0123456789abcdef0123456789abcdef\n"
