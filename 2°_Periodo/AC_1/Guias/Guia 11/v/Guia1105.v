// Giuiseppe
// 801779
// Guia 11

module guia_1105 (y, x, clk, reset);
  output reg y;
  input x;
  input clk;
  input reset;
  
  parameter start = 3'b000,
            s0 = 3'b001,
            s01 = 3'b010,
            s010 = 3'b011,
            s1 = 3'b100,
            s10 = 3'b101,
            s101 = 3'b110;

  reg [2:0] E1;  
  reg [2:0] E2;  

  always @(x or E1) begin
    case (E1)
      start:
        if (x)
          E2 = s1;    
        else
          E2 = s0;    
      
      s0:
        if (x)
          E2 = s01;  
        else
          E2 = s0;    

      s01:
        if (!x)
          E2 = s010;  
        else
          E2 = s1;    
      
      s010: 
        E2 = start;   

      s1:
        if (!x)
          E2 = s10;   
        else
          E2 = s1;    

      s10:
        if (x)
          E2 = s101;  
        else
          E2 = s0;    

      s101:
        E2 = start;   

      default:
        E2 = start;   
    endcase
  end

  always @(posedge clk or negedge reset) begin
    if (!reset)
      E1 <= start;    
    else
      E1 <= E2;       
  end

  always @(E1) begin
    if (E1 == s010 || E1 == s101)
      y = 1;          
    else
      y = 0;          
  end
endmodule // Guia_1105