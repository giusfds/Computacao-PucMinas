/*
Guia0203B
Giuseppe Sena Cordeiro
801779
*/


module Guia_0203;
    // define data
    reg [7:0] b1  = 8'b01010100 ; // fraction part
    reg [7:0] b2  = 8'b10011100 ; // fraction part
    reg [7:0] b3  = 8'b10101000 ; // fraction part
    reg [7:0] b4  = 8'b11000100 ; // fraction part
    reg [7:0] b41 = 8'b00000001 ; // decimal  part
    reg [7:0] b5  = 8'b10110000 ; // fraction part
    reg [7:0] b51 = 8'b00001101 ; // decimal  part
    // actions
    initial
        begin : main
            $display ( "Exercicio 03" );
            $display ( "b =  0.%o%o%o (4)    ", b1[7:6], b1[5:4], b1[3:2] );
            $display ( "b =  0.%o%o   (8)    ", b2[7:5], b2[4:2] );
            $display ( "b =  0.%x%x   (16)   ", b3[7:4], b3[3:0] );
            $display ( "b =  %o.%o%o  (8)    ", b41[7:0], b4[7:5], b4[4:2] );
            $display ( "b =  %x.%x    (16)   ", b51[7:0], b5[7:4] );
        end // main
endmodule // Guia_0203