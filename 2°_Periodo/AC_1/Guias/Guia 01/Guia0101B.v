/* 
    Guia_0101.v 
    801779 - Giuseppe Sena Cordeiro 
*/ 
module Guia_0101; 
// define data 
    integer   a = 26; // decimal 
    integer   b = 53; // decimal 
    integer   c = 713; // decimal 
    integer   d = 213; // decimal 
    integer   e = 365; // decimal 
    reg [7:0] bin =  0;  // binary   (bits - little endian) 

// actions 
    initial begin : main 
        $display ( "Guia_0101 - Tests" ); 
        $display ( "a = %d"  , a ); 
        $display ( "b = %d"  , b ); 
        $display ( "c = %d"  , c ); 
        $display ( "d = %d"  , d ); 
        $display ( "e = %d"  , e ); 
        bin = a; 
        $display ( "regA = %8b", b ); 
        bin = b; 
        $display ( "regB = %8b", b ); 
        bin = c; 
        $display ( "regC = %8b", b ); 
        bin = d; 
        $display ( "regD = %8b", b ); 
        bin = e; 
        $display ( "regE = %8b", b ); 
    end // main 

endmodule // Guia_0101