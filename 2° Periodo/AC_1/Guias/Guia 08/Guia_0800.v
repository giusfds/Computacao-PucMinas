// Guia 08 
// 801779 
// Giuseppe

module halfAdder ( output carry, output sum, input a, input b ); 
    xor XOR1 ( sum, a, b ); 
    and AND1 ( carry, a, b ); 
endmodule // halfAdder 

module fullAdder ( output carry, output sum, input a, input b, input carryIn ); 
    wire w1, w2, w3;
    halfAdder HA0 ( w1, w2, a, b );
    halfAdder HA1 ( w3, sum, w2, carryIn );
    or OR1 ( carry, w1, w3 );
endmodule // fullAdder 

module Guia_0800; 
    reg  [2:0] x; 
    reg  [2:0] y; 
    wire [2:0] carry; 
    wire [3:0] soma; 

    fullAdder FA0 ( carry[0], soma[0], x[0], y[0], 1'b0); 
    fullAdder FA1 ( carry[1], soma[1], x[1], y[1], carry[0]); 
    fullAdder FA2 ( carry[2], soma[2], x[2], y[2], carry[1]); 
    assign soma[3] = carry[2];    
    
    initial begin : start
        x = 3'b000;
        y = 3'b000;
    end 

    initial begin : main 
        $display( " x  +  y  = soma" );
        $monitor( "%b + %b = %b", x, y, soma );
        for( integer i = 0; i < 8; i++ ) begin
            { x } = i;
            { y } = i;
            #1;
        end 
    end 
endmodule // Guia_0800
