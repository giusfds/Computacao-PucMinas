// guia 07
// 801779
// giuseppe

module f0702( output a, output b, input x, input y );
    or OR1 ( a, x, y );
    nor NOR1 ( b, x, y );
endmodule

module mux ( output z, input a, input b, input select );
    wire not_select, sa, sb;
    not NOT1 ( not_select, select );
    and AND1 ( sa, b, not_select );
    and AND2 ( sb, a, select );
    or OR1 ( z, sa, sb );
endmodule

module Guia_0702;
    reg x = 0, y = 0, s = 0;
    wire z, a, b;
    integer i = 0;
    f0702 MOD ( a, b, x, y );
    mux MUX ( z, a, b, s );
    initial begin: start
        x=1'b0; y=1'b0; s=1'b0;
    end
    initial begin : main
        $display( "   x    y    s   OR   NOR  MUX" );
        $monitor("%4b %4b %4b %4b %4b %4b", x, y, s, a, b, z );
        for (i = 0; i < 4; i = i + 1) begin
            { x, y } = i;
            s = ~s;
            #1;
        end
    end
endmodule
