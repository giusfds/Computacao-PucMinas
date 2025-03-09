module tb_mux_complexo;
  reg a;   // Variável para 'a'
  reg b;   // Variável para 'b'
  reg c;   // Variável para 'c'
  wire y;  // Saída 'y'

  // Instancia o módulo
  mux_complexo uut (
    .a(a),
    .b(b),
    .c(c),
    .y(y)
  );

  initial begin
    // Cabeçalho da tabela verdade
    $display("Tabela Verdade para mux(c, not(c), mux(a, not(a), b))");
    $display("a  |  b  |  c  |  y");
    $display("-------------------");

    // Gera todas as combinações de 'a', 'b', e 'c'
    a = 0; b = 0; c = 0; #10 $display("%b  |  %b  |  %b  |  %b", a, b, c, y);
    a = 0; b = 0; c = 1; #10 $display("%b  |  %b  |  %b  |  %b", a, b, c, y);
    a = 0; b = 1; c = 0; #10 $display("%b  |  %b  |  %b  |  %b", a, b, c, y);
    a = 0; b = 1; c = 1; #10 $display("%b  |  %b  |  %b  |  %b", a, b, c, y);
    a = 1; b = 0; c = 0; #10 $display("%b  |  %b  |  %b  |  %b", a, b, c, y);
    a = 1; b = 0; c = 1; #10 $display("%b  |  %b  |  %b  |  %b", a, b, c, y);
    a = 1; b = 1; c = 0; #10 $display("%b  |  %b  |  %b  |  %b", a, b, c, y);
    a = 1; b = 1; c = 1; #10 $display("%b  |  %b  |  %b  |  %b", a, b, c, y);

    $finish;  // Termina a simulação
  end

endmodule
