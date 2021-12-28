#!/bin/bash
tail -n +5 "$0" | sqlite3
exit $?

with
csv(data) as (
  select 'first name,last name,favorite language
Alice,Smith,Ruby
Bob,Smith,Python
Charlie,Brown,JavaScript
Daniel,Clark,PHP
Ed,Jones,C
Frank,Smith,HTML
Gary,Johnson,CSS
Heather,Williams,JavaScript
Ivan,Smith,Ruby
Jack,Jones,JavaScript
John,Brown,PHP
Karen,Clark,JavaScript
Larry,Jones,HTML
Mike,Williams,CSS
Nathan,Smith,Ruby
Oscar,Brown,JavaScript
Peter,Clark,PHP
Quinn,Jones,JavaScript
Ralph,Smith,HTML
Sally,Williams,CSS
Tom,Smith,Ruby
Will,Jones,JavaScript
Xavier,Brown,PHP
Yvonne,Clark,JavaScript
Zachary,Jones,HTML
'
),
lines(lineno, line) as (
  with recursive split(lineno, line, str) as (
    select 0, null, data from csv
    union all
    select
      lineno + 1,
      substr(str, 0, instr(str, char(10))),
      substr(str, instr(str, char(10))+1)
      from split where str != ''
  ) select lineno, line from split where line is not null
),
cells(lineno, colno, cell) as (
  with recursive split(lineno, colno, cell, str) as (
    select lineno, 0, null, (line||',') from lines
    union all
    select
      lineno,
      colno + 1,
      substr(str, 0, instr(str, ',')),
      substr(str, instr(str, ',')+1)
      from split where str != ''
  ) select lineno, colno, cell from split where cell is not null
),
cellvals(lineno, k, v) as (
  select c.lineno, h.cell, c.cell from cells h
  inner join cells c
  on c.colno = h.colno and h.lineno = 1 and c.lineno != 1
),
preferences(full_name, language) as (
  select fn.v||' '||ln.v, fl.v
  from cellvals fn
  inner join cellvals ln
  on fn.k='first name' and ln.k='last name' and fn.lineno = ln.lineno
  inner join cellvals fl
  on fl.k='favorite language' and fn.lineno = fl.lineno
)
select language || ',' || group_concat(full_name, ',') from preferences group by language;
