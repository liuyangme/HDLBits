`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/16 12:37:57
// Design Name: 
// Module Name: seq_detect
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


module seq_detect(
    input clk_i,
    input rst_n_i,
    input data_i,
    output reg data_o
    );

    reg [1:0]state;
    reg [1:0]next_state;
    parameter IDLE = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    always @(posedge clk_i or negedge rst_n_i) begin
        if(!rst_n_i) begin
            state <= IDLE;
            next_state <= IDLE;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state)
            IDLE:
            begin
                if(data_i == 1'b1)
                    next_state = S1;
                else 
                    next_state = IDLE;
            end
            S1:
            begin
                if(data_i == 1'b0)
                    next_state = S2;
                else
                    next_state = S1;
            end
            S2:
            begin
                if(data_i == 1'b1)
                    next_state = S3;
                else 
                    next_state = S2;
            end
            S3:
            begin
                if(data_i == 1'b0)
                    next_state = S2;
                else 
                    next_state = S1;
            end
            default:
                next_state = next_state; 
        endcase
    end

    always @(posedge clk_i or negedge rst_n_i) begin
        if(!rst_n_i) begin
            data_o <= 1'b0;
        end
        else if(state == S3)
            data_o <= 1'b1;
        else 
            data_o <= 1'b0;
    end

endmodule
