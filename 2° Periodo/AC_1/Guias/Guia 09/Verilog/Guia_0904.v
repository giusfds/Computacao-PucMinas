// Guia 08 
// 801779 
// Giuseppe

`include "clock.v" 

module pulse ( signal, clock ); 
    input  clock; 
    output signal; 
    reg    signal; 
    
    always @ ( posedge clock ) 
    begin : pulse
        signal = 1'b1;
        #2  signal = 1'b0; 
        #2  signal = 1'b1; 
        #2  signal = 1'b0;
        #2  signal = 1'b1;
        #2  signal = 1'b0;
    end 
endmodule 

module Guia_0904; 
    wire  clock; 
    clock clk ( clock ); 
    
    wire  p1; 
    pulse pls1 ( p1, clock ); 
    
    initial begin : main 
        $dumpfile ( "Guia_0904.vcd" ); 
        $dumpvars ( 1, clock, p1 ); 
        
        #480 $finish; 
    end 
endmodule

