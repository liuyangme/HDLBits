`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/18 21:17:33
// Design Name: 
// Module Name: syn_fifo
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


module syn_fifo
#(
    parameter FIFO_WIDTH = 32,
    parameter FIFO_DEPTH = 8,
    parameter ADDR_WIDTH = 3
)
(
    input clk_i,
    input rst_n,
    input [FIFO_WIDTH-1:0] wr_data,
    input r_req,    //read request
    input w_req,    //write request
    output reg [FIFO_WIDTH-1:0] rd_data,
    output full_o,
    output empty_o
);

//internal signal
reg [FIFO_WIDTH-1:0] fifo_mem[FIFO_DEPTH-1:0];
reg [ADDR_WIDTH:0] counter;
reg [ADDR_WIDTH-1:0] rd_ptr;
reg [ADDR_WIDTH-1:0] wr_ptr;

//set full or empty
assign full_o = (counter == FIFO_DEPTH);
assign empty_o = (counter == 0);

//set current fifo counter value
always @(posedge clk_i or negedge rst_n)
begin
    if(!rst_n)
    begin
        counter <= 0;
    end
    else if((w_req && !full_o)&&(r_req && !empty_o))
    begin
        counter <= counter;
    end
    else if(w_req && !full_o)
    begin
        counter <= counter + 1;
    end
    else if (r_req && !empty_o)
    begin
        counter <= counter - 1;
    end
    else 
    begin
        counter <= counter;
    end
end

//read data if no full and read enable
always @(posedge clk_i or negedge rst_n)
begin
    if(!rst_n)
    begin
        rd_data <= 0;
    end
    else if(r_req && !empty_o)
    begin
        rd_data <= fifo_mem[rd_ptr];
    end
end

//write data if no empty and write enable
always @(posedge clk_i) 
begin
    if(w_req && !full_o)
    begin
        fifo_mem[wr_ptr] <= wr_data;
    end
end

//update read and write ptr
always @(posedge clk_i or negedge rst_n) 
begin
    if(!rst_n)
    begin
        wr_ptr <= 0;
        rd_ptr <= 0;
    end
    else
    begin
        if(!full_o && w_req)
        begin
            wr_ptr <= wr_ptr + 1;
            if(wr_ptr == (FIFO_DEPTH-1))
            begin
                wr_ptr <= 0;
            end
        end
        if(!empty_o && r_req)
        begin
            rd_ptr <= rd_ptr + 1;
            if(rd_ptr == (FIFO_DEPTH-1))
            begin
                rd_ptr <= 0;
            end
        end
    end
end

endmodule
