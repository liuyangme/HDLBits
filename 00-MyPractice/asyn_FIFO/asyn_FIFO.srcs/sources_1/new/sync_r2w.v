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