// Guia 08 
// 801779 
// Giuseppe

`include "clock.v" 

module pulse1 ( signal, clock ); 
    input  clock; 
    output signal; 
    reg    signal; 
    
    always @ ( posedge clock ) 
    begin : pulse1
        signal = 1'b1; 
        #4  signal = 1'b0; 
        #4  signal = 1'b1; 
        #4  signal = 1'b0; 
        #4  signal = 1'b1; 
        #4  signal = 1'b0; 
    end 
endmodule 

module pulse2 ( signal, clock ); 
    input  clock; 
    output signal; 
    reg    signal; 
    
    always @ ( posedge clock ) 
    begin : pulse2
        signal = 1'b1; 
        #5  signal = 1'b0; 
    end 
endmodule 

module pulse3 ( signal, clock ); 
    input  clock; 
    output signal; 
    reg    signal; 
    
    always @ ( negedge clock ) 
    begin : pulse3
        signal = 1'b1; 
        #15 signal = 1'b0; 
        #15 signal = 1'b1; 
    end 
endmodule 

module pulse4 ( signal, clock ); 
    input  clock; 
    output signal; 
    reg    signal; 
    
    always @ ( negedge clock ) 
    begin : pulse4
        signal = 1'b1; 
        #20 signal = 1'b0; 
        #20 signal = 1'b1; 
        #20 signal = 1'b0; 
    end 
endmodule 

module Guia_0902; 
    wire  clock; 
    clock clk ( clock ); 
    
    wire  p1, p2, p3, p4; 
    pulse1   pls1   ( p1, clock ); 
    pulse2   pls2   ( p2, clock ); 
    pulse3   pls3   ( p3, clock ); 
    pulse4   pls4   ( p4, clock ); 
    
    initial begin : main 
        $dumpfile ( "Guia_0902.vcd" ); 
        $dumpvars ( 1, clock, p1, p2, p3, p4 ); 
        
        #480 $finish; 
    end 
endmodule 
