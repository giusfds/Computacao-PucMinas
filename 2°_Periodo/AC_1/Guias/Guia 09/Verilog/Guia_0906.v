// Guia 08 main
// 801779 
// Giuseppe

`include "clock.v" 

module pulse1 ( signal, clock ); 
    input  clock; 
    output signal; 
    reg    signal; 
    
    always @ ( negedge clock ) 
    begin : pulse
        signal = 1'b1;
        #5  signal = 1'b0; 
    end 
endmodule 

module Guia_0906; 
    wire  clock; 
    clock clk ( clock ); 
    
    wire  p1; 
    pulse1 pls1 ( p1, clock ); 
    
    initial begin : main 
        $dumpfile ( "Guia_0906.vcd" ); 
        $dumpvars ( 1, clock, p1 ); 
        
        #480 $finish; 
    end 
endmodule 