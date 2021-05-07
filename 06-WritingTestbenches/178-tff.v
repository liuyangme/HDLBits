module top_module ();
    
    reg clk_tb;
    reg reset_tb;
    reg t_tb;
    reg q_tb;

    initial begin
        clk_tb = 1'b0;
        reset_tb = 1'b0;
        t_tb = 1'b0;
    end

    always begin
        #5 clk_tb = ~clk_tb;
    end

    initial begin
        #10 t_tb = 1'b1;
        #10 reset_tb = 1'b1;
        #15 reset_tb = 1'b0;
    end


    tff tff_u1(
        .clk(clk_tb),
        .reset(reset_tb),
        .t(t_tb),
        .q(q_tb)
    );

endmodule