/*
Guia0202B.v
Giuseppe Sena Cordeiro
801779
*/

module Guia0202B;
  real a = 0,375000;
  real b = 2,125000;
  real c = 3,625000; 
  real d = 5,031250;
  real e = 6,750000;

  // tentativa de fazer uma funcao
  task printaBinarioFracao;
    input integer inicio;
    input reg [0:9]binario;
    integer i;
    begin
      $write(".");
      // printa o binario da parte fracionaria do numero
      for (i = inicio; i >= 0; i = i--) begin
        $write("%b", binario[i]);
      end
      // printa o binario da parte inteira do numero
      $write("(2)\n");
    end
  endtask // printaBinarioFracao

  task doubleBin;
    input real number;
	  reg[9:0] bin;
	  reg[9:0] temp;
	  integer array [0:9];
	  integer parteInteira;
	  integer i, j, k, p;
	  real parteFracionaria;
	  real auxiliar;
	  begin
	  	parteInteira = number;
	  	if(parteInteira > number)begin
	  		parteInteira--;
	  		end
	  	temp = parteInteira;
	  	parteFracionaria = number - parteInteira;
      i = 0;
      p = 0;
	  	while(parteFracionaria != 0.0)begin
	  		auxiliar = parteFracionaria*2;
	  		parteInteira = auxiliar;
	  		if(parteInteira > auxiliar)begin
	  			parteInteira--;
	  			end
	  		parteFracionaria = auxiliar - parteInteira;
	  		array[i] = parteInteira;
	  		i++;
	  		end
	  		k = i - 1;
	  	while(i-1 >= 0)begin
	  		bin[p] = array[i-1];
	  		$display("bin = ",bin[p]);
	  		i--;
	  		p++;
	  		end
	  	$write("Conversão de: %f(10) PARA:",number);
	  	$write("%b",temp);
	  	printBinaryFractionalPart(k,bin);	
	  end
  endtask // doubleBin


initial begin
  doubleBin(a);
  doubleBin(b);
  doubleBin(c);
  doubleBin(d);
  doubleBin(e);
end // initial


endmodule // Guia0202b