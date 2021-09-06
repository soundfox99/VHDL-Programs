library	ieee;
use ieee.std_logic_1164.all;

entity pattern_match_mod is
	port(
		data : in std_logic_vector(7 downto 0); -- Input data to check.
		pattern : in std_logic_vector(3 downto 0); -- Pattern to match.
		match_mod : out std_logic -- Asserted if the pattern
	); -- is found.

end pattern_match_mod;

architecture data_flow of pattern_match_mod is
	begin
	process (data, pattern)
	begin
		--dataflow description of match_mod
		match_mod <= ((data(7) xnor pattern(3)) and (data(6) xnor pattern(2)) and (data(5) xnor pattern(1)) and (data(4) xnor pattern(0)))
		or ((data(6) xnor pattern(3)) and (data(5) xnor pattern(2)) and (data(4) xnor pattern(1)) and (data(3) xnor pattern(0)))
		or ((data(5) xnor pattern(3)) and (data(4) xnor pattern(2)) and (data(3) xnor pattern(1)) and (data(2) xnor pattern(0)))
		or ((data(4) xnor pattern(3)) and (data(3) xnor pattern(2)) and (data(2) xnor pattern(1)) and (data(1) xnor pattern(0)))
		or ((data(3) xnor pattern(3)) and (data(2) xnor pattern(2)) and (data(1) xnor pattern(1)) and (data(0) xnor pattern(0)));

	end process;
	
end data_flow;