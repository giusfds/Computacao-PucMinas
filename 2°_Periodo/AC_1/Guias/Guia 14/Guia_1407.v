// Guia 14 
// 801779 
// Giuseppe

module twisted_ring_shift_register_right_5bit(
    input clk,
    input rst,
    input ld, 
    input [4:0] data_in, 
    output reg [4:0] q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 5'b0;
        else if (ld)
            q <= data_in;
        else
            q <= {q[0], q[4:1]};
    end
endmodule //end Guia_1407
