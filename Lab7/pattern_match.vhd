-------------------------------------------------------------------------------
--
-- File        : pitch_match.vhd
-- Design      : pitch_match
-- Architecute : loop_arch
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon March 29 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : Use a loop to see if a designated input is in a data string
--
-------------------------------------------------------------------------------

library	ieee;
use ieee.std_logic_1164.all;

entity pattern_match is
	port(
		data : in std_logic_vector(7 downto 0); -- Input data to check.
		pattern : in std_logic_vector(3 downto 0); -- Pattern to match.
		match : out std_logic -- Asserted if the pattern
	); -- is found.

end pattern_match;

architecture loop_arch of pattern_match is
	begin
	process (data, pattern)
	begin
	
		match <= '0'; -- Default output value.
		for i in 7 downto 3 loop -- There are 5 data input slices to check
			if data(i downto (i - 3)) = pattern then -- check slice
				match <= '1'; -- if equal assert match and exit
				exit;
			end if;
		end loop;
	end process;
	
end loop_arch;