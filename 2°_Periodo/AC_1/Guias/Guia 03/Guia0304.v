/*
  Guia_0304.v
  801779
  Giuseppe Sena Cordeiro
*/
module Guia_0304;
// define data
  reg signed [5:0] a = 6'b11001;    // 11001(2)
  reg signed [5:0] b = 6'b01101;    // 1101(2)
  reg signed [5:0] c = 6'b001010;   // 312(4) convertido para binário
  reg signed [7:0] d = 0;           // binary para armazenar o resultado
  reg signed [7:0] e = 0;           // binary para armazenar o resultado
  reg signed [7:0] f = 0;           // binary para armazenar o resultado
  reg signed [7:0] g = 0;           // binary para armazenar o resultado

// actions
  initial begin : main
    $display ( "Guia_0304 - Tests" );
    
    // a) 11001(2) - 1101(2)
    d = a - b; 
    $display ( "a = %5b = %d", a, a );
    $display ( "b = %5b = %d", b, b );
    $display ( "d = a - b = %5b - %5b = %5b = %d", a, b, d, d );

    // b) 101,1101(2) - 10,01(2)
    // Para operações de ponto fixo, use o formato ajustado
    d = (6'b101110) - (6'b010010); // Ajustado para alinhamento de vírgulas
    $display ( "101.1101(2) - 10.0100(2) = %6b = %d", d, d );
    
    // c) 312(4) - 231(4)
    d = a - c;
    $display ( "c = %6b = %d", c, c );
    $display ( "d = a - c = %6b - %6b = %6b = %d", a, c, d, d );

    // d) 376(8) - 267(8)
    // Convertendo 376(8) para binário
    f = 8'b01111110; // 376(8) em binário
    g = 8'b01000111; // 267(8) em binário
    d = f - g;
    $display ( "376(8) - 267(8) = %8b - %8b = %8b = %d", f, g, d, d );
    
    // e) 7D2(16) - A51(16)
    // Convertendo para binário
    f = 8'b0111_1101_0010; // 7D2(16) em binário
    g = 8'b1010_0101_0001; // A51(16) em binário
    d = f - g;
    $display ( "7D2(16) - A51(16) = %12b - %12b = %12b = %d", f, g, d, d );

  end // main

endmodule // Guia_0304
