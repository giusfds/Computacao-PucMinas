// Guia0505.v
// 801779
// Giuseppe Cordeiro

module Guia_0505(output s, input a, input b);

wire na, nb, n1, n2;

nor (na, a, a);
nor (nb, b, b);

nor (n1, a, b);   // n1 = ~(a | b)
nor (n2, na, nb); // n2 = ~(~a | ~b)
nor (s, n1, n2);  // s = ~(n1 | n2) = a xnor b

endmodule

module test_Guia_0505;
  reg a, b;
  wire s;
  
  Guia_0505 dut (.s(s), .a(a), .b(b));
  
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
