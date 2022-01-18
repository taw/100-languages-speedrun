declare option output:method "csv";
declare option output:csv "header=yes";

declare function local:fib($i as xs:integer) as xs:integer {
  if ($i <= 2)
    then 1
    else local:fib($i - 1) + local:fib($i - 2)
};

<csv>{
  for $n in (1 to 30)
  return <record>
    <N>{$n}</N>
    <Fib>{local:fib($n)}</Fib>
  </record>
}</csv>
