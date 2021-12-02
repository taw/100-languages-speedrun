import std.stdio;

int fib(int n) {
  if (n <= 2) {
    return 1;
  }
  return fib(n - 1) + fib(n - 2);
}

void main() {
  for (int i = 1; i <= 40; i++) {
    writeln(fib(i));
  }
}
