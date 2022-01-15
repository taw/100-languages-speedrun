<?php
  class Vector {
    public $x, $y;
    public function __construct($x, $y) {
      $this->x = $x;
      $this->y = $y;
    }
  }

  function compare($a, $b) {
    $aj = json_encode($a);
    $bj = json_encode($b);
    if ($a === $b) {
      echo "$aj === $bj\n";
    } else {
      echo "$aj !== $bj\n";
    }
    if ($a == $b) {
      echo "$aj == $bj\n";
    } else {
      echo "$aj != $bj\n";
    }
  }

  $a = array(1);
  $b = array(1);
  $c = array("1");

  $d = new Vector(1, 2);
  $e = new Vector(1, 2);

  compare($a, $b);
  compare($a, $c);

  compare($d, $d);
  compare($d, $e);
?>
