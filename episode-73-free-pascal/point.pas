{$mode objfpc}
program PointProgram;

type Point = class
public
  x: integer;
  y: integer;
  constructor Create(_x, _y:integer);
  function ToString: string;
end;

constructor Point.Create(_x, _y:integer);
begin
  x := _x;
  y := _y;
end;

function Point.ToString: string;
var
  xs, ys: string;
begin
  str(x, xs);
  str(y, ys);
  result := '<' + xs + ',' + ys + '>'
end;

operator + (p1, p2: Point): Point;
begin
  result := Point.Create(p1.x + p2.x, p1.y + p2.y)
end;

var
  a: Point;
  b: Point;
  c: Point;

begin
  a := Point.Create(200, 30);
  b := Point.Create(220, 39);
  c := a + b;

  writeln(c.ToString);
end.
