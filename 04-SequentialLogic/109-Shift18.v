module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 

    always @(posedge clk) begin
        if(load)
        begin
            q <= data;
        end
        else if(ena) 
        begin
            case(amount)
            2'b00: q[63:0] <= q[63:0] << 1;
            2'b01: q[63:0] <= q[63:0] << 8;
            
            2'b10: 
            begin 
                q[63:0] <= q[63:0] >> 1;
                if(q[63] == 1'b1)
                begin
                    q[63] <= 1'b1;
                end
            end
                
            2'b11: 
            begin
                q[63:0] <= q[63:0] >> 8;
                if(q[63] == 1'b1)
                begin
                    q[63:56] <= 8'b1111_1111;
                end
            end
            endcase
        end
    end

endmodule