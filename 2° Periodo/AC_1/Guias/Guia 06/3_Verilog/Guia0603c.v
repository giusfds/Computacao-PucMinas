// Guia 06
// Giuseppe
// 801779

module func_b (
    input wire x, y, w, z,
    output wire f
);
    assign f = (~x & ~y & ~w & ~z) | (~x & ~y & w & ~z) | (~x & ~y & w & z) | (~x & y & ~w & z) | (~x & y & w & z) | (x & y & ~w & ~z) | (x & y & w & z);
endmodule