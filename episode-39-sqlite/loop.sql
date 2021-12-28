#!/bin/bash
tail -n +5 "$0" | sqlite3
exit $?

select 1 union
select 2 union
select 3 union
select 4 union
select 5 union
select 6 union
select 7 union
select 8 union
select 9 union
select 10;
