[
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/special/geetar.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter8/audio/kick_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter8/audio/hihat_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter9/DrumMachine/audio/snare_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter9/DrumMachine/audio/cowbell_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter9/DrumMachine/audio/kick_04.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter9/DrumMachine/audio/clap_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter9/DrumMachine/audio/hihat_02.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/audio/snare_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/audio/snare_03.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/audio/snare_02.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/audio/cowbell_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/audio/click_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/audio/click_02.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/audio/stereo_fx_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/audio/kick_04.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/audio/stereo_fx_03.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/audio/kick_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/audio/clap_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/audio/hihat_04.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/audio/hihat_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/audio/hihat_02.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter5/audio/snare_03.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter5/audio/stereo_fx_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter5/audio/kick_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter4/audio/snare_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter4/audio/snare_03.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter4/audio/snare_02.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter4/audio/cowbell_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter4/audio/click_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter4/audio/click_02.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter4/audio/stereo_fx_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter4/audio/stereo_fx_03.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter4/audio/kick_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter4/audio/clap_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter4/audio/hihat_04.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/book/digital-artists/chapter4/audio/hihat_01.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/data/hihat.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/data/hihat-open.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/data/kick.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/data/snare.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/data/snare-chili.wav",
  "/usr/local/Cellar/chuck/1.4.1.0/share/chuck/examples/data/snare-hop.wav"
] @=> string files[];

SndBuf buf => dac;

for(0 => int i; i<files.size(); i++) {
  // read a .wav
  files[i] => buf.read;
  // start at the beginning
  0 => buf.pos;
  <<<i, files[i]>>>;
  // wait however long buf is, to let it finish playing
  buf.length() => now;
}
