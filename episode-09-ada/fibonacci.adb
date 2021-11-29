with Ada.Text_IO;

procedure Fibonacci is

  function Fib(I: Integer) return Integer is
  begin
    if I <= 2 then
      return 1;
    else
      return Fib(I-1) + Fib(I-2);
    end if;
  end Fib;

begin
  for I in 1..20 loop
    Ada.Text_IO.Put_Line(Integer'Image(Fib(I)));
  end loop;
end Fibonacci;
