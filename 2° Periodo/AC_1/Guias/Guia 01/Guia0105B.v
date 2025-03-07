/* 
  Guia_0105.v 
  801779 - Giuseppe Sena Cordeiro 
*/ 
module Guia_0105;
  // define data
  reg [7:0] s1[7:0] = "PUC-M.G.";
  reg [7:0] s2[6:0] = "2024-02";
  reg [7:0] s3[14:0] = "Belo Horizonte";
  reg [7:0] d[4:0] = {8'o156, 8'o157, 8'o151, 8'o164, 8'o145}; // "noite"
  reg [7:0] e[4:0] = {8'h4D, 8'h61, 8'h6E, 8'h68, 8'h61}; // "Manha"

  // actions
  initial begin : main
    $display("Guia_0105 - Tests");

    $display("PUC-M.G. =");
    for (int i = 0; i < 8; i = i + 1) begin
      $write("%h ", s1[i]);
    end
    $display("");

    $display("2024-02 =");
    for (int i = 0; i < 7; i = i + 1) begin
      $write("%h ", s2[i]);
    end
    $display("");

    $display("Belo Horizonte =");
    for (int i = 0; i < 15; i = i + 1) begin
      $write("%b ", s3[i]);
    end
    $display("");

    $display("156 157 151 164 145 (8) =");
    for (int i = 0; i < 5; i = i + 1) begin
      $write("%s ", d[i]);
    end
    $display("");

    $display("4D 61 6E 68 61 (16) =");
    for (int i = 0; i < 5; i = i + 1) begin
      $write("%s ", e[i]);
    end
    $display("");
  end // main
endmodule // Guia_0105
