#  ---------------------------------------------------------------------
# Pin assign --
#  ---------------------------------------------------------------------

# System ---------------------------------------------------------------
set_property PACKAGE_PIN E22 [get_ports PROGB_ON]
set_property PACKAGE_PIN F22 [get_ports BASE_CLKP]
set_property PACKAGE_PIN E23 [get_ports BASE_CLKN]
set_property PACKAGE_PIN H9 [get_ports USR_RSTB]
set_property PACKAGE_PIN U7 [get_ports {LED[1]}]
set_property PACKAGE_PIN V6 [get_ports {LED[2]}]
set_property PACKAGE_PIN V4 [get_ports {LED[3]}]
set_property PACKAGE_PIN W3 [get_ports {LED[4]}]
set_property PACKAGE_PIN U5 [get_ports {DIP[1]}]
set_property PACKAGE_PIN U6 [get_ports {DIP[2]}]
set_property PACKAGE_PIN U2 [get_ports {DIP[3]}]
set_property PACKAGE_PIN U1 [get_ports {DIP[4]}]
set_property PACKAGE_PIN N12 [get_ports VP]
set_property PACKAGE_PIN P11 [get_ports VN]

# GTX ------------------------------------------------------------------
set_property PACKAGE_PIN D6 [get_ports GTX_REFCLK_P]
set_property PACKAGE_PIN D5 [get_ports GTX_REFCLK_N]

# SPI flash ------------------------------------------------------------
set_property PACKAGE_PIN B24 [get_ports MOSI]
set_property PACKAGE_PIN A25 [get_ports DIN]
set_property PACKAGE_PIN C23 [get_ports FCSB]

# EXBASE connector -----------------------------------------------------

# EEPROM ---------------------------------------------------------------
set_property PACKAGE_PIN C21 [get_ports {EEP_CS[1]}]
set_property PACKAGE_PIN C22 [get_ports {EEP_SK[1]}]
set_property PACKAGE_PIN D21 [get_ports {EEP_DI[1]}]
set_property PACKAGE_PIN E21 [get_ports {EEP_DO[1]}]
#set_property PACKAGE_PIN D23 [get_ports {EEP_CS[2]}]
#set_property PACKAGE_PIN C24 [get_ports {EEP_SK[2]}]
#set_property PACKAGE_PIN D24 [get_ports {EEP_DI[2]}]
#set_property PACKAGE_PIN D25 [get_ports {EEP_DO[2]}]

# NIM-IO ---------------------------------------------------------------
set_property PACKAGE_PIN V8 [get_ports {NIM_IN[1]}]
set_property PACKAGE_PIN V7 [get_ports {NIM_IN[2]}]
set_property PACKAGE_PIN V11 [get_ports {NIM_OUT[1]}]
set_property PACKAGE_PIN W11 [get_ports {NIM_OUT[2]}]

# JItter cleaner -------------------------------------------------------
set_property PACKAGE_PIN AC14 [get_ports CDCE_PDB]
set_property PACKAGE_PIN AB15 [get_ports CDCE_LOCK]
set_property PACKAGE_PIN AD14 [get_ports CDCE_SCLK]
set_property PACKAGE_PIN AB14 [get_ports CDCE_SO]
set_property PACKAGE_PIN AA17 [get_ports CDCE_SI]
set_property PACKAGE_PIN AA18 [get_ports CDCE_LE]
set_property PACKAGE_PIN AD15 [get_ports CDCE_REFP]
set_property PACKAGE_PIN AE15 [get_ports CDCE_REFN]
set_property PACKAGE_PIN AA10 [get_ports CLK_FASTP]
set_property PACKAGE_PIN AB10 [get_ports CLK_FASTN]
set_property PACKAGE_PIN AB11 [get_ports CLK_SLOWP]
set_property PACKAGE_PIN AC11 [get_ports CLK_SLOWN]

# Belle2 Link ----------------------------------------------------------

# Main port ------------------------------------------------------------
# Up port --
# Down port --

# Mezzanine slot -------------------------------------------------------

# DDR3 SDRAM -----------------------------------------------------------
#  ---------------------------------------------------------------------
# Port attribute --
#  ---------------------------------------------------------------------

# System ---------------------------------------------------------------
set_property IOSTANDARD LVCMOS25 [get_ports PROGB_ON]
set_property IOSTANDARD LVDS_25 [get_ports BASE_CLKP]
set_property DIFF_TERM TRUE [get_ports BASE_CLKP]
set_property DIFF_TERM TRUE [get_ports BASE_CLKN]
set_property IOSTANDARD LVCMOS33 [get_ports USR_RSTB]
set_property IOSTANDARD LVCMOS15 [get_ports {LED[*]}]
set_property IOSTANDARD LVCMOS15 [get_ports {DIP[*]}]
set_property PULLUP true [get_ports {DIP[4]}]
set_property PULLUP true [get_ports {DIP[3]}]
set_property PULLUP true [get_ports {DIP[2]}]
set_property PULLUP true [get_ports {DIP[1]}]

# GTX ------------------------------------------------------------------

# SPI flash ------------------------------------------------------------
set_property IOSTANDARD LVCMOS25 [get_ports MOSI]
set_property IOB TRUE [get_ports MOSI]
set_property IOSTANDARD LVCMOS25 [get_ports DIN]
set_property IOB TRUE [get_ports DIN]
set_property IOSTANDARD LVCMOS25 [get_ports FCSB]
set_property IOB TRUE [get_ports FCSB]

# EXBASE connector -----------------------------------------------------

# EEPROM ---------------------------------------------------------------
set_property IOSTANDARD LVCMOS25 [get_ports {EEP_CS[*]}]
set_property IOSTANDARD LVCMOS25 [get_ports {EEP_SK[*]}]
set_property IOSTANDARD LVCMOS25 [get_ports {EEP_DI[*]}]
set_property IOSTANDARD LVCMOS25 [get_ports {EEP_DO[*]}]

# NIM-IO ---------------------------------------------------------------
set_property IOSTANDARD LVCMOS15 [get_ports {NIM_IN[*]}]
set_property IOSTANDARD LVCMOS15 [get_ports {NIM_OUT[*]}]

# JItter cleaner -------------------------------------------------------
set_property IOSTANDARD LVCMOS18 [get_ports CDCE_PDB]
set_property IOSTANDARD LVCMOS18 [get_ports CDCE_LOCK]
set_property IOSTANDARD LVCMOS18 [get_ports CDCE_SCLK]
set_property IOSTANDARD LVCMOS18 [get_ports CDCE_SO]
set_property IOSTANDARD LVCMOS18 [get_ports CDCE_SI]
set_property IOSTANDARD LVCMOS18 [get_ports CDCE_LE]
set_property IOSTANDARD LVDS [get_ports CDCE_REFP]
set_property IOSTANDARD LVDS [get_ports CDCE_REFN]

set_property IOSTANDARD LVDS [get_ports CLK_FASTP]
set_property IOSTANDARD LVDS [get_ports CLK_FASTN]
set_property IOSTANDARD LVDS [get_ports CLK_SLOWP]
set_property IOSTANDARD LVDS [get_ports CLK_SLOWN]

# Belle2 Link ----------------------------------------------------------

# Main port ------------------------------------------------------------
# Up port --
# Down port --

# Mezzanine slot -------------------------------------------------------
# Up slot --

# DDR3 SDRAM -----------------------------------------------------------


