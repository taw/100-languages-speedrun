module mod5_16bit(A, Mod);
  input [15:0] A;
  output [4:0] Mod;

  wire [4:0] ModHi;
  wire [4:0] ModLow;

  mod5_8bit Hi(A[15:8], ModHi);
  mod5_8bit Low(A[7:0], ModLow);

  // No need to do shift as (2**8) % 5 == 1
  mod5_add Add(ModHi, ModLow, Mod);
endmodule
