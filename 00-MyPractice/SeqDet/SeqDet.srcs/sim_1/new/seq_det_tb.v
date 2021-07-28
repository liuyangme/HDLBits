`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/28 14:02:30
// Design Name: 
// Module Name: seq_det_tb
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


module seq_det_tb(
    );

    reg clk_i;
    reg rst_n;
    wire x;
    wire z;
    
    reg [23:0] data;
    assign x = data[23];

    initial 
        begin
            clk_i = 0;
            rst_n = 1;
            #2 rst_n = 0;
            #30 rst_n = 1;
            data = 20'b1100_1001_0000_1001_0100;
            # 20000 $stop;
        end

    always #20 clk_i = ~clk_i;

    always @(posedge clk_i)
        #2 data = {data[22:0],data[23]};

    seq_det seq_det_u1(
        .x(x),
        .z(z),
        .clk_i(clk_i),
        .rst_n(rst_n)
    );

endmodule
