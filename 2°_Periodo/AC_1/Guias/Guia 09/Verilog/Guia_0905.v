// Guia 08 
// 801779 
// Giuseppe

`include "clock.v" 

module pulse1 ( signal, clock ); 
    input  clock; 
    output signal; 
    reg    signal; 
    
    always @ ( posedge clock ) 
    begin : pulse
        #2  signal = 1'b1;  
        #2  signal = 1'b0;  
        #2  signal = 1'b1;
        #2  signal = 1'b0;
        #2  signal = 1'b1;
        #2  signal = 1'b0;
        #2  signal = 1'b1;
        #2  signal = 1'b0;
    end 
endmodule 

module pulse2 ( signal, clock ); 
    input  clock; 
    output signal; 
    reg    signal; 
    
    always @ ( posedge clock ) 
    begin : pulse
        signal = 1'b1;  
        #4  signal = 1'b0;  
    end 
endmodule

module Guia_0905; 
    wire  clock; 
    clock clk ( clock ); 
    
    wire  p1, p2; 
    pulse1 pls1 ( p1, clock ); 
    pulse2 pls2 ( p2, clock ); 
    
    initial begin : main 
        $dumpfile ( "Guia_0905.vcd" ); 
        $dumpvars ( 1, clock, p1, p2 ); 
        
        #480 $finish; 
    end 
endmodule 
