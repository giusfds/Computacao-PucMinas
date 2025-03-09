// Guia 08 
// 801779 
// Giuseppe
module NAND_XOR_NOR(
    input a,
    input b,
    output y
);

wire xor_ab, not_a, not_b, nor_ab, nand_final;

xor (xor_ab, a, b);

not (not_a, a);
not (not_b, b);

nor (nor_ab, not_a, not_b);

nand (nand_final, xor_ab, nor_ab);

assign y = nand_final;

endmodule

module Testbench;
    reg a, b;
    wire y;
    
    NAND_XOR_NOR nand_xor_nor_inst(a, b, y);
    
    initial begin
        $display("A B | Y");
        $monitor("%b %b | %b", a, b, y);
        
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        
        $finish;
    end
endmodule
