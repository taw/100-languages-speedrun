module mod3_tb;
  reg [31:0] A;
  wire [2:0] Mod;

  reg [31:0] i;

  mod3_32bit M(A, Mod);

  initial begin
    $monitor("A=%d O[0]=%d O[1]=%d O[2]=%d", A, Mod[0], Mod[1], Mod[2]);

    for (i=0; i<20; i=i+1) begin
      A = $random;
      #1;
    end

    $finish;
  end
endmodule
