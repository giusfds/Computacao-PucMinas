// Guia0508.v
// 801779
// Giuseppe Cordeiro

module Guia_0508(output s, input a, input b);

wire na, nb, n1;

nand (na, a, a); // na = ~a
nand (nb, b, b); // nb = ~b

nand (n1, na, nb); // n1 = ~(~a & ~b)
nand (s, n1, n1);  // s = ~(n1) = ~(~(a & b)) = a & b

endmodule

module test_Guia_0508;
  reg a, b;
  wire s;
  
  Guia_0508 dut (.s(s), .a(a), .b(b));
  
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
