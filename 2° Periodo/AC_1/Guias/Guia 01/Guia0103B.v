/* 
    Guia_0103.v 
    801779 - Giuseppe Sena Cordeiro 
*/ 
module Guia_0103; 
// define data 
   integer   a = 64;    // decimal 
   integer   b = 53;    // decimal 
   integer   c = 77;    // decimal 
   integer   d = 153;   // decimal 
   integer   e = 753;   // decimal 
   reg [7:0] bin =  0;  // binary 

// actions 
    initial begin : main 
        $display ( "Guia_0103 - Tests" ); 
        $display ( "a = %d"  , a ); 
        $display ( "b = %d"  , b ); 
        $display ( "c = %d"  , c ); 
        $display ( "d = %d"  , d ); 
        $display ( "e = %d"  , e ); 
        $display ( "bin = %8b", b ); 
        a = x; 
        $display ( "a = %B (2) = %o (8) = %x (16) = %X (16)", a, a, a, a ); 
        b = x; 
        $display ( "b = %B (2) = %o (8) = %x (16) = %X (16)", b, b, b, b ); 
        c = x; 
        $display ( "c = %B (2) = %o (8) = %x (16) = %X (16)", c, c, c, c ); 
        d = x; 
        $display ( "d = %B (2) = %o (8) = %x (16) = %X (16)", d, d, d, d ); 
        e = x; 
        $display ( "e = %B (2) = %o (8) = %x (16) = %X (16)", e, e, e, e ); 
    end // main 
endmodule // Guia_0103