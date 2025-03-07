// Guia05.v
// 801779
// Giuseppe Cordeiro

module Guia_0501(output s, input a, input b);
wire na, nb, temp;

nor (na, a, a);

nor (nb, b, b);

nor (temp, na, b); // temp = ~(~a | b)
nor (s, temp, temp); // s = ~(~(temp))

endmodule

module test_Guia_0501;
  reg a, b;
  wire s;
  
  // Instanciação do módulo a ser testado
  Guia_0501 dut (.s(s), .a(a), .b(b));
  
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
