#!/bin/bash
tail -n +5 "$0" | sqlite3
exit $?

with recursive generate_series(value) as (
  select 1
  union all select value+1
  from generate_series
  where value + 1 <= 10
)
select value from generate_series;
