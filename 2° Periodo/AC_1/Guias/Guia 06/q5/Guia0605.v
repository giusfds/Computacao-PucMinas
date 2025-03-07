// guia 06
// Giuseppe 
// 801779

module g0605 (
  output s1,
  output s2,
  input  x, y, z
);

  assign s1 = ( ( ~(~x | ~y) & ~(x & y) ) | ~( (y & z) | ~x ) );
  assign s2 = (x & ~z) | (x & ~y);

endmodule

module f0605 (
  output s, 
  input  x, 
  input  y,
  input  z
); 
  wire not_y; 
  wire not_z; 
  wire s1, s2;

  not NOT1 (not_y, y);
  not NOT2 (not_z, z);
  and AND1 (s1, x, not_z);
  and AND2 (s2, x, not_y);
  or  OR   (s, s1, s2);

endmodule

module Guia_0605; 
  reg   x = 0, y = 0, z = 0; 
  wire  s1, s2, s3; 
  integer i = 0; 

  g0605 EXP (s1, s2, x, y, z); 
  f0605 CIR (s3, x, y, z);

  initial begin: start 
    x = 1'bx; y = 1'bx; z = 1'bx;
  end

  initial begin: main  
    $display("Guia_0605 - Teste ");  
        
    $display("\nExpressao:");
    $display(" x  y  z = s1"); 
    $monitor("%2b %2b %2b = %2b", x, y, z, s1 ); 
    for (i = 0; i < 8; i = i + 1) begin
      { x, y, z } = i;
      #1;
    end

    $display("\nExpressao simplificada:");
    $display(" x  y  z = s2"); 
    $monitor("%2b %2b %2b = %2b", x, y, z, s2 ); 
    for (i = 0; i < 8; i = i + 1) begin
      { x, y, z } = i;
      #1;
    end

    $display("\nExpressao simplificada feita com Circuito:");
    $display(" x  y  z = s3"); 
    $monitor("%2b %2b %2b = %2b", x, y, z, s3 ); 
    for (i = 0; i < 8; i = i + 1) begin
      { x, y, z } = i;
      #1;
    end

  end

endmodule
