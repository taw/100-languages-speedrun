module mod3_2bit(A, Mod);
  input [1:0] A;
  output [2:0] Mod;
  // 2      => 2 mod 3
  assign Mod[2] = A[1] & ~A[0];
  // 1      => 1 mod 3
  assign Mod[1] = ~A[1] & A[0];
  // 0 or 3 => 0 mod 3
  assign Mod[0] = (~A[0] & ~A[1]) | (A[0] & A[1]);
endmodule
