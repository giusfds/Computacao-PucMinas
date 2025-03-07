// Guia 08 
// 801779 
// Giuseppe

module clock ( output clk ); 
    reg clk;
    
    initial begin : start
    clk = 1'b0; 
    end 

    always begin : clock 
        #12 clk = ~clk; 
    end 
endmodule 

module Guia_0900; 
    wire  clk; 
    clock CLK1 ( clk ); 
    
    initial begin : main 
        $dumpfile ( "Guia_0900.vcd" ); 
        $dumpvars; 
        #120 $finish; 
    end 
endmodule