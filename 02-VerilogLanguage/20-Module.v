module top_module ( input a, input b, output out );

    mod_a mod_a_u1(
        .in1(a),
        .in2(b),
        .out(out)
    );
    
endmodule