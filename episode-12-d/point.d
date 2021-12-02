import std.stdio;
import std.format;

class Point {
  float x,y;

  this(float x, float y) {
    this.x = x;
    this.y = y;
  }

  Point add(Point p) {
    return new Point(this.x + p.x, this.y + p.y);
  }

  override string toString() {
    return format("<%f,%f>", x, y);
  }
}

void main() {
  auto a = new Point(2.0, 3.0);
  auto b = new Point(3.5, 7.0);

  writefln("%s + %s = %s", a, b, a.add(b));
}
