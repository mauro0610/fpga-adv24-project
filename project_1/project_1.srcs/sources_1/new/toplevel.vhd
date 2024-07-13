library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity toplevel is
  Port (
    CLKP    : in  std_logic;
    CLKN    : in  std_logic;
    RSTB_SW : in  std_logic
  );
end toplevel;

architecture Behavioral of toplevel is
  signal clk_sys          : std_logic;
  signal reset            : std_logic;
  signal clko             : std_logic;
  signal count :in_std_vector
begin
  -- Invert the reset signal
  reset <= not RSTB_SW;

iclkdbuf: IBUFDS
	generic map (
		DIFF_TERM => true,
		IBUF_LOW_PWR => FALSE,
		IOSTANDARD => "LDVS_25"
	)
	port map(
		O => clko,
		I => CLKP,
		IB => CLKN
	);
	
oclkdbuf: BUFG
	port map(
		O => clk_sys,
		I => clko
	);
	
  process(clk_sys, reset)
  begin
  
    
  end process;

end Behavioral;
