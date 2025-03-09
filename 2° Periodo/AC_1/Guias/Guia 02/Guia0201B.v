/* 
  Guia_0201.v 
    801779 - Giuseppe Sena Cordeiro 
*/ 
module Guia_0201; 
  // define data 
    integer y = 7 ; // counter 
    integer x = 0;
    real power2 = 1.0; // power of 2 
    real temp_dec = 0.0;
    real dec [0:4];
    reg [0:4][7:0] b = {8'b00000011, 8'b01001000, 8'b10101000, 8'b11110100, 8'b11110010}; // binary (only fraction part, Big Endian) 

  // actions 
    initial begin : main 
      $display ( "Guia_0201 - Tests" ); 
      for (x = 0; x < 5; x = x + 1) begin
        temp_dec = 0.0;
        power2 = 1.0;
        y = 7;
        while ( y >= 0 ) begin 
          power2 = power2 / 2.0; 
          if ( b[x][y] == 1 ) 
          begin 
            temp_dec = temp_dec + power2; 
          end 
          y = y - 1;
        end 
        dec[x] = temp_dec;
      end 

      for (integer k = 0; k < 5; k++) begin
        $display("%d = %f", k + 1, dec[k]);
      end
    end // main 
endmodule // Guia_0201 
