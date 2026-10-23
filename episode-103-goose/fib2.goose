import os;
import bigint;

fn main() {
  let argv = args();
  if argv.len != 2 {
    write_stderr("Usage: fib <number>\n");
    exit(1);
  }
  let count = parse_int(argv[1]);
  let one : u8[] = "1";
  var nums : BigInt[>..] = [];

  var a : BigInt& = nums.push(bigint_new(one));
  var b : BigInt& = nums.push(bigint_new(one));

  for i in 1..count+1 {
    print("fib(", i, ")=", bigint_to_s(a));
    let c : BigInt& = nums.push(bigint_add(a, b));
    a .= b;
    b .= c;
  }
}
