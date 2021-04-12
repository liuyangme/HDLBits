module top_module (input x, input y, output z);

    wire z1, z2, z3, z4, z5, z6;

    q4a IA1(
        .x(x),
        .y(y),
        .z(z1)
    );

    q4b IB1(
        .x(x),
        .y(y),
        .z(z2)
    );

    q4a IA2(
        .x(x),
        .y(y),
        .z(z3)
    );

    q4b IB2(
        .x(x),
        .y(y),
        .z(z4)
    );

    assign z5 = z1 || z2;
    assign z6 = z3 && z4;
    assign z = z5 ^ z6;

endmodule

module q4a (input x, input y, output z);

    assign z = (x^y)&&x;

endmodule

module q4b ( input x, input y, output z );

    always @(*) begin
        case({x,y})
        2'b00: z=1;
        2'b01: z=0;
        2'b10: z=0;
        2'b11: z=1;
        endcase
    end

endmodule