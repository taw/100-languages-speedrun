Sitar sitar => dac;

SndBuf fizz => dac;
SndBuf buzz => dac;

"/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/audio/hihat_04.wav" => fizz.read;
"/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/data/snare-chili.wav" => buzz.read;

fun void playFizz() {
  0 => fizz.pos;
  fizz.length() => now;
}

fun void playBuzz() {
  0 => buzz.pos;
  buzz.length() => now;
}

for (1 => int i; i<=100; i++) {
  if (i % 15 == 0) {
    playFizz();
    playBuzz();
  } else if (i % 5 == 0) {
    playBuzz();
  } else if (i % 3 == 0) {
    playFizz();
  } else {
    Std.mtof(20+i) => sitar.freq;
    Math.random2f(0.5, 0.1) => sitar.noteOn;
    0.1::second => now;
  }
}
