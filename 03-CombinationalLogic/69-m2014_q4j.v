module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    wire cout_tmp[2:0];

    fadd fadd_u1(
        .a(x[0]),
        .b(y[0]),
        .cin(1'b0),
        .sum(sum[0]),
        .cout(cout_tmp[0])
    );

    fadd fadd_u2(
        .a(x[1]),
        .b(y[1]),
        .cin(cout_tmp[0]),
        .sum(sum[1]),
        .cout(cout_tmp[1])
    );

    fadd fadd_u3(
        .a(x[2]),
        .b(y[2]),
        .cin(cout_tmp[1]),
        .sum(sum[2]),
        .cout(cout_tmp[2])
    );

    fadd fadd_u4(
        .a(x[3]),
        .b(y[3]),
        .cin(cout_tmp[2]),
        .sum(sum[3]),
        .cout(sum[4])
    );


endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );

    assign sum = a ^ b ^ cin;
    assign cout= (a & b) | (cin & (a | b));

endmodule