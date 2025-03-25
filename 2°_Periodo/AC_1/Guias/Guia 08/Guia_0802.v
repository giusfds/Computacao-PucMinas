// Guia 08 
// 801779 
// Giuseppe

module halfDiff ( output carry, output diff, input a, input b ); 
    wire not_a;
    not NOT0 ( not_a, a );
    xor XOR0 ( diff, a, b ); 
    and AND0 ( carry, not_a, b ); 
endmodule // halfDiff 

module fullDiff ( output carry, output diff, input a,  input b,  input carryOut ); 
    wire w1, w2, w3;
    halfDiff HD0 ( w1, w2, a, b );
    halfDiff HD1 ( w3, diff, w2, carryOut );
    or OR1 ( carry, w1, w3 );
endmodule // fullDiff 

module Guia_0802; 
    reg  [4:0] x;  
    reg  [4:0] y; 
    wire [4:0] carry; 
    wire [5:0] dif;   

    fullDiff FD0 ( carry[0], dif[0], x[0], y[0], 1'b0     ); 
    fullDiff FD1 ( carry[1], dif[1], x[1], y[1], carry[0] ); 
    fullDiff FD2 ( carry[2], dif[2], x[2], y[2], carry[1] ); 
    fullDiff FD3 ( carry[3], dif[3], x[3], y[3], carry[2] ); 
    fullDiff FD4 ( carry[4], dif[4], x[4], y[4], carry[3] ); 
    assign dif[5] = carry[4];    

    initial begin : start
        x = 5'b00000;
        y = 5'b00000;
    end 

    initial begin : main 
        $display( " x   -   y   =   dif" );
        $monitor( "%b - %b = %b", x, y, dif );
        for( integer i = 0; i < 32; i++ ) begin
            { x } = i;
            { y } = i;
            #1;
        end 
    end 
endmodule // Guia_0802
