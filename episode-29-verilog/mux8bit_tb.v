module mux8bit_tb;
  reg [7:0] A;
  reg [7:0] B;
  reg S;
  wire [7:0] O;

  reg [31:0] i;

  mux8bit M(A, B, S, O);

  initial begin
    $monitor("A=%d B=%d S=%d O=%D", A, B, S, O);

    for (i=0; i<256*256*2; i=i+1) begin
      {A,B,S} = i;
      #1;
    end

    $finish;
  end
endmodule
