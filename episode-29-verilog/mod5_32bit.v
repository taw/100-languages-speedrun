module mod5_32bit(A, Mod);
  input [31:0] A;
  output [4:0] Mod;

  wire [4:0] ModHi;
  wire [4:0] ModLow;

  mod5_16bit Hi(A[31:16], ModHi);
  mod5_16bit Low(A[15:0], ModLow);

  // No need to do shift as (2**16) % 5 == 1
  mod5_add Add(ModHi, ModLow, Mod);
endmodule
