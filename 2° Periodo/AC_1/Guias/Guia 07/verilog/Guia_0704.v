// Guia 07
// 801779 
// Giuseppe

module f0704( output a, output b, output c, output d, input x, input y );
    or OR1 ( a, x, y );
    nor NOR1 ( b, x, y );
    xor XOR1 ( c, x, y );
    xnor XNOR1 ( d, x, y );
endmodule

module mux4x1 ( output z, input a, input b, input c, input d, input select1, input select2 );
    wire not_select1, not_select2, sa, sb, sc, sd;
    not NOT1 ( not_select1, select1 );
    not NOT2 ( not_select2, select2 );
    and AND1 ( sa, a, not_select1, not_select2 );
    and AND2 ( sb, b, not_select1, select2 );
    and AND3 ( sc, c, select1, not_select2 );
    and AND4 ( sd, d, select1, select2 );
    or OR1 ( z, sa, sb, sc, sd );
endmodule

module Guia_0704;
    reg x = 0, y = 0, s1 = 0, s2 = 0;
    wire z, a, b, c, d;
    f0704 LU ( a, b, c, d, x, y );
    mux4x1 MUX ( z, a, b, c, d, s1, s2 );
    initial begin: start
        x = 1'b0; y = 1'b0; s1 = 1'b0; s2 = 1'b0;
    end
    initial begin : main
        $display(" x y s1 s2 | OR  NOR XOR XNOR | MUX ");
        $monitor(" %b %b  %b  %b |  %b   %b   %b   %b  |  %b ", x, y, s1, s2, a, b, c, d, z);
        for (integer i = 0; i < 4; i = i + 1) begin
            {s1, s2} = i;
            for (integer j = 0; j < 4; j = j + 1) begin
                {x, y} = j;
                #1;
            end
        end
    end
endmodule
