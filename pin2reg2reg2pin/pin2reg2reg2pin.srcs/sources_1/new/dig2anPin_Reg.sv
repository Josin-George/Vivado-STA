`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2025 15:32:33
// Design Name: 
// Module Name: dig2anPin_Reg
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


module dig2an (
    input wire clk100mhz,
    input wire [3:0] din_dac,
    input wire newd,
    input wire MISO,      // Added MISO input
    output reg CS,
    output reg MOSI,
    output wire SCLK_O,
    output reg wrt_done,
    output wire [3:0] data_out
);
 
    // State machine states
    typedef enum logic [1:0] {
        IDLE_DAC = 3'b00,
        INIT_DAC = 3'b01,
        FUNC_DAC = 3'b10,
        WRT_DAC  = 3'b11
    } state_type;
 
    state_type state = IDLE_DAC;
 
    // Internal signals
    reg [7:0] data      = 8'h00;
    reg [7:0] setup_dac = 8'h08;
    reg dac_init         = 0;
    reg [2:0] count      = 0;
    reg clk1mhz          = 0;
    reg SCLK = 0;
 
    reg [1:0] scount = 0;
    
    reg [3:0] miso_data = 4'h00;  // Register to store received data
 
    always @(posedge clk100mhz)
    begin
        if (scount <= 3)
            scount <= scount + 1;
        else begin
            SCLK <= ~SCLK;
            scount <= 0;
        end
    end
 
    // Capture MISO data on rising edge of SCLK
    always @(posedge clk100mhz) begin
        if (CS == 0 && count < 4) begin
            miso_data <= {miso_data[2:0], MISO};  // Shift in data
        end
    end
 
    // Main DAC control process
    always @(posedge clk100mhz) begin      
        if (newd == 1'b0) begin
            state    <= IDLE_DAC;
            CS       <= 1;
            MOSI     <= 0;
            count    <= 0;
            wrt_done <= 0;
        end else begin
            case (state)
                IDLE_DAC: begin
                    CS       <= 1;
                    MOSI     <= 0;
                    count    <= 0;
                    wrt_done <= 0;
                    if (dac_init == 1'b0) begin
                        state <= INIT_DAC;
                    end else begin
                        state <= FUNC_DAC;
                    end
                end
 
                INIT_DAC: begin
                    if (count < 8) begin
                        CS    <= 0;
                        MOSI  <= setup_dac[7 - count];
                        count <= count + 1;
                    end else begin
                        CS       <= 1;
                        count    <= 0;
                        dac_init <= 1;
                        state    <= FUNC_DAC;
                    end
                end
 
                FUNC_DAC: begin
                    wrt_done <= 0;
                    CS       <= 1;
                    MOSI     <= 0;
                    data     <= { din_dac, 4'h0 };
                    state    <= WRT_DAC;
                end
 
                WRT_DAC: begin
                    if (count < 8) begin
                        CS    <= 0;
                        MOSI  <= data[7 - count];
                        count <= count + 1;
                    end else begin
                        CS       <= 1;
                        wrt_done <= 1;
                        count    <= 0;
                        MOSI     <= 0;
                        state    <= IDLE_DAC;
                    end
                end
                
            endcase
        end
    end
 
assign SCLK_O = SCLK;
assign data_out = miso_data;
endmodule

