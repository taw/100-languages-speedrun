#!/usr/bin/env pwsh

function fib($n) {
  if ($n -le 2) {
    1
  } else {
    $a = fib($n-1)
    $b = fib($n-2)
    $a + $b
  }
}

1..20 | ForEach-Object {
  Write-Output "fib($_)=$(fib($_))"
}
