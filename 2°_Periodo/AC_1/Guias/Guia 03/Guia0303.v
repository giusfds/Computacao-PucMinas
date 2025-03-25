/*
  Guia_0303.v
  801779
  Giuseppe Sena Cordeiro
*/
module Guia_0303;
// define data
  reg signed [5:0] a = 6'b10110;    // 10110(2)
  reg signed [5:0] b = 6'b110011;   // 110011(2)
  reg signed [6:0] c = 7'b100100;   // 100100(2)
  reg signed [6:0] d = 0;           // binary para armazenar o resultado
  reg signed [6:0] e = 0;           // binary para armazenar o resultado
  reg signed [7:0] f = 0;           // binary para armazenar o resultado

// actions
  initial begin : main
    $display ( "Guia_0303 - Tests" );
    
    // Para 'a'
    d = ~a + 1;   // C2(a)
    e = ~(a - 1); // C1(a)
    $display ( "a = %6b -> C1(a) = %6b -> C2(a) = %6b = %d = %d", a, e, d, e, d );
    
    // Para 'b'
    d = ~b + 1;   // C2(b)
    e = ~(b - 1); // C1(b)
    $display ( "b = %6b -> C1(b) = %6b -> C2(b) = %6b = %d = %d", b, e, d, e, d );
    
    // Para 'c'
    d = ~c + 1;   // C2(c)
    e = ~(c - 1); // C1(c)
    $display ( "c = %7b -> C1(c) = %7b -> C2(c) = %7b = %d = %d", c, e, d, e, d );
    
    // Para 'd'
    f = ~d + 1;   // C2(d)
    e = ~(d - 1); // C1(d)
    $display ( "d = %7b -> C1(d) = %7b -> C2(d) = %7b = %d = %d", d, e, f, e, f );
    
  end // main

endmodule // Guia_0303
