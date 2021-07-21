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