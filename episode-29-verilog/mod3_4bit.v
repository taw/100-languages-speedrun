module mod3_4bit(A, Mod);
  input [3:0] A;
  output [2:0] Mod;

  wire [2:0] ModHi;
  wire [2:0] ModLow;

  mod3_2bit Hi(A[3:2], ModHi);
  mod3_2bit Low(A[1:0], ModLow);

  // No need to do shift as (2**2) % 3 == 1
  mod3_add Add(ModHi, ModLow, Mod);
endmodule
