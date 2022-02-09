#!/usr/bin/env pwsh

function numbers {
  1
  2
  Write-Output 3
  Write-Host 4
  Write-Error 5
  6
}

Write-Output "Loop:"
numbers | ForEach-Object{ Write-Output "Got $_" }

Write-Output "Capturing:"
$x = numbers
Write-Output "We got: [$x]"
