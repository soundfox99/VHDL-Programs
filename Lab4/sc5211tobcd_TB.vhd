library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library csawdcs;
use csawdcs.all;


entity sc5211tobcd_tb is
end sc5211tobcd_tb;

architecture TB_ARCHITECTURE of sc5211tobcd_tb is

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal sc5211 : std_logic_vector(3 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal bcd : std_logic_vector(3 downto 0);

	constant period: time := 20ns;	
	
begin

	-- Unit Under Test port map
	UUT : entity sc5211tobcd
		port map (
			sc5211 => sc5211,
			bcd => bcd
		);

	stimulus: process
	begin
		for i in 0 to 15 loop	 -- generate all integer values of i from 0 to 15
			-- convert i to a std_logic_vector and assign to sc5211
			sc5211 <= std_logic_vector(to_unsigned(i, 4));
			wait for period;	-- wait for outputs to settle
		end loop;
		--wait;	-- infinite wait, no more stimulus vectors to generate
		std.env.finish;		--better way to end simulation (VHDL2008)
	end process;

end tb_architecture;
