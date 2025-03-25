// guia 06
// Giuseppe 
// 801779

module func_d (
  input X, Y, W, Z,
  output F
);

  assign F = (X | Y | W) & (X | Z);

endmodule