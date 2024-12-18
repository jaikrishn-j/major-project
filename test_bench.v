`timescale 1 ns / 1 ns

module matrix_multiplication_tb;

  // Inputs
  reg clk;
  reg reset;
  reg clk_enable;
  reg [63:0] In1;
  reg [63:0] In2;

  // Outputs
  wire ce_out;
  wire [63:0] Out1;

  // Instantiate the module
  matrix_multiplication uut (
    .clk(clk),
    .reset(reset),
    .clk_enable(clk_enable),
    .In1(In1),
    .In2(In2),
    .ce_out(ce_out),
    .Out1(Out1)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;  // 100 MHz clock
  end

  // Test procedure
  initial begin
    // Initialize Inputs
    clk = 0;
    reset = 1;
    clk_enable = 0;
    In1 = 64'b0;
    In2 = 64'b0;
    
    // Reset the design
    #10 reset = 0;
    
    // Start test by enabling the clock and applying matrix elements one by one
    #10 clk_enable = 1;

    // Apply matrix multiplication values:
    // Matrix1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    // Matrix2 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

    // Apply first set of values: Multiply 1 * 1
    #10 In1 = 64'h3FF0000000000000;  // 1 (double precision)
        In2 = 64'h3FF0000000000000;  // 1 (double precision)
    
    // Apply second set of values: Multiply 1 * 2
    #10 In1 = 64'h3FF0000000000000;  // 1 (double precision)
        In2 = 64'h4000000000000000;  // 2 (double precision)
    
    // Apply third set of values: Multiply 1 * 3
    #10 In1 = 64'h3FF0000000000000;  // 1 (double precision)
        In2 = 64'h4008000000000000;  // 3 (double precision)

    // Apply fourth set of values: Multiply 4 * 1
    #10 In1 = 64'h4000000000000000;  // 4 (double precision)
        In2 = 64'h3FF0000000000000;  // 1 (double precision)

    // Apply fifth set of values: Multiply 4 * 2
    #10 In1 = 64'h4000000000000000;  // 4 (double precision)
        In2 = 64'h4000000000000000;  // 2 (double precision)

    // Apply sixth set of values: Multiply 4 * 3
    #10 In1 = 64'h4000000000000000;  // 4 (double precision)
        In2 = 64'h4008000000000000;  // 3 (double precision)

    // Apply seventh set of values: Multiply 7 * 1
    #10 In1 = 64'h4010000000000000;  // 7 (double precision)
        In2 = 64'h3FF0000000000000;  // 1 (double precision)

    // Apply eighth set of values: Multiply 7 * 2
    #10 In1 = 64'h4010000000000000;  // 7 (double precision)
        In2 = 64'h4000000000000000;  // 2 (double precision)

    // Apply ninth set of values: Multiply 7 * 3
    #10 In1 = 64'h4010000000000000;  // 7 (double precision)
        In2 = 64'h4008000000000000;  // 3 (double precision)

    // End of simulation
    #20 $finish;
  end

  // Display output
  always @ (posedge clk) begin
    if (ce_out) begin
      $display("Out1 = %f", $bitstoreal(Out1)); // Display the result as a floating-point number
    end
  end

endmodule
