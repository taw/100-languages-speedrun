<?php
for ($n = 1; $n <= 100; $n += 1) {
  if ($n % 15 == 0) {
    echo "FizzBuzz\n";
  } else if ($n % 5 == 0) {
    echo "Buzz\n";
  } else if ($n % 3 == 0) {
    echo "Fizz\n";
  } else {
    echo "$n\n";
  }
}
?>
