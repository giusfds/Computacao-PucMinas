// Guia 13 
// 801779 
// Giuseppe

`include "jkff.v" 

module Guia_1302;
    reg clk, clear;
    reg H; 
    reg L; 

    jkff JKFF1 (t1, o5, H, H, clk, L, clear);
    jkff JKFF2 (t2, o4, H, H, o5, L, clear);
    jkff JKFF3 (t3, o3, H, H, o4, L, clear);
    jkff JKFF4 (t4, o2, H, H, o3, L, clear);
    jkff JKFF5 (t5, o1, H, H, o2, L, clear);

    initial begin : main
        $display("Guia_1302 - Teste");
        $display(" clk    output");

        clk = 1;
        H = 1;
        L = 0;
        clear = 1;
        #5 clear = 0;
        #320 
        $finish;
    end 

    always
        #5 clk = ~clk;

    always @(posedge clk) begin
        $display(" %3d    %d%d%d%d%d", $time, o1, o2, o3, o4, o5);
    end 
endmodule // Guia_1301
