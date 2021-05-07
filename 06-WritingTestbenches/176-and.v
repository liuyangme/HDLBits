module top_module();

    reg [1:0] in_tb;
    reg out_tb;

    initial begin
        in_tb = 2'b00;
        #10 in_tb = 2'b01;
        #10 in_tb = 2'b10;
        #10 in_tb = 2'b11;
    end

    andgate andgate_u1(
        .in(in_tb),
        .out(out_tb)
        );
endmodule