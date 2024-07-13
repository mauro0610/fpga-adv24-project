# Clock definition
create_clock -period 10.000 -name clk_osc -waveform {0.000 5.000} [get_ports BASE_CLKP]

# SiTCP
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/SiTCP_INT/SiTCP_INT_REG/regX11Data*}]
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/SiTCP_INT/SiTCP_INT_REG/regX12Data*}]
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/SiTCP_INT/SiTCP_INT_REG/regX13Data*}]
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/SiTCP_INT/SiTCP_INT_REG/regX14Data*}]
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/SiTCP_INT/SiTCP_INT_REG/regX15Data*}]
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/SiTCP_INT/SiTCP_INT_REG/regX16Data*}]
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/SiTCP_INT/SiTCP_INT_REG/regX17Data*}]
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/SiTCP_INT/SiTCP_INT_REG/regX18Data*}]
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/SiTCP_INT/SiTCP_INT_REG/regX19Data*}]
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/SiTCP_INT/SiTCP_INT_REG/regX1AData*}]
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/SiTCP_INT/SiTCP_INT_REG/regX1BData*}]
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/BBT_SiTCP_RST/resetReq*}]
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/GMII/GMII_TXBUF/memRdReq*}]
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/GMII/GMII_TXBUF/orRdAct*}]
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/GMII/GMII_TXBUF/dlyBank0LastWrAddr*}]
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/GMII/GMII_TXBUF/dlyBank1LastWrAddr*}]
set_false_path -through [get_nets {gen_SiTCP[*].u_SiTCP_Inst/SiTCP/GMII/GMII_TXBUF/muxEndTgl}]


create_generated_clock -name clk_sys [get_pins u_ClkMan_Inst/inst/mmcm_adv_inst/CLKOUT0]
create_generated_clock -name clk_indep [get_pins u_ClkMan_Inst/inst/mmcm_adv_inst/CLKOUT1]
create_generated_clock -name clk_spi [get_pins u_ClkMan_Inst/inst/mmcm_adv_inst/CLKOUT2]
create_generated_clock -name clk_icap [get_pins u_ClkMan_Inst/inst/mmcm_adv_inst/CLKOUT3]
create_generated_clock -name clk_idctrl [get_pins u_ClkMan_Inst/inst/mmcm_adv_inst/CLKOUT4]

create_generated_clock -name clk_gmii1 [get_pins u_GtClockDist_Inst/core_clocking_i/mmcm_adv_inst/CLKOUT0]
create_generated_clock -name clk_gmii2 [get_pins u_GtClockDist_Inst/core_clocking_i/mmcm_adv_inst/CLKOUT1]

set_clock_groups -name async_sys_gmii -asynchronous -group clk_sys -group {clk_gmii1 clk_gmii2} -group clk_indep -group clk_spi -group clk_icap -group clk_idctrl


set_false_path -through [get_ports {LED[1]}]
set_false_path -through [get_ports {LED[2]}]
set_false_path -through [get_ports {LED[3]}]
set_false_path -through [get_ports {LED[4]}]

