# Pin constraints for the FPGA
set_property PACKAGE_PIN F22 [get_ports {CLKP}]
set_property IOSTANDARD LVDS_25 [get_ports {CLKP}]
set_property PACKAGE_PIN E23 [get_ports {CLKN}]
set_property IOSTANDARD LVDS_25 [get_ports {CLKN}]
create_clock -period 10.0 [get_ports {CLKP CLKN}]

set_property PACKAGE_PIN H9 [get_ports {RSTB_SW}]
set_property IOSTANDARD LVCMOS33 [get_ports {RSTB_SW}]


