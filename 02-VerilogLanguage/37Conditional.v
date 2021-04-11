module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    reg [7:0] temp1;
    reg [7:0] temp2;

    assign temp1 = (a < b) ? a : b;
    assign temp2 = (c < d) ? c : d;
    assign min = (temp1 < temp2) ? temp1 : temp2;

endmodule