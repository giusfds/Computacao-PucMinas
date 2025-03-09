// Guia 07
// 801779 
// Giuseppe

module f0703_and_nand( output a, output b, input x, input y );
    and AND1 ( a, x, y );
    nand NAND1 ( b, x, y );
endmodule

module f0703_or_nor( output a, output b, input x, input y );
    or OR1 ( a, x, y );
    nor NOR1 ( b, x, y );
endmodule

module mux ( output z, input a, input b, input select );
    wire not_select, sa, sb;
    not NOT1 ( not_select, select );
    and AND1 ( sa, a, not_select );
    and AND2 ( sb, b, select );
    or OR1 ( z, sa, sb );
endmodule

module Guia_0703;
    reg x = 0, y = 0, s1 = 0, s2 = 0;
    wire z1, z2, z3, a, b, c, d;
    integer i = 0;
    f0703_and_nand AND_NAND ( a, b, x, y );
    f0703_or_nor OR_NOR ( c, d, x, y );
    mux MUX1 ( z1, b, a, s1 );
    mux MUX2 ( z2, d, c, s1 );
    mux MUX3 ( z3, z1, z2, s2 );
    initial begin: start
        x = 1'b0; y = 1'b0; s1 = 1'b0; s2 = 1'b0;
    end
    initial begin : main
        $display("   x    y   AND NAND  s1   OR   NOR  s2  MUX1 MUX2 MUX3");
        $monitor("%4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b", x, y, a, b, s1, c, d, s2, z1, z2, z3);
        for (i = 0; i < 4; i = i + 1) begin
            { x, y } = i;
            #1;
        end
    end
endmodule
