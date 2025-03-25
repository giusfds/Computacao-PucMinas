module ram8x8 (
    output o1, output o2, output o3, output o4, 
    output o5, output o6, output o7, output o8, 
    input [2:0] address, input rw, input clock, input clear, 
    input i1, input i2, input i3, input i4, input i5, input i6, input i7, input i8  
);

    wire [7:0] data_in;    
    reg [7:0] data_out;    
    wire sel4x8_1, sel4x8_2;  
    wire [7:0] o_ram1, o_ram2; 

    assign data_in = {i1, i2, i3, i4, i5, i6, i7, i8};

    
    assign sel4x8_1 = (~address[2]) & rw; 
    assign sel4x8_2 = (address[2]) & rw;  

    ram4x8 RAM4x8_1 (
        .o1(o_ram1[7]), .o2(o_ram1[6]), .o3(o_ram1[5]), .o4(o_ram1[4]), 
        .o5(o_ram1[3]), .o6(o_ram1[2]), .o7(o_ram1[1]), .o8(o_ram1[0]),
        .address(address[1:0]), .rw(sel4x8_1), .clock(clock), .clear(clear),
        .i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .i6(i6), .i7(i7), .i8(i8)
    );

    ram4x8 RAM4x8_2 (
        .o1(o_ram2[7]), .o2(o_ram2[6]), .o3(o_ram2[5]), .o4(o_ram2[4]), 
        .o5(o_ram2[3]), .o6(o_ram2[2]), .o7(o_ram2[1]), .o8(o_ram2[0]),
        .address(address[1:0]), .rw(sel4x8_2), .clock(clock), .clear(clear),
        .i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .i6(i6), .i7(i7), .i8(i8)
    );

    always @(*) begin
        if (~address[2])
            data_out = o_ram1;
        else
            data_out = o_ram2;  
    end

    assign o1 = data_out[7];
    assign o2 = data_out[6];
    assign o3 = data_out[5];
    assign o4 = data_out[4];
    assign o5 = data_out[3];
    assign o6 = data_out[2];
    assign o7 = data_out[1];
    assign o8 = data_out[0];

endmodule
