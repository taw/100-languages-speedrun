module mod5_tb;
  reg [31:0] A;
  wire [4:0] Mod;

  reg [31:0] i;

  mod5_32bit M(A, Mod);

  initial begin
    $monitor("A=%d O[0]=%d O[1]=%d O[2]=%d O[3]=%d O[4]=%d", A, Mod[0], Mod[1], Mod[2], Mod[3], Mod[4]);

    for (i=0; i<20; i=i+1) begin
      A = $random;
      #1;
    end

    $finish;
  end
endmodule
