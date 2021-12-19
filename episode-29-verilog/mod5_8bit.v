module mod5_8bit(A, Mod);
  input [7:0] A;
  output [4:0] Mod;

  wire [4:0] ModHi;
  wire [4:0] ModLow;

  mod5_4bit Hi(A[7:4], ModHi);
  mod5_4bit Low(A[3:0], ModLow);

  // No need to do shift as (2**4) % 5 == 1
  mod5_add Add(ModHi, ModLow, Mod);
endmodule
