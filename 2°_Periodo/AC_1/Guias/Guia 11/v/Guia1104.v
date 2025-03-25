// Giuiseppe
// 801779
// Guia 11

module guia_1104 (y, x, clk, reset);
  output reg y;
  input x;
  input clk;
  input reset;
  
  parameter start = 3'b000,
            s1 = 3'b001,
            s2 = 3'b010,
            s3 = 3'b011,
            found = 3'b100;

  reg [2:0] E1;  
  reg [2:0] E2;
  always @(x or E1) begin
    case (E1)
      start: 
        if (!x)
          E2 = s1;  
        else
          E2 = start;  

      s1: 
        if (!x)
          E2 = s2;  
        else
          E2 = start;  

      s2: 
        if (!x)
          E2 = s3;  
        else
          E2 = start;  

      s3:
        if (!x)
          E2 = found;  
        else
          E2 = start;  

      found:
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
    if (E1 == found)
      y = 1;  
    else
      y = 0;  
  end
endmodule // Guia_1104