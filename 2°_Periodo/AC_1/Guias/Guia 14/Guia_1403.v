// Guia 14 
// 801779 
// Giuseppe

module circular_shift_register_right_6bit(
    input clk,
    input rst,
    input ld, 
    input data_in, 
    output reg [5:0] q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 6'b0;
        else if (ld)
            q <= {data_in, q[5:1]};
        else
            q <= {q[0], q[5:1]};
    end
endmodule //end Guia_1403
