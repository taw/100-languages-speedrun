.text
.global _start
_start:
  /* Tell the operating system to write "Hello, World!\n" to stadard output */
  li a7, 64
  li a0, 1       /* standard output */
  lla a1, hello  /* address of thing to write */
  li a2, 14      /* amount of data to write */
  ecall

  /* Tell the operating system to exit with code 0 */
  li a7, 93
  li a0, 0
  ecall

.data
hello:
  .ascii "Hello World!\n"
