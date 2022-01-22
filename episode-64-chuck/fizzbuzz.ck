for (1 => int i; i<=100; i++) {
  if (i % 15 == 0) {
    chout <= "FizzBuzz" <= IO.newline();
  } else if (i % 5 == 0) {
    chout <= "Buzz" <= IO.newline();
  } else if (i % 3 == 0) {
    chout <= "Fizz" <= IO.newline();
  } else {
    chout <= i <= IO.newline();
  }
}
