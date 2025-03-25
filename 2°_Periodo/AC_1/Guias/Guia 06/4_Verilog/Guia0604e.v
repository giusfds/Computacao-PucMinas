// guia 06
// Giuseppe 
// 801779

module func_e (
  input X, Y, W, Z,
  output F
);

  assign F = (Y & W) | (X & W & Z);

endmodule