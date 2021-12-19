module fizzbuzz(A, PrintNumber, PrintFizz, PrintBuzz, PrintFizzBuzz);
  input [31:0] A;
  output PrintNumber, PrintFizz, PrintBuzz, PrintFizzBuzz;
  wire [2:0] Mod3;
  wire [4:0] Mod5;

  mod3_32bit M3(A, Mod3);
  mod5_32bit M5(A, Mod5);

  assign PrintNumber   = ~Mod3[0] & ~Mod5[0];
  assign PrintFizz     = Mod3[0] & ~Mod5[0];
  assign PrintBuzz     = ~Mod3[0] & Mod5[0];
  assign PrintFizzBuzz = Mod3[0] & Mod5[0];
endmodule
