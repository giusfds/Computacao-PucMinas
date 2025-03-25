// Guia 08 
// 801779 
// Giuseppe
module f(
    output s,
    input x,
    input y
);

wire w1, w2, w3, w4, w5;

not NOT_1(w1, x);

not NOT_2(w2, y);

and AND_1(w3, y, w1);

or OR_1(w4, w2, x);

not NOT_3(w5, w4);

and AND_2(s, w3, w5);

endmodule

module Testbench;
    reg x, y;
    wire s;

    f my_function(s, x, y);

    initial begin
        $display("X Y | S");
        $monitor("%b %b | %b", x, y, s);

        x = 0; y = 0; #10;
        x = 0; y = 1; #10;
        x = 1; y = 0; #10;
        x = 1; y = 1; #10;

        $finish;
    end
endmodule
