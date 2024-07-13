module toplevel (
    input wire CLKP,
    input wire CLKN,
    input wire RSTB_SW,
    output wire [7:0] RESULT
);

    wire clk_sys;
    wire reset;
    wire clko;
    reg [7:0] count = 8'b0;  // Initialize the 8-bit counter to 0
    reg [7:0] delayed_count = 8'b0;  // Initialize the 8-bit delayed counter to 0

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
            delayed_count <= 8'b0;  // Reset the delayed counter to 0
        end else begin
            count <= count + 1;  // Increment the counter
            delayed_count <= count;  // Delay the counter by one clock cycle
        end
    end

    // Signals for the DSP48E1
    wire [47:0] dsp48_output;

    dsp_macro_0 adderAD (
      .CLK(clk_sys),  // input wire CLK
      .A({2'b0, count}),      // input wire [9:0] A
      .D({2'b0, delayed_count}),  // input wire [9:0] D
      .P(dsp48_output)      // output wire [47:0] P
    );
    
    // Use only the lower 8 bits of the result for the output
    // We could use 48 bit config, but due to input at lower bit width, rest would be useless constants
    // For multiplication bit width helps cover large numbers, but not here
    assign RESULT = dsp48_output[47:0];
    
    // Mark signals for debug
    (* mark_debug = "true" *) wire [7:0] dbg_count = count;
    (* mark_debug = "true" *) wire [7:0] dbg_delayed_count = delayed_count;
    (* mark_debug = "true" *) wire [7:0] dbg_result = RESULT;
    
    //Instantiating ila signal and creating ltx file for debugging
    ila_0 my_ila (
        .clk(clk_sys), // Connect the clock signal
        .probe0(dbg_count), // Connect the counter (8 bits)
        .probe1(dbg_delayed_count), // Connect the delayed counter (8 bits)
        .probe2(dbg_result) // Connect the result signal (8 bits)
    );

endmodule