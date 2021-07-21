`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/19 21:45:23
// Design Name: 
// Module Name: fifo_async_tb
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


module fifo_async_tb(
    );

    reg wclk,wrst_n;
    reg rclk,rrst_n;
    reg wq,rq;
    reg [7:0] write_data;   // data input to be pushed to buffer
    wire [7:0] read_data;   // port to output the data using pop.
    wire rempty,wfull;      // buffer empty and full indication

    fifo_async#(
        .DSIZE(8), 
        .ASIZE(4)) 
    fifo_inst(
        .rclk(rclk),
        .rrst_n(rrst_n),
        .rq(rq),
        .wclk(wclk),
        .wrst_n(wrst_n),
        .wq(wq),
        .write_data(write_data),
        .read_data(read_data),
        .wfull(wfull),
        .rempty(rempty)
    );

    always #10 wclk = ~wclk;
    always #20 rclk = ~rclk;

    reg [7:0] tempdata = 0;

    initial begin
        rclk = 0;
        wclk = 0;
        #5000 $finish;
    end

    initial begin
        wrst_n = 1;
        #2;
        wrst_n = 0;
        #60;
        wrst_n = 1;
    end

    initial begin
        rrst_n = 1;
        #2;
        rrst_n = 0;
        #120;
        rrst_n = 1;
    end

    always  @(posedge wclk or negedge wrst_n)
    begin
        if(wrst_n==1'b0)
        begin
            wq <= 0;
            rq <= 0;
        end
        else begin
            wq <= $random;
        end
    end

    always  @(posedge rclk or negedge rrst_n)
    begin
        if(rrst_n==1'b0)
            rq <= 0;
        else
            rq <= $random;
    end

    always@(*)
    begin
        if(wq == 1)
        begin
            write_data= $random ;
        end
        else
            write_data = 0;
    end

    always @(write_data,read_data)
    begin
        $monitor($time, "write data:%d, read data:%d",write_data,read_data);
    end

    initial
    begin
        //$dumpfile("dump.vcd");
        //$dumpvars;
        // $fsdbDumpfile("dump.fsdb");
        // $fsdbDumpvars("+all");
    end
    
endmodule
