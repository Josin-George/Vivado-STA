`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2025 12:48:33
// Design Name: 
// Module Name: generated_clock_example
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module generated_clock_example (
    input wire clk_in,       // Input clock
    input wire resetn,       // Active-low reset
    output wire clk_out      // Generated clock output
);
 
    // Internal wires for the PLL instance
    wire clk_fb;             // Feedback clock
    wire clk_gen;            // Generated clock
    wire pll_locked;         // PLL lock status
 
    // PLL instance (specific to Xilinx FPGA primitive)
    PLLE2_BASE #(
        .CLKFBOUT_MULT(8),   // Multiply input clock by 8
        .CLKOUT0_DIVIDE(4),  // Divide generated clock by 4
        .CLKIN1_PERIOD(10.0) // Input clock period in ns (100 MHz input clock)
    ) pll_inst (
        .CLKIN1(clk_in),     // Input clock
        .CLKFBIN(clk_fb),    // Feedback clock input
        .CLKFBOUT(clk_fb),   // Feedback clock output
        .CLKOUT0(clk_gen),   // Generated clock output
        .LOCKED(pll_locked), // PLL lock status output
        .PWRDWN(1'b0),       // Power down (active low)
        .RST(~resetn)        // Reset (active high)
    );
 
    // Assign the generated clock to the output
    assign clk_out = clk_gen;
 
endmodule