// Guia 06
// Giuseppe 
// 801779

module func_a (
  input X, Y, W, Z,
  output F
);

  assign F = (Y & W) | (X & W & Z);

endmodule