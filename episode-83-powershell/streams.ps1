#!/usr/bin/env pwsh

function numbers {
  10
  20
  30
}

numbers | ForEach-Object { $_ + 400 }

numbers | Join-String -Separator ","

1..10 | Join-String -Separator ","
