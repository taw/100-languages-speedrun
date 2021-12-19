module mod3_add(ModA, ModB, ModOut);
  input [2:0] ModA;
  input [2:0] ModB;
  output [2:0] ModOut;

  // 0 + 0 = 0 => 0
  // 1 + 2 = 3 => 0
  // 2 + 1 = 3 => 0
  assign ModOut[0] = (ModA[0] & ModB[0]) | (ModA[1] & ModB[2]) | (ModA[2] & ModB[1]);

  // 0 + 1 = 1 => 1
  // 1 + 0 = 1 => 1
  // 2 + 2 = 4 => 1
  assign ModOut[1] = (ModA[0] & ModB[1]) | (ModA[1] & ModB[0]) | (ModA[2] & ModB[2]);

  // 0 + 2 = 2 => 2
  // 2 + 0 = 2 => 2
  // 1 + 1 = 2 => 2
  assign ModOut[2] = (ModA[0] & ModB[2]) | (ModA[2] & ModB[0]) | (ModA[1] & ModB[1]);
endmodule
