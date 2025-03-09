// guia 07
// 801779
// giuseppe

module f0701( output a, output b, input x, input y );
    and AND1 ( a, x, y );
    nand NAND1 ( b, x, y );
endmodule

module mux ( output z, input a, input b, input select );
    wire not_select, sa, sb;
    not NOT1 ( not_select, select );
    and AND1 ( sa, b, not_select );
    and AND2 ( sb, a, select );
    or OR1 ( z, sa, sb );
endmodule

module Guia_0701;
    reg x = 0, y = 0, s = 0;
    wire z, a, b;
    reg [2:0]i;
    f0701 MOD ( a, b, x, y );
    mux MUX ( z, a, b, s );
    initial begin: start
        x=1'b0; y=1'b0; s=1'b0;
    end
    initial begin : main
        $display( "   x    y    s   AND NAND  MUX" );
        $monitor("%4b %4b %4b %4b %4b %4b", x, y, s, a, b, z );
        for ( i = 1; i < 4; i++ )
        begin
            #10 x=i[1]; y=i[0]; s = ~s;
        end
    end
endmodule
