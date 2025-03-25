// guia 06
// Giuseppe 
// 801779

module fwxyz (output s1, input w, input  x, input y, input z); 
    assign s1 = (w & x & y & z) | (w & x & ~y & ~z) | (w & ~x & ~y & z) | (~w & ~x & y & ~z); 
endmodule // fwxyz