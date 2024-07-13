# fpga project 1: firmware

## situation
don't know shit about fpgas, and suddenly gotta deal with a design whose circuit terms I don't know...………………. yet


## to do:

- find about fpga part number, and set up basic configuration okkk
- connect pins to the ones corresponding to hardware
- pins, impl, and timing seem to be alright
- find way to connect to fpga

## results
- problem 1 solved, got to deliver the trends on the bits pattern for each result for the moving averaged filter

pd. I still did not understand how to read the results though, I only interpreted the bit pattern was right
pd2. first fpga program completion -> check!! 


## some drafts + code that worked

01001110

01001101

10011011

program 10001111

01110011

01110010

11110101

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

    // 8-bit counter with delay mechanism.... always executes all blocks at same time using previous values
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
    
    // Use only the lower 10 bits of the result for the output
    assign RESULT = dsp48_output[9:0];
    
    // Mark signals for debug
    (* mark_debug = "true" *) wire [9:0] dbg_count = count;
    (* mark_debug = "true" *) wire [9:0] dbg_delayed_count = delayed_count;
    (* mark_debug = "true" *) wire [9:0] dbg_result = RESULT;
    
    //Instantiating ila signal and creating ltx file for debugging
    ila_0 my_ila (
        .clk(clk_sys), // Connect the clock signal
        .probe0(dbg_count), // Connect the counter (8 bits)
        .probe1(dbg_delayed_count), // Connect the delayed counter (8 bits)
        .probe2(dbg_result) // Connect the result signal (8 bits)
    );

endmodule

above code works, don't destroy, there is latency, so results are not accurate but it works.

## next-to-do
- understand fpga clocking patterns together with deepening understanding of Boolean logic
- learn to interpret results (eg. I expected number of bits representing average but got bit patterns otherwise, maybe prof trolling me for still being amateur? its probable
- review basics of digital design 
- learn how to apply simulations
- easy fpga implementations for further understanding the fundamentals

## take-aways from vivado
- Verilog is easier to read than VHDL for beginners like me
- selecting right fpga at set up helps vivado check I/O selection on Verilog script
- dont forget to set up src(top.v) and constraints (pins.xdc for I/O or timing.xdc for clocks constraint)
- if no fpga at the moment, learn how to do simulations. in fact, this is faster rather than procedure doing synthesis, implementation, and bit-stream generation on top of programming the hardware (e.g. your fpga).
- use IP macros for scripting your verilog code(e.g. dsp used for this project)
- use ILA (again, this is also an IP macro), but this is used to probe your circuit. yes, circuits inside fpga are used to probe the using circuits. this is a cool feature.
-  

## reflection on 3 days course
- first fpga program completed!
- learned to run vivado through hard error-and-trial coding
- got deeper understanding on how different is fpga capabilities with Verilog like HDL programming vs. high-level programming like C or python

-> definitely not best idea to get straight into intermediate fpga-course this fast, but a sense on urgency for fpga learning was what I was looking for.



## references
below there is a list on references that helped cram up fpgas basic inner working, clock patterns, else general refs.

- any popular LLM shall work, though ChatGPT4o was only ok for basic stuff, else it not fine-tuned for more complicating hardware design, specially if looking for a tutor guide
- fpga4fun
	- https://www.fpga4fun.com/FPGAinfo3.html
- dsp48 macro 
	- https://docs.amd.com/v/u/en-US/pg148-dsp48-macro
- learning about tackling decimal numbers on fpga dsp inputs
	- https://stackoverflow.com/questions/78283508/which-bits-do-i-need-to-extract-in-a-signed-fixed-point-multiplier
	- https://projectf.io/posts/fixed-point-numbers-in-verilog/
- cool interesting project on game of life using fpga and fpga graphics!
	- https://projectf.io/posts/life-on-screen/
	- https://projectf.io/posts/fpga-graphics/
- fpga resources and websites
	- https://fpgacoding.com/fpga-sites/
- configurable counter circuit project
	- https://fpgacoding.com/creating-a-configurable-counter-circuit/
- fpga course slide explaining basics
	- https://indico.uniovi.es/event/8/contributions/34/attachments/19/53/COMCHA%20curso%20FPGA.pdf
	- https://indico.cern.ch/event/357886/contributions/849350/attachments/1148959/1648605/FPGA_2.pdf
- fpga-related books(ref by prof and reddit)
	- reddit src-> https://www.reddit.com/r/FPGA/comments/dvag9k/what_is_the_book_to_get_if_you_know_nothing/
	- digital design by Harris -> https://a.co/d/iWZ8vTl
	- computer architecture by Patterson/Hennesy -> https://a.co/d/iWZ8vTl
	- art of electronics -> https://artofelectronics.net/
- cool blog on learning how to learn by @danb
	- https://learnhowtolearn.org/
- cool video series on fpgas (not so many on yt, but as paid courses there seem to be more)
	- https://youtu.be/VMxU4XWVssM?si=DDF-t4hcjzBb4mKE
- cool website explaining stuff from fundamentals
	- https://www.explainthatstuff.com/quartzclockwatch.html
- explanation about oscillators and quartz material that makes it possible (metrology never seem sexier to me before)
	- https://www.youtube.com/watch?v=_2By2ane2I4
- more srcs by someone in GitHub
	- https://github.com/lastweek/fpga_readings
- clock double crossing
	- https://www.allaboutcircuits.com/technical-articles/introduction-to-clock-domain-crossing-double-flopping/
- OpenIt website (material in japanese though :/)
	- https://openit.kek.jp/training/2024/fpga/sokendai/fpga
	- https://openit.kek.jp/training/2024/fpga_advanced/SOKENDAI_KEK/fpga_advanced
	- https://openit.kek.jp/training/2024/fpga/sokendai/fpga

oookk, hopefully this is enough?
good.