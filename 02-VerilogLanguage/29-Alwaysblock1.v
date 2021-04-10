// synthesis verilog_input_version verilog_2001
module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);

    always @(*) begin
        out_alwaysblock = a & b;
    end

    assign out_assign = a & b;

endmodule
