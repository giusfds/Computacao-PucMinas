module tb_mux_a_not_a;
  reg a;   // Variável para 'a'
  reg c;   // Variável para 'c'
  wire y;  // Saída 'y'

  // Instancia o módulo
  mux_a_not_a uut (
    .a(a),
    .c(c),
    .y(y)
  );

  initial begin
    // Cabeçalho da tabela verdade
    $display("Tabela Verdade para mux(a, not(a), c)");
    $display("a  |  c  |  y");
    $display("----------------");

    // Gera todas as combinações de 'a' e 'c'
    a = 0; c = 0; #10 $display("%b  |  %b  |  %b", a, c, y);  // Teste para a=0, c=0
    a = 0; c = 1; #10 $display("%b  |  %b  |  %b", a, c, y);  // Teste para a=0, c=1
    a = 1; c = 0; #10 $display("%b  |  %b  |  %b", a, c, y);  // Teste para a=1, c=0
    a = 1; c = 1; #10 $display("%b  |  %b  |  %b", a, c, y);  // Teste para a=1, c=1

    $finish;  // Termina a simulação
  end

endmodule
