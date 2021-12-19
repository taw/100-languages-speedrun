module mod5_add(ModA, ModB, ModOut);
  input [4:0] ModA;
  input [4:0] ModB;
  output [4:0] ModOut;

  // 0 + 0 = 0 => 0
  // 1 + 4 = 5 => 0
  // 2 + 3 = 5 => 0
  // 3 + 2 = 5 => 0
  // 4 + 1 = 5 => 0
  assign ModOut[0] = (ModA[0] & ModB[0]) | (ModA[1] & ModB[4]) | (ModA[2] & ModB[3]) | (ModA[3] & ModB[2]) | (ModA[4] & ModB[1]);

  // 0 + 1 = 1 => 1
  // 1 + 0 = 1 => 1
  // 2 + 4 = 6 => 1
  // 3 + 3 = 6 => 1
  // 4 + 2 = 6 => 1
  assign ModOut[1] = (ModA[0] & ModB[1]) | (ModA[1] & ModB[0]) | (ModA[2] & ModB[4]) | (ModA[3] & ModB[3]) | (ModA[4] & ModB[2]);

  // 0 + 2 = 2 => 2
  // 1 + 1 = 2 => 2
  // 2 + 0 = 2 => 2
  // 3 + 4 = 7 => 2
  // 4 + 3 = 7 => 2
  assign ModOut[2] = (ModA[0] & ModB[2]) | (ModA[1] & ModB[1]) | (ModA[2] & ModB[0]) | (ModA[3] & ModB[4]) | (ModA[4] & ModB[3]);

  // 0 + 3 = 3 => 3
  // 1 + 2 = 3 => 3
  // 2 + 1 = 3 => 3
  // 3 + 0 = 3 => 3
  // 4 + 4 = 8 => 3
  assign ModOut[3] = (ModA[0] & ModB[3]) | (ModA[1] & ModB[2]) | (ModA[2] & ModB[1]) | (ModA[3] & ModB[0]) | (ModA[4] & ModB[4]);

  // 0 + 4 = 4 => 4
  // 1 + 3 = 4 => 4
  // 2 + 2 = 4 => 4
  // 3 + 1 = 4 => 4
  // 4 + 0 = 4 => 4
  assign ModOut[4] = (ModA[0] & ModB[4]) | (ModA[1] & ModB[3]) | (ModA[2] & ModB[2]) | (ModA[3] & ModB[1]) | (ModA[4] & ModB[0]);
endmodule
