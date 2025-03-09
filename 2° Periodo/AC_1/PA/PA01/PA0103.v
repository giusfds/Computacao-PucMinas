// PA 1 
// 801779 
// Giuseppe
module MUX3(
    input a, 
    input b, 
    input c,
    output y
);

wire mux1_out, mux2_out, not_a, not_b, not_c;

not (not_a, a);
not (not_b, b);
not (not_c, c);

assign mux1_out = (c) ? a : b;

assign mux2_out = (c) ? not_b : not_a;

assign y = (not_c) ? mux2_out : mux1_out;

endmodule


module Testbench;
    reg a, b, c;
    wire y;
    
    MUX3 mux(a, b, c, y);
    
    initial begin
        $display("A B C | Y");
        $monitor("%b %b %b | %b", a, b, c, y);
        
        a = 0; b = 0; c = 0; #10;
        a = 0; b = 0; c = 1; #10;
        a = 0; b = 1; c = 0; #10;
        a = 0; b = 1; c = 1; #10;
        a = 1; b = 0; c = 0; #10;
        a = 1; b = 0; c = 1; #10;
        a = 1; b = 1; c = 0; #10;
        a = 1; b = 1; c = 1; #10;
        
        $finish;
    end
endmodule
