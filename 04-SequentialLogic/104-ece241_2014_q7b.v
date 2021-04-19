module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //

    bcdcount counter0 (clk, reset, c_enable[0]/*, ... */);
    bcdcount counter1 (clk, reset, c_enable[1]/*, ... */);

endmodule