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

module fifo_async #(
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

