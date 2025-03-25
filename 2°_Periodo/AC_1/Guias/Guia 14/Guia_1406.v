// Guia 14 
// 801779 
// Giuseppe

module circular_shift_register_left_5bit(
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
            q <= {q[3:0], q[4]};
    end
endmodule//end Guia_1406
