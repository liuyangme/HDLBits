`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/15 20:30:12
// Design Name: 
// Module Name: decode2_4
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


module decode2_4(
    input [1:0] data_i,
    input clc_i,
    output reg [3:0] data_o
    );

    always @(*) begin
        if(clc_i == 1'b1) begin
            data_o = 4'b0000;
        end
        else begin
            case(data_i)
            2'b00:data_o = 4'b0001;
            2'b01:data_o = 4'b0010;
            2'b10:data_o = 4'b0011;
            2'b11:data_o = 4'b0100;
            endcase
        end
    end

endmodule
