<?php
function fib($n) {
  if ($n <= 2) {
    return 1;
  } else {
    return fib($n - 1) + fib($n - 2);
  }
}
for ($n = 1; $n <= 20; $n += 1) {
  echo "fib($n) = " . fib($n) . "\n";
}
?>
