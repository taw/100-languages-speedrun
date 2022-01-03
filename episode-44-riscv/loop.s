.text
.global _start
_start:

  /* initialize iteration count to 5 */
  li s0, 5

loop:
  /* print one "Hello, World!\n" */
  li a7, 64
  li a0, 1       /* standard output */
  lla a1, hello  /* address of thing to write */
  li a2, 14      /* amount of data to write */
  ecall

  /* subtract 1, check if s0 reached 0 */
  addi s0, s0, -1
  bnez s0, loop

done:
  li a7, 93
  li a0, 0
  ecall

.data
hello:
  .ascii "Hello World!\n"
