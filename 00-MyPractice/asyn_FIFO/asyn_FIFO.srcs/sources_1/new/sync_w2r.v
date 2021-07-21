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