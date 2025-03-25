/*
  Guia_0302.v
  801779
  Giuseppe Sena Cordeiro
*/
module Guia_0302;
// define data
  reg [5:0] a = 6'b111001;   // 321(4) = 111001(2)
  reg [7:0] b = 8'b10110010; // B2(16) = 10110010(2)
  reg [5:0] c = 6'b101011;   // 231(4) = 101011(2)
  reg [9:0] d = 10'b00101100110; // 146(8) = 00101100110(2)
  reg [7:0] e = 8'b01101111; // 6F(16) = 01101111(2)
  reg [5:0] f = 0;            // binary para armazenar o resultado
  reg [7:0] g = 0;            // binary para armazenar o resultado
  reg [5:0] h = 0;            // binary para armazenar o resultado
  reg [9:0] i = 0;            // binary para armazenar o resultado
  reg [7:0] j = 0;            // binary para armazenar o resultado
// actions
  initial begin : main
    $display ( "Guia_0302 - Tests" );
    f = ~a;
    g = ~b;
    h = ~c;
    i = ~d;
    j = ~e;
    $display ( "a = %6b -> C1(a) = %6b -> C2(a) = %6b", a, f, f+1 );
    $display ( "b = %8b -> C1(b) = %8b -> C2(b) = %8b", b, g, g+1 );
    $display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b", c, h, h+1 );
    $display ( "d = %10b -> C1(d) = %10b -> C2(d) = %10b", d, i, i+1 );
    $display ( "e = %8b -> C1(e) = %8b -> C2(e) = %8b", e, j, j+1 );
  end // main

endmodule // Guia_0302
