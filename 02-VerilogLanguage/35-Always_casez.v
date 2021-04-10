// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos  );

    always @(*) begin
        casez (in)
            8'bzzzz_zzz1: pos=3'b000;
            8'bzzzz_zz1z: pos=3'b001;
            8'bzzzz_z1zz: pos=3'b010;
            8'bzzzz_1zzz: pos=3'b011;
            8'bzzz1_zzzz: pos=3'b100;
            8'bzz1z_zzzz: pos=3'b101;
            8'bz1zz_zzzz: pos=3'b110;
            8'b1zzz_zzzz: pos=3'b111;
            default: pos=3'b000;
        endcase
    end 
endmodule