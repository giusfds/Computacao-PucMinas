// R 01 
// 801779 
// Giuseppe
module logica (
  input wire a,  // Entrada 'a'
  input wire b,  // Entrada 'b'
  input wire c,  // Entrada 'c'
  output wire y  // Saída 'y'
);

  // Implementa a expressão (~a | b) & (b | ~c)
  assign y = (~a | b) & (b | ~c);

endmodule
