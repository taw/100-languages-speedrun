module mod3_32bit(A, Mod);
  input [31:0] A;
  output [2:0] Mod;

  wire [2:0] ModHi;
  wire [2:0] ModLow;

  mod3_16bit Hi(A[31:16], ModHi);
  mod3_16bit Low(A[15:0], ModLow);

  // No need to do shift as (2**16) % 3 == 1
  mod3_add Add(ModHi, ModLow, Mod);
endmodule
