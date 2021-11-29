with Ada.Text_IO;

procedure FizzBuzz is
  function LStrip(S: String) return String is
  begin
    if S(S'First) = ' ' then
      return S(S'First+1 .. S'Last);
    else
      return S;
    end if;
  end LStrip;

begin
  for I in 1..100 loop
    if I mod 3 = 0 and I mod 5 = 0 then
      Ada.Text_IO.Put_Line("FizzBuzz");
    elsif I mod 3 = 0 then
      Ada.Text_IO.Put_Line("Fizz");
    elsif I mod 5 = 0 then
      Ada.Text_IO.Put_Line("Buzz");
    else
      Ada.Text_IO.Put_Line(LStrip(Integer'Image(I)));
    end if;
  end loop;
end FizzBuzz;
