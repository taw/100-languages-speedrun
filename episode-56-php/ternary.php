<?php
  function compare($a, $b) {
    echo ($a > $b) ? "$a > $b" : ($a < $b) ? "$a < $b" : "$a == $b";
    echo "\n";
  }

  compare(420, 69);
  compare(69, 69);
  compare(69, 420);
?>
