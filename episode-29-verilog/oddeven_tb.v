module oddeven_tb;
  reg [15:0] A;
  wire O;

  reg [31:0] i;

  oddeven OE(A, O);

  initial begin
    $monitor("A=%d O=%d", A, O);

    for (i=0; i<20; i=i+1) begin
      A = $random;
      #1;
    end

    $finish;
  end
endmodule
