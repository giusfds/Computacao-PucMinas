module tb_logica_expressao;
  reg x;   // Variável para 'x'
  reg y;   // Variável para 'y'
  wire z;  // Saída 'z'

  // Instancia o módulo
  logica_expressao uut (
    .x(x),
    .y(y),
    .z(z)
  );

  initial begin
    // Cabeçalho da tabela verdade
    $display("Tabela Verdade para (x'.y)' . (x'.y')");
    $display("x  |  y  |  z");
    $display("------------");

    // Gera todas as combinações de 'x' e 'y'
    x = 0; y = 0; #10 $display("%b  |  %b  |  %b", x, y, z);
    x = 0; y = 1; #10 $display("%b  |  %b  |  %b", x, y, z);
    x = 1; y = 0; #10 $display("%b  |  %b  |  %b", x, y, z);
    x = 1; y = 1; #10 $display("%b  |  %b  |  %b", x, y, z);

    $finish;  // Termina a simulação
  end

endmodule
