// Guia 13 
// 801779 
// Giuseppe

`include "jkff.v"

module RingCounterTwisted5bit;
    reg clk, clear;
    reg H;  
    reg L;  

    jkff JKFF1 (q1, qn1, H, H, clk, L, clear);
    jkff JKFF2 (q2, qn2, H, H, q1, L, clear);
    jkff JKFF3 (q3, qn3, H, H, q2, L, clear);
    jkff JKFF4 (q4, qn4, H, H, q3, L, clear);
    jkff JKFF5 (q5, qn5, H, H, ~q4, L, clear); 

    initial begin : main
        $display("RingCounterTwisted5bit - Teste");
        $display(" clk   output");
        clk   = 1;
        H     = 1;
        L     = 0;
        clear = 1;
        #5 clear = 0;
        #100 $finish;
    end // main

    always
        #5 clk = ~clk;

    always @(posedge clk) begin
        $display(" %3d    %b%b%b%b%b", $time, q1, q2, q3, q4, q5);
    end
endmodule //end tff
