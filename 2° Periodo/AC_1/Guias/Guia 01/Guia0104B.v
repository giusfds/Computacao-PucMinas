/* 
    Guia_0104.v 
    801779 - Giuseppe Sena Cordeiro 
*/ 
module Guia_Conversoes;
  // define data
  reg [5:0] b1 = 6'b10100; // 5 bits for the binary input
  reg [4:0] b2 = 5'b11010;
  reg [5:0] b3 = 6'b100111;
  reg [5:0] b4 = 6'b100101;
  reg [5:0] b5 = 6'b101101;
  
    // actions
    initial begin : main
      $display("Guia de Conversoes - Tests");
      $display("10100(2) = %h(16)", b1); // Conversion to hexadecimal
      $display("11010(2) = %o(8)", b2);  // Conversion to octal
      $display("100111(2) = %h(16)", b3); // Conversion to hexadecimal
      $display("100101(2) = %o(8)", b4);  // Conversion to octal
      $display("101101(2) = %h(16)", b5); // Conversion to hexadecimal
    end // main

endmodule // Guia_Conversoes
