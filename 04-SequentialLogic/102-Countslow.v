module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    always @(posedge clk) begin
        if((reset)||((q==4'b1001)&&(slowena)))
        begin
            q <= 4'b0000;
        end

        else if(slowena)
        begin
            q <= q + 1'b1;
        end
    end

endmodule