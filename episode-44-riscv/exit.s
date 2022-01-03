.text
.global _start
_start:
  /* Tell the operating system to exit with code 7 */
  li a7, 93
  li a0, 7
  ecall
