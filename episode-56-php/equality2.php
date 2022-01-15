<?php
  function compare($a, $b) {
    if ($a === $b) {
      echo "$a === $b\n";
    } else {
      echo "$a !== $b\n";
    }
  }

  compare("wtf", true);
  compare("wtf", 0);
  compare(true, 0);
  compare("wtf", 1);
  compare(true, 1);
  compare(true, 69);
  compare(false, 0);
  compare(false, array());
  compare(0, array());
?>
