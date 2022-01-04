.global _start

.text
_start:
  /* _exit(7) */
  mov x16, 1
  mov x0, 7
  svc 0x80
