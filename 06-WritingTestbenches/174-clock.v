module top_module ( );

    reg clk_tb;

    initial begin
        clk_tb = 0;
    end
    
    always begin
            #5 clk_tb = ~clk_tb;
    end
    
    dut dut_u1(
        .clk(clk_tb)
    );

endmodule