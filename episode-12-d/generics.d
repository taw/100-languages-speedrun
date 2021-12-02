import std.stdio;
import std.format;
import std.math;

class Point(T) {
  T x,y;

  this(T x, T y) {
    this.x = x;
    this.y = y;
  }

  Point add(Point p) {
    return new Point(this.x + p.x, this.y + p.y);
  }

  override string toString() {
    return format("<%s,%s>", x, y);
  }
}

void main() {
  auto a = new Point!int(400, 300);
  auto b = new Point!int(-200, 100);
  auto c = new Point!double(3.5, 7.0);
  auto d = new Point!double(1.5, 3.0);

  writefln("%s + %s = %s", a, b, a.add(b));
  writefln("%s + %s = %s", c, d, c.add(d));
}
