`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2025 19:29:18
// Design Name: 
// Module Name: register_with_constraints
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


module register_with_constraints (
    input wire clk,         // Clock input
    input wire rst,         // Reset input
    input wire d,           // Data input
    output reg q            // Data output
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;      // Reset output to 0
        else
            q <= d;         // Latch input data on clock edge
    end
    
endmodule
