.global _start

.text
print_number:
  /* start with x1 pointing at last character of the buffer */
  /* that's where the digit will go */
  /* x2 is total count of characters to print (including newline) */
  ldr x1, =buffer
  add x1, x1, 31
  mov x2, 2
  mov x3, 10

print_number_loop:
  /* do one digit, shift x0 */
  /* x4 = x0/10 */
  /* x5 = x0%10 */
  sdiv x4, x0, x3
  /* ARM doesn't have a modulo instruction, but it has "multiply and subtract" instruction */
  msub x5, x4, x3, x0
  /* add 48 to convert number to ASCII code, then write to buffer */
  add x5, x5, 48
  /* strb = SToRe Byte */
  /* w5 is bottom 32bits of x5 */
  /* it doesn't really matter, as we're only writing the lowest byte */
  strb w5, [x1]

  /* check if x4 is 0 */
  /* if yes, we're done and can print what we built */
  /* if not, more digits are coming */
  cmp x4, 0
  b.eq print_number_loop_done

  mov x0, x4
  sub x1, x1, 1
  add x2, x2, 1
  b print_number_loop

print_number_loop_done:
  /* output some part of the buffer */
  /* write(1, x1, x2) */
  mov x8, 64
  mov x0, 1
  svc 0
  ret

_start:
  /* load big_number from the constant pool to x0 */
  ldr x0, =big_number
  /* call print_number */
  bl print_number

  /* _exit(7) */
  mov x8, 93
  mov x0, 7
  svc 0

.data
big_number = 12345678901234
/* just put some random stuff in the buffer */
/* we'll overwrite it before printin anyway (except final \n) */
buffer:
  .ascii "0123456789abcdef0123456789abcdef\n"
