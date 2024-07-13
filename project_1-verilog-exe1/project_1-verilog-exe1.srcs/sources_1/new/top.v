`timescale 1ns / 1ps

module toplevel (
    input wire CLKP,
    input wire CLKN,
    input wire RSTB_SW,
    output wire [9:0] RESULT
);

    wire clk_sys;
    wire reset;
    wire clko;
    reg [7:0] count = 8'b0;  // Initialize the 8-bit counter to 0
    
    // Pipeline registers for delayed_count (4 stages)
    reg [7:0] delayed_count_pipe [0:3];


    // Invert the reset signal
    assign reset = ~RSTB_SW;

    // Input clock buffer
    IBUFDS #(
        .DIFF_TERM("TRUE"),
        .IBUF_LOW_PWR("FALSE"),
        .IOSTANDARD("LVDS_25")
    ) iclkdbuf (
        .O(clko),
        .I(CLKP),
        .IB(CLKN)
    );

    // Output clock buffer
    BUFG oclkdbuf (
        .O(clk_sys),
        .I(clko)
    );

    // 8-bit counter with delay mechanism
    always @(posedge clk_sys or posedge reset) begin
        if (reset) begin
            count <= 8'b0;  // Reset the counter to 0
            delayed_count_pipe[0] <= 8'b0;  // Reset the delayed counter to 0
            delayed_count_pipe[1] <= 8'b0;
            delayed_count_pipe[2] <= 8'b0;
            delayed_count_pipe[3] <= 8'b0;
        end else begin
            count <= count + 1;  // Increment the counter 
            delayed_count_pipe[0] <= count; // Delay the counter by one clock cycle
            delayed_count_pipe[1] <= delayed_count_pipe[0]; //Update delays
            delayed_count_pipe[2] <= delayed_count_pipe[1];
            delayed_count_pipe[3] <= delayed_count_pipe[2];
        end
    end
    
    // Signals for the DSP48E1
    reg [9:0] scaled_output;
    wire [47:0] dsp48_output[0:1];
    
    
    
    // Multiplier value for 0.25 in Q4.4 fixed-point format        
    reg [9:0] multiplier = 10'b1; // Q8.2 fixed-point representation of 0.25        
                                                                                              
    // initial C value                                                                            
    reg [47:0] carry_on = 48'b0;                                                                   
    
//    dsp_macro_0 adderAD (
//      .CLK(clk_sys),  // input wire CLK
//      .A({2'b0, count}),      // input wire [9:0] A
//      .D({2'b0, delayed_count_pipe[0]}),  // input wire [9:0] D
//      .P(dsp48_output)      // output wire [47:0] P
//    );
    
    dsp_macro_0 dsp0 (
      .CLK(clk_sys),  // input wire CLK
      .A({count, 2'b0}),      // input wire [9 : 0] A
      .B(multiplier),      // input wire [9 : 0] B
      .C({carry_on}),      // input wire [47 : 0] C
      .D({delayed_count_pipe[0], 2'b0}),      // input wire [9 : 0] D
      .P(dsp48_output[0])      // output wire [47 : 0] P
    );


    dsp_macro_0 dsp1 (                                                
        .CLK(clk_sys),  // input wire CLK                               
        .A({delayed_count_pipe[1], 2'b0}),      // input wire [9 : 0] A                 
        .B(multiplier),      // input wire [9 : 0] B                    
        .C({dsp48_output[0]}),      // input wire [47 : 0] C                   
        .D({delayed_count_pipe[2], 2'b0}),      // input wire [9 : 0] D 
        .P(dsp48_output[1])      // output wire [47 : 0] P                 
    );                                                                
    
    // Use only the lower 10 bits of the final result for the output
    assign RESULT = dsp48_output[1];                                
    
     // Adjust the result for fixed-point scaling by right-shifting
//    always @(*) begin
//        scaled_output = dsp48_output[13:4]; // Select the correct 10 bits, adjusting for Q8.2
//    end

//    // Use only the lower 10 bits of the result for the output
//    assign RESULT = dsp48_output[9:0];
    
    // Mark signals for debug
    (* mark_debug = "true" *) wire [9:0] dbg_count = {2'b0, count};
    (* mark_debug = "true" *) wire [9:0] dbg_delayed_count0 = {2'b0, delayed_count_pipe[0]};
    (* mark_debug = "true" *) wire [9:0] dbg_delayed_count1 = {2'b0, delayed_count_pipe[1]};
    (* mark_debug = "true" *) wire [9:0] dbg_delayed_count2 = {2'b0, delayed_count_pipe[2]};
    (* mark_debug = "true" *) wire [9:0] dbg_delayed_count3 = {2'b0, delayed_count_pipe[3]};
    (* mark_debug = "true" *) wire [47:0] dbg_result0 = dsp48_output[0];
    (* mark_debug = "true" *) wire [47:0] dbg_result = RESULT;
    
    // Instantiating ILA core and connecting it to the signals to be monitored
    ila_0 my_ila (
        .clk(clk_sys), // Connect the clock signal
        .probe0(dbg_count), // Connect the counter (10 bits)
        .probe1(dbg_delayed_count0), // Connect the delayed counter (10 bits)
        .probe2(dbg_delayed_count1), // Connect the delayed counter (10 bits)
        .probe3(dbg_delayed_count2), // Connect the delayed counter (10 bits)
        .probe4(dbg_delayed_count3), // Connect the delayed counter (10 bits)
        .probe5(dbg_result0),
        .probe6(dbg_result) // Connect the result signal (10 bits)
    );

endmodule
