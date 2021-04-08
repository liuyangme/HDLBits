`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    wire temp1,temp2,temp3;
    
    assign temp1 = a & b;
    assign temp2 = c & d;
    assign temp3 = temp1 | temp2;

    assign out = temp3;
    assign out_n =~ temp3;

endmodule