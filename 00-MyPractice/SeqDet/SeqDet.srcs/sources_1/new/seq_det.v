`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/26 10:43:26
// Design Name: 
// Module Name: seq_det
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

//检测序列 10010

module seq_det(
    input x,
    input clk_i,
    input rst_n,
    output reg z
    );

    reg [4:0] next_state;
    reg [4:0] current_state;


    parameter IDLE    = 5'b00000;
    parameter STATE_A = 5'b00001;
    parameter STATE_B = 5'b00010;
    parameter STATE_C = 5'b00100;
    parameter STATE_D = 5'b01000;
    parameter STATE_E = 5'b10000;

    always @(*)
    begin
        case(current_state)
            IDLE:
            begin
                if(x == 1'b0)
                begin
                    next_state <= IDLE;
                end
                else  //x == 1'b1
                begin
                    next_state <= STATE_A;
                end
            end
            STATE_A:
            begin
                if(x == 1'b0)
                begin
                    next_state <= STATE_B;
                end
                else  //x == 1'b1
                begin
                    next_state <= STATE_A;
                end
            end
            STATE_B:
            begin
                if(x == 1'b0)
                begin
                    next_state <= STATE_C;
                end
                else  //x == 1'b1
                begin
                    next_state <= STATE_A;
                end
            end
            STATE_C:
            begin
                if(x == 1'b0)
                begin
                    next_state <= IDLE;
                end
                else  //x == 1'b1
                begin
                    next_state <= STATE_D;
                end
            end
            STATE_D:
            begin
                if(x == 1'b0)
                begin
                    next_state <= STATE_E;
                end
                else  //x == 1'b1
                begin
                    next_state <= STATE_A;
                end
            end
            STATE_E:
            begin
                if(x == 1'b0)
                begin
                    next_state <= STATE_C;
                end
                else  //x == 1'b1
                begin
                    next_state <= STATE_A;
                end
            end
            default: next_state <= next_state;
        endcase
    end

    always @(posedge clk_i or negedge rst_n)
    begin
        if(!rst_n)
        begin
            current_state <= IDLE;
        end
        else 
        begin
            current_state <= next_state;
        end
    end

    always @(posedge clk_i or negedge rst_n)
    begin
        if(!rst_n)
        begin
            z = 1'b0;
        end
        else
        begin
            case(current_state)
            STATE_E:z = 1'b1;
            default:z = 1'b0;
            endcase
        end
    end

endmodule
