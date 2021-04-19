module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    always @(posedge clk) begin
        if(reset || (q==16'b1_111_111_111_111_111))
        begin
            q <= 16'b0;
        end
        else 
        begin
            if(q[3:0]==4'b1001)
            begin
                q[7:4] <= q[7:4] + 1'b1;
                q[3:0] <= 4'b0000;
                ena[1] <= 1'b0;
            end
            else if(q[3:0]==4'b1000)
            begin
                ena[1] <= 1'b1;
            end
            else
            begin
                q[3:0] <= q[3:0] + 1'b1;
            end

            if(q[7:4]==4'b1001)
            begin
                q[11:8] <= q[11:8] + 1'b1;
                q[7:4] <= 4'b0000;
                ena[2] <= 1'b0;
            end
            else if(q[7:4]==4'b1000)
            begin
                ena[2] <= 1'b1;
            end

            if(q[11:8]==4'b1001)
            begin
                q[15:12] <= q[15:12] + 1'b1;
                q[11:8] <= 4'b0000;
                ena[3] <= 1'b0;
            end
            else if(q[11:8]==4'b1000)
            begin
                ena[3] <= 1'b1;
            end

            if(q[15:12]==4'b1001)
            begin
                q <= 16'b0;
            end
        end
    end

endmodule