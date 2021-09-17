`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/16 10:51:10
// Design Name: 
// Module Name: edge_detect
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


module edge_detect(
    input clk_i,
    input rst_n_i,
    input edge_i,
    output nege_edge_o,
    output pose_edge_o,
    output edge_o
    );

    reg [1:0]edge_r;


    always @(posedge clk_i or negedge rst_n_i) begin
        if(!rst_n_i) begin
            edge_r <= 2'b00;
        end
        else begin
            edge_r <= {edge_r[0],edge_i};
        end
    end

    assign nege_edge_o = edge_r[1] & ~edge_r[0];
    assign pose_edge_o = ~edge_r[1] & edge_r[0];
    assign edge_o = nege_edge_o | pose_edge_o;

endmodule
