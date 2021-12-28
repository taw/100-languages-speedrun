#!/bin/bash
tail -n +5 "$0" | sqlite3
exit $?

with recursive generate_series(value) as (
  select 1
  union all select value+1
  from generate_series
  where value + 1 <= 100
)
select
  case
    when value % 15 = 0 then 'FizzBuzz'
    when value % 5 = 0 then 'Buzz'
    when value % 3 = 0 then 'Fizz'
    else value
  end
from generate_series;
