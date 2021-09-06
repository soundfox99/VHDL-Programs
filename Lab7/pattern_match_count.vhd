-------------------------------------------------------------------------------
--
-- File        : pitch_match_count.vhd
-- Design      : pitch_match_count
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
--		using a match_count varaible
--
-------------------------------------------------------------------------------

--define variables
library	ieee;
use ieee.std_logic_1164.all;  
use ieee.numeric_std.all;

--define entity of patch_match_count
entity pattern_match_count is
	port(
		data : in std_logic_vector(7 downto 0); -- Input data to check.
		pattern : in std_logic_vector(3 downto 0); -- Pattern to match.
		match : out std_logic; -- Asserted if the pattern 
		match_count : out std_logic_vector(2 downto 0)
	); -- is found.
	
	attribute loc : string;
	attribute loc of data       : signal is "P2,P3,P4,P5,P6,P7,P8,P9";
	attribute loc of pattern    : signal is "P14,P15,P16,P17";
	attribute loc of match      : signal is "P36";
	attribute loc of match_count  : signal is "P43,P42,P41";

end pattern_match_count;

--define architecture of pattern_match_count
architecture loop_arch of pattern_match_count is
	begin
	process (data, pattern)
	
	variable counter : integer := 0; --define variable
	
	begin
	
		match <= '0'; -- Default output value.
		counter := 0;
		for i in 7 downto 3 loop -- There are 5 data input slices to check
			if data(i downto (i - 3)) = pattern then -- check slice
				match <= '1'; -- if equal assert match and exit
				counter := counter + 1;
				--exit;
			end if;
		end loop;
		match_count <= std_logic_vector(to_unsigned(counter,3)); --turn variable into signal
	end process;
	
end loop_arch;