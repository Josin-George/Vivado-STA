`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2025 11:47:55
// Design Name: 
// Module Name: dFF
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
 
module dff (
    input wire clk,       // Clock signal
    input wire reset,     // Reset signal
    input wire d,         // Data input
    output reg q          // Data output
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else
            q <= d;
    end
    
endmodule
