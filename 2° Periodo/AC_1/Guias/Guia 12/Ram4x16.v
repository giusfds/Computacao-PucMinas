module ram4x16 (
    output [15:0] data_out, 
    input [1:0] address,   
    input rw,               
    input clock,            
    input clear,            
    input [15:0] data_in    
);

    wire [7:0] data_in_high, data_in_low;
    wire [7:0] data_out_high, data_out_low;

    assign data_in_high = data_in[15:8];
    assign data_in_low  = data_in[7:0];

    ram4x8 RAM4x8_low (
        .data_out(data_out_low),
        .address(address),
        .rw(rw),
        .clock(clock),
        .clear(clear),
        .data_in(data_in_low)
    );

    ram4x8 RAM4x8_high (
        .data_out(data_out_high),
        .address(address),
        .rw(rw),
        .clock(clock),
        .clear(clear),
        .data_in(data_in_high)
    );

    assign data_out = {data_out_high, data_out_low};

endmodule
