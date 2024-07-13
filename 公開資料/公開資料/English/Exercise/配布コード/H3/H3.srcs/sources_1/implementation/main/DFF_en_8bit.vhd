--DFF ACLR 8bit with enable

library ieee;
use ieee.std_logic_1164.all;

entity DFF_en_8bit is
    port(
	ACLR	: in std_logic;
	CLK	: in std_logic;
	DATA	: in std_logic_vector (7 downto 0);
	EN	: in std_logic;
	Q	: out std_logic_vector (7 downto 0)
	);
end DFF_en_8bit;

architecture RTV of DFF_en_8bit is
begin
	process (CLK, ACLR)
	begin
	   if ACLR='1' then   
	      Q <= (others => '0');
	   elsif (CLK'event and CLK='1') then 
	     if(EN = '1') then
	       Q <= DATA;
	     end if;
	   end if;
	end process;
end RTV;
