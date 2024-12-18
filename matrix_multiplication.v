
// -------------------------------------------------------------
// 
// File Name: hdlsrc/matrix_multiplication/matrix_multiplication.v
// Created: 2024-12-18 11:07:15
// 
// Generated by MATLAB 24.2, HDL Coder 24.2, and Simulink 24.2
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 0.01
// Target subsystem base rate: 0.01
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: matrix_multiplication
// Source Path: matrix_multiplication
// Hierarchy Level: 0
// Model version: 1.5
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module matrix_multiplication
          (x,
           x1,
           y);


  input   signed [7:0] x;  // int8
  input   signed [7:0] x1;  // int8
  output  signed [7:0] y;  // int8




  MATLAB__fn u_MATLAB_Function (.a(x),  // int8
                                     .b(x1),  // int8
                                     .y(y)  // int8
                                     );

endmodule  // matrix_multiplication

has popup