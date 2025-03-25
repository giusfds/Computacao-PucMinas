// R 01 
// 801779 
// Giuseppe

module logica_expressao (
  input wire x,  // Entrada 'x'
  input wire y,  // Entrada 'y'
  output wire z  // Saída 'z'
);

  // Expressão: (x'.y)' . (x'.y')
  assign z = ~((~x & y)) & (~x & ~y);

endmodule
