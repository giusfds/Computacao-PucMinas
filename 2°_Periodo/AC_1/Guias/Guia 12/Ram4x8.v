module ram4x8 (
    output o1, output o2, output o3, output o4, 
    output o5, output o6, output o7, output o8, 
    input [1:0] address, input rw, input clock, input clear, 
    input i1, input i2, input i3, input i4, input i5, input i6, input i7, input i8  
);

    reg [7:0] mem0, mem1, mem2, mem3;  
    wire [7:0] data_in;    
    reg [7:0] data_out;    
    wire sel0, sel1, sel2, sel3;  

    assign data_in = {i1, i2, i3, i4, i5, i6, i7, i8};  

    assign sel0 = (~address[1] & ~address[0]) & rw;
    assign sel1 = (~address[1] & address[0]) & rw;
    assign sel2 = (address[1] & ~address[0]) & rw;
    assign sel3 = (address[1] & address[0]) & rw;

    always @(posedge clock) begin
        if (clear) begin
            mem0 <= 8'b0;
            mem1 <= 8'b0;
            mem2 <= 8'b0;
            mem3 <= 8'b0;
        end
        else begin
            if (sel0) mem0 <= data_in;  
            if (sel1) mem1 <= data_in;  
            if (sel2) mem2 <= data_in;  
            if (sel3) mem3 <= data_in;  
        end
    end

    always @(*) begin
        case (address)
            2'b00: data_out = mem0;
            2'b01: data_out = mem1;
            2'b10: data_out = mem2;
            2'b11: data_out = mem3;
            default: data_out = 8'b0;
        endcase
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
