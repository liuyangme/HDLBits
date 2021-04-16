module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);

    wire d0;

    dff dff_u1(
        .clk(clk),
        .d(d0),
        .q(Q)
    );

    mux mux_u1(
        .a(q_in),
        .b(r_in),
        .sel(L),
        .out(d0)
    );

endmodule

module dff (
    input clk,
    input d,
    output reg q );

    always @(posedge clk) begin
        q <= d;
    end

endmodule

module mux (
    input a,
    input b,
    input sel,
    output out
);

    always @(*) begin
        case(sel)
        1'b0: out = a;
        1'b1: out = b;
        endcase
    end
    
endmodule