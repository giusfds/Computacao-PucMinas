// Giuiseppe
// 801779
// Guia 11

`define found 1
`define notfound 0

module guia_1103 (y, x, clk, reset);
  output reg y;
  input x;
  input clk;
  input reset;
  
  parameter start = 3'b000,
            id1 = 3'b001,
            id10 = 3'b010,
            id100 = 3'b011
            found = 3'b100;

  reg [2:0] E1;  
  reg [2:0] E2;  

  always @(x or E1) begin
    case (E1)
      start: 
        if (x)
          E2 = id1;
        else
          E2 = start;

      id1: 
        if (!x)
          E2 = id10;
        else
          E2 = id1;

      id10: 
        if (x)
          E2 = id100;
        else
          E2 = start;

      id100: 
        if (!x)
          E2 = found;
        else
          E2 = id1;

      found:
        if (x)
          E2 = id1;  
        else
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
    case (E1)
      found: y = `found; 
      default: y = `notfound;
    endcase
  end
endmodule // Guia_1103