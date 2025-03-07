// R 01 
// 801779 
// Giuseppe
module mux_a_not_a (
  input wire a,  // Entrada 'a'
  input wire c,  // Sinal de seleção 'c'
  output wire y  // Saída 'y'
);

  assign y = (c) ? ~a : a;  

endmodule
