`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/15 21:12:28
// Design Name: 
// Module Name: sta_ff2p
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


module sta_ff2p(
    input clk_i,
    input rst_n_i,
    input signal_i,
    output signal_o
    );

    reg signal_o_r;
    reg signal_ff;

    always @(posedge clk_i or negedge rst_n_i) begin
        if(!rst_n_i) begin
            signal_o_r <= 1'b0;
            signal_ff <= 1'b0;
        end
        else begin
            signal_ff <= signal_i;
            signal_o_r <= signal_ff;
        end
    end

    assign signal_o = signal_o_r;

endmodule
