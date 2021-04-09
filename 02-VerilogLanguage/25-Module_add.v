module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire cin;

    add16 add16_u1(
        .a(a[15:0]),
        .b(b[15:0]),
        .sum(sum[15:0]),
        .cin(1'b0),
        .cout(cin)
    );

    add16 add16_u2(
        .a(a[31:16]),
        .b(b[31:16]),
        .sum(sum[31:16]),
        .cin(cin)
    );

endmodule