// Giuiseppe
// 801779
// Guia 11

`include "Mealy_1101.v" 
`include "Moore_1101.v" 

module Guia_1100; 
    reg   clk, reset, x; 
    wire  m1, m2; 

    Mealy_1101  mealy1 ( m1, x, clk, reset ); 
    Moore_1101  moore1 ( m2, x, clk, reset ); 

    initial begin
    $display ( "Time     X   Mealy Moore" ); 
        clk   = 1; 
        reset = 0; 
        x     = 0; 

        #5   reset = 1; 
        #10  x = 1; 
        #10  x = 0; 
        #10  x = 1; 
        #20  x = 0; 
        #10  x = 1; 
        #10  x = 1; 
        #10  x = 0; 
        #10  x = 1; 

        #30 $finish; 
    end 

    always 
        #5 clk = ~clk; 

    always @( posedge clk ) begin 
        $display ( "%4d  %4b  %4b %5b", $time, x, m1, m2 ); 
    end 

endmodule // Guia_1100