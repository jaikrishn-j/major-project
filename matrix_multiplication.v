`timescale 1 ns / 1 ns

module matrix_multiplication
          (clk,
           reset,
           clk_enable,
           In1,
           In2,
           ce_out,
           Out1);


  input   clk;
  input   reset;
  input   clk_enable;
  input   [63:0] In1;  // double
  input   [63:0] In2;  // double
  output  ce_out;
  output  [63:0] Out1;  // double


  wire [63:0] MatrixMultiply_out1;  // ufix64


  nfp_mul_double u_nfp_mul_comp (.clk(clk),
                                 .reset(reset),
                                 .enb(clk_enable),
                                 .nfp_in1(In1),  // double
                                 .nfp_in2(In2),  // double
                                 .nfp_out(MatrixMultiply_out1)  // double
                                 );

  assign Out1 = MatrixMultiply_out1;

  assign ce_out = clk_enable;

endmodule 