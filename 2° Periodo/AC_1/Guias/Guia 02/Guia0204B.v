/* 
  Guia_0204.v 
  Giuseppe Sena Cordeiro
  801779
*/ 
module Guia_0204; 
  // define data 
  real        x1 = 0.321;    // base 4
  real        x2 = 0.3D2;    // base 16
  real        x3 = 0.751;    // base 8
  real        x4 = 7.345;    // base 8
  real        x5 = 'hFA5E;   // base 16

  reg [7:0] b1 = 8'b1101_0101;  // 0.321(4) para binário (2)
  reg [7:0] b2 = 8'b1100_1001;  // 0.3D2(16) para quaternário (4)
  reg [7:0] b3 = 8'b1111_1011;  // 0.751(8) para binário (2)
  reg [7:0] b4 = 8'b1101_1001;  // 7.345(8) para quaternário (4)
  reg [15:0] b5 = 16'b1111_1010_0101_1110;  // F,A5E(16) para quaternário (4)

  integer q [3:0]; 
  // actions 
  iniial begin : main 
    // Conversão 0,321(4) para binário
    $display ( "x1 = %f (base 4)", x1 ); 
    $display ( "b1 = 0.%8b (base 2)", b1 );
    // Conversão 0,3D2(16) para quaternário
    $display ( "x2 = %f (base 16)", x2 ); 
    $display ( "b2 = 0.%2b %2b %2b (base 4)", b2[7:6], b2[5:4], b2[3:2], b2[1:0] );
    // Conversão 0,751(8) para binário
    $display ( "x3 = %f (base 8)", x3 ); 
    $display ( "b3 = 0.%8b (base 2)", b3 );
    // Conversão 7,345(8) para quaternário
    $display ( "x4 = %f (base 8)", x4 ); 
    $display ( "b4 = 0.%2b %2b %2b (base 4)", b4[7:6], b4[5:4], b4[3:2], b4[1:0] );
    // Conversão F,A5E(16) para quaternário
    $display ( "x5 = %h (base 16)", x5 ); 
    $display ( "b5 = 0.%2b %2b %2b %2b (base 4)", b5[15:12], b5[11:8], b5[7:4], b5[3:0] );
    end // main 
endmodule // Guia_0204
