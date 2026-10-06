`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2026 06:06:02 PM
// Design Name: 
// Module Name: clock_splitter
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


module clock_splitter (
    input wire ext_clk_in,
    output wire clk_to_wizard,
    output wire clk_to_mig
);
    wire clk_buffered;

    // Instantiate the single-ended buffer at the root
    IBUF ibuf_sys_clk (
        .I(ext_clk_in),
        .O(clk_buffered)
    );

    // Safely branch the internal global clock net
    assign clk_to_wizard = clk_buffered;
    assign clk_to_mig    = clk_buffered;
endmodule