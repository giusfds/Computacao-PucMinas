module clock ( output clk ); 
    reg clk;
    
    initial begin : start
    clk = 1'b0; 
    end

    always begin : clock 
        #12 clk = ~clk; 
    end 
endmodule 