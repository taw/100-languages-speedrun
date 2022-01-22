SinOsc sine_wave => dac;

for (0 => int i; i<=12*5; i++) {
  Math.pow(2.0, i/12.0) * 55.0 => float freq;
  freq => sine_wave.freq;
  <<<"Playing frequency", freq>>>;
  0.1::second => now;
}
