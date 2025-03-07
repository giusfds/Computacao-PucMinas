// Guia 13 
// 801779 
// Giuseppe


`include "jkff.v" 

module Guia_1306;
    reg clk, clear;
    reg preset;  
    wire [4:0] q; 

    jkff JKFF1 (q[0], , 1'b1, 1'b0, clk, preset, clear); 
    jkff JKFF2 (q[1], , q[0], ~q[0], clk, 1'b0, clear);
    jkff JKFF3 (q[2], , q[1], ~q[1], clk, 1'b0, clear);
    jkff JKFF4 (q[3], , q[2], ~q[2], clk, 1'b0, clear);
    jkff JKFF5 (q[4], , q[3], ~q[3], clk, 1'b0, clear);

    assign q[0] = q[4] & clk;

    initial begin : main
        $display("Guia_1306 - Teste");
        $display(" clk    output");
        clk = 0;
        clear = 1;
        preset = 1; 
        #5 clear = 0;
        #5 preset = 0;
        #100 
        $finish;
    end 

    always
        #5 clk = ~clk;

    always @(posedge clk) begin
        $display(" %3d    %b", $time, q);
    end 
endmodule // jkff
