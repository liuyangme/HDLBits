`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/15 23:24:51
// Design Name: 
// Module Name: ccd_f2s
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


module ccd_f2s(
    input clk_a_i,
    input clk_b_i,
    input rst_n_i,
    input pluse_a_i,
    output pluse_b_o,
    output signal_b_o
    );

    reg signal_a;
    reg signal_b;
    reg [1:0] signal_a_r;
    reg [1:0] signal_b_r;

    //在clk_a下对输入脉冲进行展宽生成signal_a
    always @(posedge clk_a_i or negedge rst_n_i) begin
        if(!rst_n_i) begin
            signal_a <= 1'b0;
        end
        else if(pluse_a_i == 1'b1) begin
            signal_a <= 1'b1;
        end
        else if(signal_b_r[1] == 1'b1) begin
            signal_a <= 1'b0;
        end
        else begin
            signal_a <= signal_a;
        end
    end

    //clk_b下同步signal_a
    always @(posedge clk_b_i or negedge rst_n_i) begin
        if(!rst_n_i) begin
            signal_b <= 1'b0;
        end
        else begin
            signal_b <= signal_a;
        end
    end

    //在clk_b下生成脉冲信号和同步信号
    always @(posedge clk_b_i or negedge rst_n_i) begin
        if(!rst_n_i) begin
            signal_b_r <= 2'b00;
        end
        else begin
            signal_b_r <= {signal_b_r[0],signal_b};
        end
    end

    assign pluse_b_o = ~signal_b_r[1] & signal_b_r[0];
    assign signal_b_o = signal_b_r[1];

    //在clk_a下采集signal_b_r[1]用于生成signal_a_r[1]拉低signal_a_o
    always @(posedge clk_a_i or negedge rst_n_i) begin
        if(!rst_n_i) begin
            signal_a_r <= 2'b00;
        end
        else begin
            signal_a_r <= {signal_a_r[0],signal_b_r[1]};
        end
    end

endmodule
