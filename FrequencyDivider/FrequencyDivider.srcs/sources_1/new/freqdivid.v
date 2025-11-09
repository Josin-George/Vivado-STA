`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2025 11:54:36
// Design Name: 
// Module Name: freqdivid
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


`timescale 1ns / 1ps
 
 
module primary_and_generated_clock(
    input wire clk_in,      // Primary clock (100 MHz)
    input wire reset,       // Reset signal
    output wire clk_out     // Generated clock (50 MHz)
);
    // Primary clock (clk_in) will be the system clock (100 MHz)
    // We will generate clk_out by dividing clk_in by 2, so clk_out will be 50 MHz
 
    reg clk_out_reg;  // Register to hold the generated clock
 
    // Process to generate clk_out from clk_in (divide by 2)
    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            clk_out_reg <= 0;   // Reset the generated clock
        end else begin
            clk_out_reg <= ~clk_out_reg;  // Toggle on every rising edge of clk_in
        end
    end
 
    // Assign the generated clock to output
    assign clk_out = clk_out_reg;
 
endmodule