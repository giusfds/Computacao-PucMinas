// Guia 06
// Giuseppe
// 801779

module func_e (
    input wire x, y, z,
    output wire f
);
    assign f = (~x & ~y & ~z) | (~x & y & z) | (x & y & ~z) | (x & y & z);
endmodule