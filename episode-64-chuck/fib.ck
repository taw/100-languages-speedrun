class FibEvent extends Event {
  int argument;
  int result;
}

fun void reporter(string name, FibEvent e) {
  while(true) {
    // wait for event
    e => now;
    // report what we got the data
    <<<name, "reporting that fib of", e.argument, "is", e.result>>>;
  }
}

// the event
FibEvent e;

// spawn two listeners
spork ~ reporter("a", e);
spork ~ reporter("b", e);

1 => int a;
1 => int b;
1 => int i;

while(true) {
  0.1::second => now;

  i => e.argument;
  a => e.result;
  e.signal(); // send it to one of the reporters

  a + b => int c;
  b => a;
  c => b;
  i + 1 => i;
}
