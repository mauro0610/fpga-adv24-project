`timescale 1ns / 1ps

module tb_toplevel;

    // Inputs
    reg CLKP;
    reg CLKN;
    reg RSTB_SW;

    // Outputs from the UUT
    wire [7:0] RESULT;

    
    wire clk_sys;
    wire reset;
    wire clko;
    reg [7:0] count = 8'b0;  // Initialize the 8-bit counter to 0
    reg [7:0] delayed_count = 8'b0;  // Initialize the 8-bit delayed counter to 0

    // Instantiate the Unit Under Test (UUT)
    toplevel uut (
        .CLKP(CLKP),
        .CLKN(CLKN),
        .RSTB_SW(RSTB_SW),
        .RESULT(RESULT)
    );

    // Clock generation
    initial begin
        CLKP = 0;
        forever #5 CLKP = ~CLKP;  // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize Inputs
        RSTB_SW = 1;
        #20;
        RSTB_SW = 0;  // Release reset
        #10
        
        count=0; delayed_count=1; #10
        count=1; delayed_count=0; #10    
//        // Run the test for a specific duration
//        #100;

        // End the simulation
        $stop;
    end
    
//    // Monitor outputs for debugging
    initial begin
        $monitor("Time=%0d, CLKP=%b, RSTB_SW=%b, RESULT=%d",
                 $time, CLKP, RSTB_SW, RESULT);
    end

    // Monitor outputs for debugging
//    initial begin
//        $monitor("Time=%0d, CLKP=%b, CLKN=%b, RSTB_SW=%b, count=%d, delayed_count=%d, RESULT=%d",
//                 $time, CLKP, CLKN, RSTB_SW, count, delayed_count, RESULT);
//    end

endmodule
