module mod5_2bit(A, Mod);
  input [1:0] A;
  output [4:0] Mod;
  // no 2 bit number is 4 mod 5
  assign Mod[4] = 0;
  // numbers 0-3 are themselves mod 5
  assign Mod[3] = A[0] & A[1];
  assign Mod[2] = A[1] & ~A[0];
  assign Mod[1] = ~A[1] & A[0];
  assign Mod[0] = ~A[0] & ~A[1];
endmodule
