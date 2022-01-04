.global _start

.text
_start:
  /* _exit(7) */
  mov x8, 93
  mov x0, 7
  svc 0
