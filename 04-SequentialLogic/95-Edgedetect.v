module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);

    wire [7:0] tri_1;
    wire [7:0] tri_2;

    always @(posedge clk) begin
        tri_1 <= in;
        tri_2 <= tri_1;
    end

    assign pedge = tri_1 & (~tri_2);

endmodule