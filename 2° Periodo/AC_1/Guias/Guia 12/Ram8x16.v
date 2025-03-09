module ram8x16 (
    output [15:0] data_out, 
    input [2:0] address,    
    input rw,               
    input clock,            
    input clear,            
    input [15:0] data_in    
);
    wire [7:0] dmux_out;
    wire [15:0] ram_out[7:0]; 

    demux1x8 DMUX1x8 (
        .sel(address),
        .in(rw),
        .out(dmux_out)
    );

    ram1x16 RAM1x16_0 (.data_out(ram_out[0]), .address(address[2:0]), .rw(dmux_out[0]), .clock(clock), .clear(clear), .data_in(data_in));
    ram1x16 RAM1x16_1 (.data_out(ram_out[1]), .address(address[2:0]), .rw(dmux_out[1]), .clock(clock), .clear(clear), .data_in(data_in));
    ram1x16 RAM1x16_2 (.data_out(ram_out[2]), .address(address[2:0]), .rw(dmux_out[2]), .clock(clock), .clear(clear), .data_in(data_in));
    ram1x16 RAM1x16_3 (.data_out(ram_out[3]), .address(address[2:0]), .rw(dmux_out[3]), .clock(clock), .clear(clear), .data_in(data_in));
    ram1x16 RAM1x16_4 (.data_out(ram_out[4]), .address(address[2:0]), .rw(dmux_out[4]), .clock(clock), .clear(clear), .data_in(data_in));
    ram1x16 RAM1x16_5 (.data_out(ram_out[5]), .address(address[2:0]), .rw(dmux_out[5]), .clock(clock), .clear(clear), .data_in(data_in));
    ram1x16 RAM1x16_6 (.data_out(ram_out[6]), .address(address[2:0]), .rw(dmux_out[6]), .clock(clock), .clear(clear), .data_in(data_in));
    ram1x16 RAM1x16_7 (.data_out(ram_out[7]), .address(address[2:0]), .rw(dmux_out[7]), .clock(clock), .clear(clear), .data_in(data_in));
    
    mux8x1 MUX8x1 (
        .sel(address),
        .in0(ram_out[0]),
        .in1(ram_out[1]),
        .in2(ram_out[2]),
        .in3(ram_out[3]),
        .in4(ram_out[4]),
        .in5(ram_out[5]),
        .in6(ram_out[6]),
        .in7(ram_out[7]),
        .out(data_out)
    );

endmodule
