// Guia 14 
// 801779 
// Giuseppe

module shift_register_left_6bit(
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
            q <= {q[4:0], 1'b0};
    end
endmodule //end Guia_1401
