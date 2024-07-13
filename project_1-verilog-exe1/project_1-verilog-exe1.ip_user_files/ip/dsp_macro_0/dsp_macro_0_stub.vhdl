-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Wed Jul 10 13:19:53 2024
-- Host        : LAPTOP-RD2K6H09 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/OhmoriG_Rogue/Downloads/fpga-advanced-2024/project_1-verilog-exe1/project_1-verilog-exe1.gen/sources_1/ip/dsp_macro_0/dsp_macro_0_stub.vhdl
-- Design      : dsp_macro_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k160tffg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dsp_macro_0 is
  Port ( 
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 9 downto 0 );
    B : in STD_LOGIC_VECTOR ( 9 downto 0 );
    C : in STD_LOGIC_VECTOR ( 47 downto 0 );
    D : in STD_LOGIC_VECTOR ( 9 downto 0 );
    P : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );

end dsp_macro_0;

architecture stub of dsp_macro_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,A[9:0],B[9:0],C[47:0],D[9:0],P[47:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dsp_macro_v1_0_6,Vivado 2024.1";
begin
end;
