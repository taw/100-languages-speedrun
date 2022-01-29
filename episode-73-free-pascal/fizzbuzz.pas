program FizzBuzz;

var
  n:integer;

begin
  for n := 1 to 100 do
  begin
    if n mod 15 = 0 then
      writeln('FizzBuzz')
    else if n mod 5 = 0 then
      writeln('Buzz')
    else if n mod 3 = 0 then
      writeln('Fizz')
    else
      writeln(n);
  end;
end.
