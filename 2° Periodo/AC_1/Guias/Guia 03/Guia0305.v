/* 
  Guia_0305.v 
  801779 Giuseppe Sena Cordeiro 
*/ 
module Guia_0305;
// define data 
  reg [7:0] a = 8'b11010100; // 110101(2)
  reg [7:0] b = 8'b00001011; // 1011(2)
  reg [7:0] c = 8'b10110010; // 3,1(8) -> 0011001,0(2) = 1011001,0(2) (2's complement)
  reg [7:0] d = 8'b00111001; // 213(4)  = 00111001(2)
  reg [7:0] e = 8'b00111101; // 3D(16)  = 00111101(2)
  reg [7:0] f = 8'b11000101; // C5(16)  = 11000101(2)
  reg [7:0] g = 8'b10110011; // 1011001(2)
  reg [7:0] h = 8'b01111110; // 7E(10)  = 01111110(2)
  reg [7:0] i = 8'b00101101; // 2D(16)  = 00101101(2)
  reg [7:0] resultA = 0; // for result storage
  reg [7:0] resultB = 0; // for result storage
  reg [7:0] resultC = 0; // for result storage
  reg [7:0] resultD = 0; // for result storage
  reg [7:0] resultE = 0; // for result storage

// actions 
  initial begin : main
    $display ( "Guia_0305 - Tests" );
    
    // Operation a
    resultA = a - b;
    $display("a.) 110101(2) – 1011(2) = %8b", resultA);

    // Operation b
    resultB = 8'b1011001_1 - c;
    $display("b.) 101,1001(2) – 3,1(8) = %8b", resultB);

    // Operation c
    resultC = d - e;
    $display("c.) 213(4) – 3D(16) = %8b", resultC);

    // Operation d
    resultD = f - g;
    $display("d.) C5(16) – 1011001(2) = %8b", resultD);

    // Operation e
    resultE = h - i;
    $display("e.) 7E(10) – 2D(16) = %8b", resultE);
  end // main
endmodule // Guia_0305
