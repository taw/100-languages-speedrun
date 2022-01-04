.global _start

.text
_start:
  mov x19, 5

loop:
  /* write(1, "Hello, World!\n", 14) */
  mov x8, 64
  mov x0, 1
  ldr x1, =hello
  mov x2, 14
  svc 0

  /* x19 = x19 - 1 */
  sub x19, x19, 1
  /* if x19 != 0 goto loop for another iteration */
  cmp x19, 0
  b.ne loop

  /* _exit(7) */
  mov x8, 93
  mov x0, 7
  svc 0

.data
hello:
  .ascii "Hello, World!\n"
