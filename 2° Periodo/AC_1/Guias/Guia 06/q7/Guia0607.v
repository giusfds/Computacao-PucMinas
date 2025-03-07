// guia 06
// Giuseppe
// 801779

module FXYZ (output S1, input  X, input Y, input Z); 
    assign S1 = ( X | ~Y | ~Z ) & (~X | Y |  Z) & ( X | ~Y | Z ); 
endmodule 