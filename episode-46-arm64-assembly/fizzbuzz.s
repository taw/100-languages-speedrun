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
  mov x20, 3
  mov x21, 5

loop:
  /* x5 = x19 % 3 */
  sdiv x4, x19, x20
  msub x5, x4, x20, x19
  /* is the remainder zero? */
  cmp x5, 0
  b.eq divides_by_three

does_not_divide_by_three:
  /* x5 = x19 % 5 */
  sdiv x4, x19, x21
  msub x5, x4, x21, x19
  /* is the remainder zero? */
  cmp x5, 0
  b.eq divides_by_five_only

divides_by_neither:
  /* print_number(x19) */
  mov x0, x19
  bl print_number
  b continue_loop

divides_by_three:
  /* x5 = x19 % 5 */
  sdiv x4, x19, x21
  msub x5, x4, x21, x19
  /* is the remainder zero? */
  cmp x5, 0
  b.eq divides_by_three_and_five

divides_by_three_only:
  /* write(1, "Fizz", 5) */
  mov x8, 64
  mov x0, 1
  ldr x1, =fizz
  mov x2, 5
  svc 0
  b continue_loop

divides_by_five_only:
  /* write(1, "Buzz", 5) */
  mov x8, 64
  mov x0, 1
  ldr x1, =buzz
  mov x2, 5
  svc 0
  b continue_loop

divides_by_three_and_five:
  /* write(1, "FizzBuzz", 9) */
  mov x8, 64
  mov x0, 1
  ldr x1, =fizzbuzz
  mov x2, 9
  svc 0

continue_loop:
  add x19, x19, 1
  cmp x19, 100
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
fizz:
  .ascii "Fizz\n"
buzz:
  .ascii "Buzz\n"
fizzbuzz:
  .ascii "FizzBuzz\n"
