Sitar sitar => dac;

while(true) {
  Math.random2(60, 80) => float note;
  Std.mtof(note) => sitar.freq;
  Math.random2f(0.5, 0.1) => sitar.noteOn;

  <<<"Playing note", note>>>;
  0.2::second => now;
}
