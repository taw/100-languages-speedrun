module mod5_4bit(A, Mod);
  input [3:0] A;
  output [4:0] Mod;

  wire [4:0] ModHi;
  wire [4:0] ModHi4;
  wire [4:0] ModLow;

  mod5_2bit Hi(A[3:2], ModHi);
  mod5_2bit Low(A[1:0], ModLow);

  // We need to do shift as (2**2) % 5 == 4
  // Notice that if we do this reshuffle twice,
  // everything will be back where it started
  // That's why 8bit and bigger components don't
  // need to do any reshuffle.
  // mod5_8bit should do this 2x, but that's same as not doing it.
  // mod5_16bit should do this 4x, but that's same as not doing it etc.
  assign ModHi4[0] = ModHi[0]; // 0 * 4 = 0  => 0
  assign ModHi4[4] = ModHi[1]; // 1 * 4 = 4  => 4
  assign ModHi4[3] = ModHi[2]; // 2 * 4 = 8  => 3
  assign ModHi4[2] = ModHi[3]; // 3 * 4 = 12 => 2
  assign ModHi4[1] = ModHi[4]; // 4 * 4 = 16 => 1

  mod5_add Add(ModHi4, ModLow, Mod);
endmodule
