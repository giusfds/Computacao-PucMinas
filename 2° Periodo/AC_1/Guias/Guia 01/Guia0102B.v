/* 
    Guia_0102.v 
    801779 - Giuseppe Sena Cordeiro 
*/ 
module Guia_0102; 
// define data 
    integer   bin = 0;       // decimal 
    reg [7:0] a = 8'b10101;  // binary (bits - little endian)
    reg [7:0] b = 8'b11011;  // binary (bits - little endian)
    reg [7:0] c = 8'b10010;  // binary (bits - little endian)
    reg [7:0] d = 8'b101011; // binary (bits - little endian)
    reg [7:0] e = 8'b110111; // binary (bits - little endian)

// actions 
    initial begin : main 
        $display ( "Guia_0102 - Tests" ); 
        $display ( "bin = %d"  , x ); 
        $display ( "a = %8b", a ); 
        $display ( "b = %8b", b ); 
        $display ( "c = %8b", c ); 
        $display ( "d = %8b", d ); 
        $display ( "e = %8b", e ); 
        x = a;
        $display ( "a = %d", a ); 
        x = b;
        $display ( "b = %d", b ); 
        x = c;
        $display ( "c = %d", c ); 
        x = d;
        $display ( "d = %d", d ); 
        x = e;
        $display ( "e = %d", e ); 
    end // main 

endmodule // Guia_0102 
