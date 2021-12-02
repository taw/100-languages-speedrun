import std.stdio;
import std.conv;

string fizzbuzz(int n) {
  if (n % 15 == 0) {
    return "FizzBuzz";
  } else if (n % 3 == 0) {
    return "Fizz";
  } else if (n % 5 == 0) {
    return "Buzz";
  } else {
    return to!string(n);
  }
}

void main() {
    for (int i = 1; i <= 100; i++) {
    writeln(fizzbuzz(i));
  }
}
