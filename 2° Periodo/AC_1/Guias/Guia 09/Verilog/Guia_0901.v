// Guia 08 
// 801779 
// Giuseppe

module clock ( output clk ); 
    reg clk; 
    
    initial begin : start
        clk = 1'b0; 
    end 
    
    always begin  : clock
        #12 clk = ~clk; 
    end 
endmodule 

module pulse ( signal, clock ); 
    input  clock; 
    output signal; 
    reg    signal; 
    
    always @ ( clock ) 
    begin : pulse
            signal = 1'b1; 
        #3  signal = 1'b0; 
        #3  signal = 1'b1; 
        #3  signal = 1'b0; 
    end 
endmodule 

module trigger ( signal, on, clock ); 
    input  on, clock; 
    output signal; 
    reg    signal; 

    always @ ( posedge clock & on ) 
    begin : trigger
        #60 signal = 1'b1; 
        #60 signal = 1'b0; 
    end 
endmodule 

module Guia_0901;

    wire   clock; 
    clock clk ( clock ); 
    
    wire  p1;
    pulse   pulse1  ( p1, clock ); 
    
    reg   p; 
    wire  t1; 
    trigger trigger1 ( t1, p, clock ); 
    
    initial begin : start
        p = 1'b0; 
    end 

    initial begin : main
        $dumpfile ( "Guia_0901.vcd" ); 
        $dumpvars ( 1, clock, p1, p, t1 ); 
        #060 p = 1'b1; 
        #120 p = 1'b0; 
        #180 p = 1'b1; 
        #240 p = 1'b0; 
        #300 p = 1'b1; 
        #360 p = 1'b0; 
        #376 $finish; 
    end 
endmodule 