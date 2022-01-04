.global _start

.text
_start:
  /* write(1, "Hello, World!\n", 14) */
  mov x8, 64
  mov x0, 1
  ldr x1, =hello
  mov x2, 14
  svc 0

  /* _exit(7) */
  mov x8, 93
  mov x0, 7
  svc 0

.data
hello:
  .ascii "Hello, World!\n"
