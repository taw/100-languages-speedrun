module mux4bit(A, B, S, O);
  input [3:0] A;
  input [3:0] B;
  input S;
  output [3:0] O;

  wire notS;
  wire [3:0] AX;
  wire [3:0] BX;

  not(notS, S);

  and(AX[0], A[0], notS);
  and(AX[1], A[1], notS);
  and(AX[2], A[2], notS);
  and(AX[3], A[3], notS);

  and(BX[0], B[0], S);
  and(BX[1], B[1], S);
  and(BX[2], B[2], S);
  and(BX[3], B[3], S);

  or(O[0], AX[0], BX[0]);
  or(O[1], AX[1], BX[1]);
  or(O[2], AX[2], BX[2]);
  or(O[3], AX[3], BX[3]);
endmodule
