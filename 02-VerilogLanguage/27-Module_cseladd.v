module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire sel;
    reg [15:0]sum1_r;
    reg [15:0]sum2_r;
    reg [31:0]sum_r;
    
    add16 add16_u1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum_r[15:0]),
        .cout(sel)
    );

    add16 add16_u2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum1_r)
    );

    add16 add16_u3(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum2_r)
    );

    always @(*) begin
        case (sel)
            1'b0:sum_r={sum1_r,sum_r[15:0]};
            1'b1:sum_r={sum2_r,sum_r[15:0]};
        endcase
    end

    assign sum = sum_r;

endmodule