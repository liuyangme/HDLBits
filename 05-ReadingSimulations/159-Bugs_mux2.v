module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    // output out  );
    output  [7:0] out);

    // assign out = (~sel & a) | (sel & b);
    assign out = (~sel) ? b : a;

endmodule