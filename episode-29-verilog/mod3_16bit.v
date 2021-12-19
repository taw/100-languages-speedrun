module mod3_16bit(A, Mod);
  input [15:0] A;
  output [2:0] Mod;

  wire [2:0] ModHi;
  wire [2:0] ModLow;

  mod3_8bit Hi(A[15:8], ModHi);
  mod3_8bit Low(A[7:0], ModLow);

  // No need to do shift as (2**8) % 3 == 1
  mod3_add Add(ModHi, ModLow, Mod);
endmodule
