# Timing constraints for the design
# Create a clock with a 10 ns period on the differential input ports
create_clock -name clk_diff -period 10.0 [get_ports {CLKP CLKN}]

# Set input delay constraints relative to the created clock
set_input_delay -clock clk_diff -max 2.5 [get_ports {CLKP CLKN}]
set_input_delay -clock clk_diff -min 1.5 [get_ports {CLKP CLKN}]