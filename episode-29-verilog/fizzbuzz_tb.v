module fizzbuzz_tb;
  reg [31:0] A;
  wire PrintNumber, PrintFizz, PrintBuzz, PrintFizzBuzz;

  reg [31:0] i;

  fizzbuzz M(A, PrintNumber, PrintFizz, PrintBuzz, PrintFizzBuzz);

  initial begin
    $monitor("A=%d Number=%d Fizz=%d Buzz=%d FizzBuzz=%d", A, PrintNumber, PrintFizz, PrintBuzz, PrintFizzBuzz);

    for (i=1; i<=100; i=i+1) begin
      A = i;
      #1;
    end

    $finish;
  end
endmodule
