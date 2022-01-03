.text
.global _start

print_number:
  /* a1 = address of the last character of the buffer (excluding newline) */
  /* a2 = number of characters to print (including newline) */
  /* a3 = 10 */
  lla a1, buffer
  addi a1, a1, 31
  li a2, 2
  li a3, 10

print_number_loop_iteration:
  /* split last digit out */
  /* a4 = a0 / 10 */
  div a4, a0, a3
  /* a5 = a0 % 10 */
  rem a5, a0, a3

  /* store one character at the address */
  addi a5, a5, 48
  sb a5, (a1)

  beqz a4, print_number_loop_done

  mv a0, a4        /* a0 = a0/10, that is remove last digit */
  addi a1, a1, -1  /* move buffer back one character  */
  addi a2, a2, 1   /* increase number of characters to print by one */
  j print_number_loop_iteration

print_number_loop_done:
  /* now we can tell the operating system to print string we built */
  li a7, 64
  li a0, 1
  ecall
  /* and return */
  ret

_start:
  /* set a0 to be argument ad call print_number function */
  li a0, 12345678
  call print_number

  /* Tell the operating system to exit with code 0 */
  li a7, 93
  li a0, 0
  ecall

.data
/* 32 characters + \n; initial contents do not matter */
buffer:
  .ascii "0123456789abcdef0123456789abcdef\n"
