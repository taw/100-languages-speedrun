module mod3_8bit(A, Mod);
  input [7:0] A;
  output [2:0] Mod;

  wire [2:0] ModHi;
  wire [2:0] ModLow;

  mod3_4bit Hi(A[7:4], ModHi);
  mod3_4bit Low(A[3:0], ModLow);

  // No need to do shift as (2**4) % 3 == 1
  mod3_add Add(ModHi, ModLow, Mod);
endmodule
