module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    wire q1,q2,q3;

    dffm dff_u1(
        .clk(clk),
        .rst(resetn),
        .d(in),
        .q(q1)
    );

    dffm dff_u2(
        .clk(clk),
        .rst(resetn),
        .d(q1),
        .q(q2)
    );

    dffm dff_u3(
        .clk(clk),
        .rst(resetn),
        .d(q2),
        .q(q3)
    );

    dffm dff_u4(
        .clk(clk),
        .rst(resetn),
        .d(q3),
        .q(out)
    );

endmodule

module dffm (
    input clk,
    input rst,
    input d,
    output q
);

    always @(posedge clk) begin
        if(!rst)
        begin
            q <= 0;
        end
        else
        begin
            q <= d;
        end
    end
    
endmodule