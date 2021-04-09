module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire cin1;
    wire [31:0] xor_out;

    add16 add16_u1(
        .a(a[15:0]),
        .b(xor_out[15:0]),
        .cin(sub),
        .sum(sum[15:0]),
        .cout(cin1)
    );

    add16 add16_u2(
        .a(a[31:16]),
        .b(xor_out[31:16]),
        .cin(cin1),
        .sum(sum[31:16])
    );

    always @(*) begin
        xor_out = b^{32{sub}};
    end

endmodule