module mux8bit(A, B, S, O);
  input [7:0] A;
  input [7:0] B;
  input S;
  output [7:0] O;

  assign O = S ? B : A;
endmodule
