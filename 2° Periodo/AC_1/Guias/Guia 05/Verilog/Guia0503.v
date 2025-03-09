// Guia0503.v
// 801779
// Giuseppe Cordeiro

module Guia_0503(output s, input a, input b);

wire na, temp;

nor (na, a, a);

nor (temp, na, b); // temp = ~(~a | b)
nor (s, temp, temp); // s = ~(temp)

endmodule

module test_Guia_0503;
  reg a, b;
  wire s;
  
  // Instanciação do módulo a ser testado
  Guia_0503 dut (.s(s), .a(a), .b(b));
  
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
