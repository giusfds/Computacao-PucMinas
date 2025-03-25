// Guia0502.v
// 801779
// Giuseppe Cordeiro

module Guia_0502(output s, input a, input b);

wire nb, temp;

nand (nb, b, b);

nand (temp, a, nb);  // temp = ~(a & ~b)
nand (s, temp, temp);  // s = ~(~(temp)) = (a | ~b)

endmodule

module test_Guia_0502;
  reg a, b;
  wire s;
  
  // Instanciação do módulo a ser testado
  Guia_0502 dut (.s(s), .a(a), .b(b));
  
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
