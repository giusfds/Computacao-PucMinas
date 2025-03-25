// Guia 14 
// 801779 
// Giuseppe

module parallel_to_serial_6bit(
    input clk,
    input rst,
    input ld, 
    input [5:0] data_in,
    output reg serial_out
);
    reg [5:0] shift_reg;

    always @(posedge clk or posedge rst) begin
        if (rst)
            shift_reg <= 6'b0;
        else if (ld)
            shift_reg <= data_in;
        else begin
            serial_out <= shift_reg[5];
            shift_reg <= {shift_reg[4:0], 1'b0};
        end
    end
endmodule //end Guia_1405
