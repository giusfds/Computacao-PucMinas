// Guia 13 
// 801779 
// Giuseppe

`include "jkff.v" 

module Guia_1305;
    reg clk, clear;
    reg H; 
    reg L; 
    wire cl1, or_clear;

    or   OR_1  (or_clear, clear, cl1);
    jkff JKFF1 (o4, qn4, H, H, clk, L, or_clear);
    jkff JKFF2 (o3, qn3, H, H, qn4, L, or_clear);
    jkff JKFF3 (o2, qn2, H, H, qn3, L, or_clear);
    jkff JKFF4 (o1, qn1, H, H, qn2, L, or_clear);

    and AND_1 (cl1, ~o1, ~o2, ~o3, ~o4);

    initial begin : main
        $display("Guia_1305 - Teste");
        $display(" clk    output");
        clk = 1;
        H = 1;
        L = 0;
        clear = 1;
        #5 clear = 0;
        #100 
        $finish;
    end 

    always
        #5 clk = ~clk;

    always @(posedge clk) begin
        $display(" %3d    %d%d%d%d", $time, o1, o2, o3, o4);
    end 
endmodule // Guia_1304
