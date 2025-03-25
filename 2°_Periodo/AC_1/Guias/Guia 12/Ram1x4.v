`include "jkff.v"

module ram1x4 (
    output reg o1, output reg o2, output reg o3, output reg o4,
    input address, input rw, input clock, input clear,
    input i1, input i2, input i3, input i4
);
    wire ni1, ni2, ni3, ni4; 
    wire newadr; 
    wire s1, s2, s3, s4; 
    wire t;
    reg preset = 0; 

    not NOT_1 (ni1, i1);
    not NOT_2 (ni2, i2);
    not NOT_3 (ni3, i3);
    not NOT_4 (ni4, i4);
    and AND_1 (newadr, address, rw, clock); 

    jkff JKFF_1 (s1, t, i1, ni1, newadr, preset, clear);
    jkff JKFF_2 (s2, t, i2, ni2, newadr, preset, clear);
    jkff JKFF_3 (s3, t, i3, ni3, newadr, preset, clear);
    jkff JKFF_4 (s4, t, i4, ni4, newadr, preset, clear);

    always @(negedge clock or posedge clear) begin
        if (clear) begin
            o1 <= 0; o2 <= 0; o3 <= 0; o4 <= 0;
        end
        else if (address) begin
            o1 <= s1; o2 <= s2; o3 <= s3; o4 <= s4;
        end
        else begin
            o1 <= 1'bx; o2 <= 1'bx; o3 <= 1'bx; o4 <= 1'bx; 
        end
    end
endmodule
