module top_module();
    reg clk_tb;
    reg in_tb;
    reg [2:0] s_tb;
    reg out;

    initial begin
        clk_tb = 1'b0;
        in_tb = 1'b0;
        s_tb = 3'd2;
    end

    always begin
        #5 clk_tb = ~clk_tb;
    end

    initial begin
        #10 s_tb = 3'd6;
        #10 s_tb = 3'd2;
            in_tb = 1'b1;
        #10 s_tb = 3'd7;
            in_tb = 1'b0;
        #10 s_tb = 3'd0;
            in_tb = 1'b1;
        #30 in_tb = 1'b0;
    end

    q7 q7_u1(
        .clk(clk_tb),
        .in(in_tb),
        .s(s_tb),
        .out(out)
    );
endmodule