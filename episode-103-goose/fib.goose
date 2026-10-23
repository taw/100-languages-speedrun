import os;

fn main() {
  let argv = args();
  if argv.len != 2 {
    write_stderr("Usage: fib <number>\n");
    exit(1);
  }
  let count = parse_int(argv[1]);
  var a = 1;
  var b = 1;
  for i in 1..count+1 {
    print("fib(", i, ")=", a);
    var c = a + b;
    a = b;
    b = c;
  }
}
