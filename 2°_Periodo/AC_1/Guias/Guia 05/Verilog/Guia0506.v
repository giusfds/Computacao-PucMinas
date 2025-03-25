// Guia0506.v
// 801779
// Giuseppe Cordeiro

module Guia_0506(output s, input a, input b);

wire n1, n2, n3, n4;

nand (n1, a, b);     // n1 = ~(a & b)
nand (n2, a, n1);    // n2 = ~(a & ~n1) = a & ~b
nand (n3, b, n1);    // n3 = ~(b & ~n1) = ~a & b
nand (n4, n2, n3);   // n4 = ~(n2 & n3) = a ^ b

nand (s, n4, n4);    // s = ~(a ^ b)

endmodule

module test_Guia_0506;
  reg a, b;
  wire s;
  
  // Instanciação do módulo a ser testado
  Guia_0506 dut (.s(s), .a(a), .b(b));
  
  // Testes
  initial begin
    $display("a b | s");
    $monitor("%b %b | %b", a, b, s);

    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $finish;
  end
endmodule
