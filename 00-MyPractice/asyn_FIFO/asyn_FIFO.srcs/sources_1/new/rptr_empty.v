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