/*
  Guia_0301.v
  801779
  Giuseppe Sena Cordeiro
*/
module Guia_0301;
  // define data
  reg [5:0] a = 6'b001_010;   // 1010 com 6 bits
  reg [7:0] b = 8'b0000_1101; // 1101 com 8 bits
  reg [5:0] c = 6'b101_001;   // 101001 com 6 bits
  reg [6:0] d = 7'b101_111;   // 101111 com 7 bits
  reg [7:0] e = 8'b0011_0100; // 110100 com 8 bits
  reg [5:0] f = 0;            // binary para armazenar o resultado
  reg [7:0] g = 0;            // binary para armazenar o resultado
  reg [5:0] h = 0;            // binary para armazenar o resultado
  reg [6:0] i = 0;            // binary para armazenar o resultado
  reg [7:0] j = 0;            // binary para armazenar o resultado
  // actions
  initial begin : main
    $display ( "Guia_0301 - Tests" );
    f = ~a;
    g = ~b;
    h = ~c;
    i = ~d;
    j = ~e;
    $display ( "a = %6b -> C1(a) = %6b -> C2(a) = %6b", a, f, f+1 );
    $display ( "b = %8b -> C1(b) = %8b -> C2(b) = %8b", b, g, g+1 );
    $display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b", c, h, h+1 );
    $display ( "d = %7b -> C1(d) = %7b -> C2(d) = %7b", d, i, i+1 );
    $display ( "e = %8b -> C1(e) = %8b -> C2(e) = %8b", e, j, j+1 );
  end // main

endmodule // Guia_0301
