// Guia 07
// 801779 
// Giuseppe

module f0705(
    output not_x, output not_y, 
    output and_out, output nand_out, 
    output or_out, output nor_out, 
    output xor_out, output xnor_out, 
    input x, input y
);
    not  NOT1  ( not_x, x );       // saída do NOT_X
    not  NOT2  ( not_y, y );       // saída do NOT_Y
    and  AND1  ( and_out, x, y );  // saída do AND
    nand NAND1 ( nand_out, x, y ); // saída do NAND
    or   OR1   ( or_out, x, y );   // saída do OR
    nor  NOR1  ( nor_out, x, y );  // saída do NOR
    xor  XOR1  ( xor_out, x, y );  // saída do XOR
    xnor XNOR1 ( xnor_out, x, y ); // saída do XNOR
endmodule // f0705

module mux7x1 (
    output z, 
    input not_x, input not_y, 
    input and_out, input nand_out, 
    input or_out, input nor_out, 
    input xor_out, input xnor_out, 
    input [2:0] select
);
    wire not_select0, not_select1, not_select2;
    wire and0, and1, and2, and3, and4, and5, and6, and7;
    
    not NOT1 (not_select0, select[0]);
    not NOT2 (not_select1, select[1]);
    not NOT3 (not_select2, select[2]);

    and AND1 (and0, not_x, not_select1, not_select2);
    and AND2 (and1, not_y, not_select1, not_select2);
    and AND3 (and2, and_out, select[0], not_select1, not_select2);
    and AND4 (and3, nand_out, not_select0, select[1], not_select2);
    and AND5 (and4, or_out, not_select0, not_select1, select[2]);
    and AND6 (and5, nor_out, select[0], select[1], not_select2);
    and AND7 (and6, xor_out, select[0], not_select1, select[2]);
    and AND8 (and7, xnor_out, select[0], select[1], select[2]);

    or OR1 (z, and0, and1, and2, and3, and4, and5, and6, and7); 
endmodule // mux7x1

module Guia_0705;
    reg  x = 0, y = 0;         // entradas
    reg  [2:0] select = 0;     // seleção
    wire z;                    // saída MUX
    wire not_x, not_y;         // saídas NOT_X/NOT_Y
    wire and_out, nand_out;    // saídas AND/NAND
    wire or_out, nor_out;      // saídas OR/NOR
    wire xor_out, xnor_out;    // saídas XOR/XNOR

    f0705 GATES (
        not_x, not_y, 
        and_out, nand_out, 
        or_out, nor_out, 
        xor_out, xnor_out, 
        x, y
    );
    mux7x1 MUX (
        z, 
        not_x, not_y, 
        and_out, nand_out, 
        or_out, nor_out, 
        xor_out, xnor_out, 
        select
    );

    initial begin: start
        x = 1'b0; y = 1'b0; select = 3'b000;
    end

    initial begin : main
        $display(" x y SEL NOT_X NOT_Y AND NAND OR NOR XOR XNOR MUX");
        $monitor("%b %b %b %b %b %b %b %b %b %b %b %b", 
            x, y, select, not_x, not_y, and_out, nand_out, 
            or_out, nor_out, xor_out, xnor_out, z
        );
        for (integer i = 0; i < 8; i = i + 1) begin
            {select} = i; 
            for (integer j = 0; j < 4; j = j + 1) begin
                {x, y} = j;
                #1;
            end
        end
    end
endmodule // Guia_0705
