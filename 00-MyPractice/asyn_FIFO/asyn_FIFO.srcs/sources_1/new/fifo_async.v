`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/19 21:45:01
// Design Name: 
// Module Name: fifo_async
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

module sync_r2w #(
    parameter ADDRSIZE = 4
) (
    input [ADDRSIZE:0] rptr,
    input wclk,
    input wrst_n,
    output reg [ADDRSIZE:0] wq2_rptr
);
    reg [ADDRSIZE:0] wq1_rptr;

    always @(posedge wclk or negedge wrst_n) 
    begin
        if(!wrst_n)
        begin
            wq1_rptr <= 0;
            wq2_rptr <= 0;
        end
        else
        begin
            wq1_rptr <= rptr;
            wq2_rptr <= wq1_rptr;
        end
    end
endmodule

module sync_w2r #(
    parameter ADDRSIZE = 4
) (
    input [ADDRSIZE:0] wptr,
    input rclk,
    input rrst_n,
    output reg [ADDRSIZE:0] rq2_wptr
);
    reg [ADDRSIZE:0] rq1_rptr;

    always @(posedge rclk or negedge rrst_n) 
    begin
        if(!rrst_n)
        begin
            rq1_rptr <= 0;
            rq2_wptr <= 0;
        end
        else
        begin
            rq1_rptr <= wptr;
            rq2_wptr <= rq1_rptr;
        end
    end
endmodule

module rptr_empty #(
    parameter ADDRSIZE = 4
) (
    input [ADDRSIZE:0] rq2_wptr,
    input rq,
    input rclk,
    input rrst_n,
    output reg rempty,
    output [ADDRSIZE-1:0] raddr,
    output reg [ADDRSIZE:0] rptr
);
    
    reg [ADDRSIZE:0] rbin;
    wire [ADDRSIZE:0] rgraynext;
    wire [ADDRSIZE:0] rbinnext;

    always @(posedge rclk or negedge rrst_n)
    if (!rrst_n) 
    begin
        rbin <= 0;
        rptr <= 0;
    end
    else 
    begin
        rbin<=rbinnext;
        rptr<=rgraynext; //output to sync_r2w.v
    end
    // Memory read-address pointer (okay to use binary to address memory)
    assign raddr     = rbin[ADDRSIZE-1:0]; //
    assign rbinnext  = rbin + (rq & ~rempty); //not empty and read request, then plus 1
    assign rgraynext = (rbinnext>>1) ^ rbinnext; //graycode
    // FIFO empty when the next rptr == synchronized wptr or on reset
    assign rempty_val = (rgraynext == rq2_wptr); //empty when read graycode equal write prt after sync
    always @(posedge rclk or negedge rrst_n)
    if (!rrst_n)
        rempty <= 1'b1;
    else
        rempty <= rempty_val;

endmodule

module wptr_full
#(
    parameter ADDRSIZE = 4
)
(
    output reg                wfull,
    output     [ADDRSIZE-1:0] waddr,
    output reg [ADDRSIZE  :0] wptr,
    input      [ADDRSIZE  :0] wq2_rptr,
    input                     wq, wclk, wrst_n
);
    reg  [ADDRSIZE:0] wbin;
    wire [ADDRSIZE:0] wgraynext, wbinnext;
    // GRAYSTYLE2 pointer
    always @(posedge wclk or negedge wrst_n)
    begin
        if (!wrst_n)
            {wbin, wptr} <= 0;
        else
            {wbin, wptr} <= {wbinnext, wgraynext};
    end
    // Memory write-address pointer (okay to use binary to address memory)
    assign waddr = wbin[ADDRSIZE-1:0];
    assign wbinnext  = wbin + (wq & ~wfull);
    assign wgraynext = (wbinnext>>1) ^ wbinnext; //
    //-----------------------------------------------------------------
    //msb not equal msb -1 bit, and other bits are same, then full
    assign wfull_val = (wgraynext=={~wq2_rptr[ADDRSIZE:ADDRSIZE-1],wq2_rptr[ADDRSIZE-2:0]});
    always @(posedge wclk or negedge wrst_n)
    begin
        if (!wrst_n)
            wfull  <= 1'b0;
        else
            wfull  <= wfull_val;
    end
endmodule

module fifo_async
#(
    parameter DSIZE = 8,
    parameter ASIZE = 4
)
(
    input              rclk, rrst_n,rq,
    input              wclk, wrst_n,wq,
    input  [DSIZE-1:0] write_data,
    output [DSIZE-1:0] read_data,
    output             wfull,
    output             rempty
);

    wire   [ASIZE-1:0] waddr, raddr;
    wire   [ASIZE:0]   wptr, rptr, wq2_rptr, rq2_wptr;
// synchronize the read pointer into the write-clock domain
sync_r2w  sync_r2w
(
                    .wq2_rptr    (wq2_rptr),
                    .rptr        (rptr    ),
                    .wclk        (wclk    ),
                    .wrst_n      (wrst_n  )
);

// synchronize the write pointer into the read-clock domain
sync_w2r  sync_w2r
(
    .rq2_wptr(rq2_wptr),
    .wptr(wptr),
    .rclk(rclk),
    .rrst_n(rrst_n)
);

//this is the FIFO memory buffer that is accessed by both the write and read clock domains.
//This buffer is most likely an instantiated, synchronous dual-port RAM.
//Other memory styles can be adapted to function as the FIFO buffer.
fifomem #(DSIZE, ASIZE) fifomem
(
    .read_data(read_data),
    .write_data(write_data),
    .waddr(waddr),
    .raddr(raddr),
    .wq(wq),
    .wfull(wfull),
    .wclk(wclk)
);

//this module is completely synchronous to the read-clock domain and contains the FIFO read pointer and empty-flag logic.
rptr_empty #(ASIZE) rptr_empty
(
    .rempty(rempty),
    .raddr(raddr),
    .rptr(rptr),
    .rq2_wptr(rq2_wptr),
    .rq(rq),
    .rclk(rclk),
    .rrst_n(rrst_n)
);

//this module is completely synchronous to the write-clock domain and contains the FIFO write pointer and full-flag logic
wptr_full #(ASIZE) wptr_full
(
    .wfull(wfull),
    .waddr(waddr),
    .wptr(wptr),
    .wq2_rptr(wq2_rptr),
    .wq(wq),
    .wclk(wclk),
    .wrst_n(wrst_n)
);
endmodule

