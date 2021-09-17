`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/16 11:08:20
// Design Name: 
// Module Name: glitchfree_clockswitch
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


module glitchfree_clockswitch(
    input clk_1_i,
    input clk_2_i,
    input sel_i,
    input rst_n_i,
    output clk_o
    );

    reg [1:0]clk_sel;

    always @(posedge clk_1_i or negedge rst_n_i) begin
        if(!rst_n_i) begin
            clk_sel <= 2'b00;
        end
        else if(sel_i == 1'b0) begin
            clk_sel[0] <= 1'b1;
        end
        else begin
            clk_sel[0] <= 1'b0;
        end
    end

    always @(posedge clk_2_i or negedge rst_n_i) begin
        if(!rst_n_i) begin
            clk_sel <= 2'b00;
        end
        else if(sel_i == 1'b0) begin
            clk_sel[1] <= 1'b1;
        end
        else begin
            clk_sel[1] <= 1'b0;
        end
    end

    assign clk_o = (clk_sel[0] & clk_1_i) | (clk_sel[1] & clk_2_i);

endmodule
