#!/bin/bash
tail -n +5 "$0" | sqlite3
exit $?

with recursive fib(a, b, i) as (
  select 1, 1, 1
  union all
  select b, a + b, i + 1
  from fib
  where i + 1 <= 100
)
select a from fib;
