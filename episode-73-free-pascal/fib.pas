program Fibonacci;

function fib(n:integer):integer;
begin
  if n<=2 then
    fib := 1
  else
    fib := fib(n-1) + fib(n-2);
end;

var
  n:integer;

begin
  for n := 1 to 20 do
  begin
    writeln('fib(', n, ')=', fib(n));
  end;
end.
