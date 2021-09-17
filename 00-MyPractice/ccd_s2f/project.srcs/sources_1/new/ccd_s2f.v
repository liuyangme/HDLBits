`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/15 23:10:26
// Design Name: 
// Module Name: ccd_s2f
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


module ccd_s2f(
    input clk_i,
    input rst_n_i,
    input signal_i,
    output signal_o
    );

    reg [1:0] signal_r;

    always @(posedge clk_i or negedge rst_n_i) begin
        if(!rst_n_i) begin
            signal_r <= 2'b0;
        end
        else begin
            signal_r <= {signal_r[0],signal_i};
        end

    end

    assign signal_o = signal_r[1];

endmodule
