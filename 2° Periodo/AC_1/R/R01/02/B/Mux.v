// R 01 
//801779 
// Giuseppe
module mux_complexo (
  input wire a,  // Entrada 'a'
  input wire b,  // Sinal de seleção do primeiro mux
  input wire c,  // Entrada 'c' para o segundo mux
  output wire y  // Saída 'y'
);

  wire mux_interno;

  assign mux_interno = (b) ? ~a : a;

  assign y = (mux_interno) ? ~c : c;

endmodule
