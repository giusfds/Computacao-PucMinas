/* 
  Guia_0205.v
  Giuseppe Sena Cordeiro
  801779
*/ 
module Guia_0205; 
  // define data 
  reg [15:0] a; 
  reg [15:0] b; 
  reg [15:0] c; 
  
  // actions 
  initial begin : main 
    $display ( "Guia_0205 - Tests" ); 
    
    // a.) 101,11(2) + 10,011(2)
    a = 16'b101_1100_0000_0000; 
    b = 16'b010_0110_0000_0000; 
    c = a + b;
    $display ( "a.) %b + %b = %b", a, b, c ); 
    // b.) 1000,101(2) - 10,01(2)
    a = 16'b1000_1010_0000_0000;
    b = 16'b0010_0100_0000_0000;
    c = a - b;
    $display ( "b.) %b - %b = %b", a, b, c );
    // c.) 101,101(2) * 10,101(2)
    a = 16'b101_1010_0000_0000; 
    b = 16'b010_1010_0000_0000; 
    c = a * b;
    $display ( "c.) %b * %b = %b", a, b, c );
    // d.) 10111,01(2) / 11,011(2)
    a = 16'b10111_0100_0000_0000; 
    b = 16'b0011_0110_0000_0000;  
    c = a / b;
    $display ( "d.) %b / %b = %b", a, b, c );
    // e.) 1101011(2) % 1101(2)
    a = 16'b0000_1101_0110_0000;  
    b = 16'b0000_0000_1101_0000;  
    c = a % b;
    $display ( "e.) %b %% %b = %b", a, b, c );
  end // main 

endmodule // Guia_0205
