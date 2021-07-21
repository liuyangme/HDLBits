`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/21 00:38:56
// Design Name: 
// Module Name: fifomem
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


module fifomem 
#(
    parameter DATASIZE = 8,
    parameter ADDRSIZE = 4
)
(
    input [DATASIZE-1:0] write_data,
    input [ADDRSIZE-1:0] waddr,
    input [ADDRSIZE-1:0] raddr,
    input wq,
    input wfull,
    input wclk,

    output [DATASIZE-1:0] read_data
);
    
    localparam DEPTH = 1 << ADDRSIZE;
    reg [DATASIZE-1:0] mem [0:DEPTH-1];
    assign read_data = mem[raddr];

    always @(posedge wclk)
    begin
        if(wq && !wfull)
        begin
            mem[waddr] <= write_data;
        end
    end
endmodule
