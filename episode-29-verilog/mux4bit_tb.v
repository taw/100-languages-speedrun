module mux4bit_tb;
  reg [3:0] A;
  reg [3:0] B;
  reg S;
  wire [3:0] O;

  mux4bit M(A, B, S, O);

  initial begin
    if (!$value$plusargs("A=%d", A)) begin
      $display("ERROR: please specify +A=<value>");
      $finish;
    end

    if (!$value$plusargs("B=%d", B)) begin
      $display("ERROR: please specify +B=<value>");
      $finish;
    end

    S = 0;
    #1;
    $display("A = %d, B = %d, S = %d, O = %d", A, B, S, O);

    S = 1;
    #1;
    $display("A = %d, B = %d, S = %d, O = %d", A, B, S, O);

    $finish;
  end
endmodule
