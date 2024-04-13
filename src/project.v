/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

alu u_alu (
  .clk    (clk),  // input, wire, 
  .en     (ena),  // input, wire, 
  .opcode (uio_oe),  // input, wire [2:0], 
  .in_1   (ui_in),  // input, wire [3:0], 
  .in_2   (uio_in),  // input, wire [3:0], 
  .out    (uo_out)   // output, wire [3:0], 
);

assign uio_out =0;

endmodule
