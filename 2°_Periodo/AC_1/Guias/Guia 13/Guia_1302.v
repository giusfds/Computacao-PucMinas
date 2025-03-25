// Guia 13 
// 801779 
// Giuseppe

`include "jkff.v" 

module Guia_1303;
    reg clk, clear;
    reg H; 
    reg L; 

    jkff JKFF1 (t1, s5, H, H, clk, L, clear);
    jkff JKFF2 (t2, s4, H, H, s5, L, clear);
    jkff JKFF3 (t3, s3, H, H, s4, L, clear);
    jkff JKFF4 (t4, s2, H, H, s3, L, clear);
    jkff JKFF5 (t5, s1, H, H, s2, L, clear);

    not NOT_5 (o5, s5);
    not NOT_4 (o4, s4);
    not NOT_3 (o3, s3);
    not NOT_2 (o2, s2);
    not NOT_1 (o1, s1);

    initial begin : main
        $display("Guia_1303 - Teste");
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
endmodule // Guia_1302
