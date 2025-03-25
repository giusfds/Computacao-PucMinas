// Guia 08 
// 801779 
// Giuseppe

module halfAdder ( output carry, output sum, input a, input b ); 
    xor XOR0 ( sum , a, b ); 
    and AND0 ( carry, a, b ); 
endmodule // halfAdder 

module fullAdder ( output carry, output sum, input a,  input b,  input carryIn ); 
    wire w1,w2,w3;
    halfAdder HA0 (w1, w2, a, b );
    halfAdder HA1 (w3, sum, w2, carryIn );
    or        OR1 (carry, w1, w3 );
endmodule // fullAdder 

module c1 ( output [5:0] s, input [5:0] a );
    not NOT1 (s[0], a[0]);
    not NOT2 (s[1], a[1]);
    not NOT3 (s[2], a[2]);
    not NOT4 (s[3], a[3]);
    not NOT5 (s[4], a[4]);
    not NOT6 (s[5], a[5]);
endmodule // c1

module c2 ( output carryOut, output [5:0] s, input [5:0] a ); 
    wire c1, c2, c3, c4, c5;
    fullAdder FA0(c1, s[0], a[0], 1'b1, 1'b0 );
    fullAdder FA1(c2, s[1], a[1], 1'b0, c1);
    fullAdder FA2(c3, s[2], a[2], 1'b0, c2);
    fullAdder FA3(c4, s[3], a[3], 1'b0, c3);
    fullAdder FA4(c5, s[4], a[4], 1'b0, c4);
    fullAdder FA5( carryOut, s[5], a[5], 1'b0, c5);
endmodule // c2 

module Guia_0805; 
    reg  [5:0] x; 
    wire [5:0] x_c1; 
    wire [5:0] x_c2; 
    wire carryOut;

    c1 C1 ( x_c1, x );
    c2 C2 ( carryOut, x_c2, x_c1 );

    initial begin : start
        x = 6'b000000;
    end 

    initial begin : main 
        $display( "  x   ->  (±)c2" );
        $monitor( "%b -> (%b)%b", x, carryOut, x_c2 );
        for( integer i = 0; i < 64; i++ ) begin
            { x } = i;
            #1;
        end 
    end 
endmodule // Guia_0805
