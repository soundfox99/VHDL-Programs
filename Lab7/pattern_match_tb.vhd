-------------------------------------------------------------------------------
--
-- File        : pattern_match_tb.vhd
-- Design      : pattern_match_tb
-- Architecute : behavior
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon March 29 14:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : Implement a testbench to to verify a pattern match entity
--
-------------------------------------------------------------------------------

--define needed entities and libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library pattern_match_cnt;
use pattern_match_cnt.all;

--define entity
entity testbench is
end testbench;

architecture behavior of testbench is
	--Stimulate signals
	signal data : std_logic_vector(7 downto 0);
	signal pattern : std_logic_vector(3 downto 0);
	
	--Observed signals
	signal match : std_logic;
	signal match_mod : std_logic;
	signal match_count : std_logic_vector(2 downto 0);
	
	begin
		--Unit Under Test port Map
		UUT : entity pattern_match_count port map (data => data, 
			pattern => pattern, 
			match => match,
			match_count => match_count);
			
		--Behavioral model port map
		UMOD : entity pattern_match_mod port map (data => data, 
			pattern => pattern, 
			match_mod => match_mod);
			
		test:process
		--define constants
		constant period : time := 20ns;
		
		begin
		   	for i in 0 to 255 loop --iterate through all values of data
				data <= std_logic_vector(to_unsigned(i, 8));		
				for j in 0 to 15 loop --iterate through all values of pattern
					pattern <= std_logic_vector(to_unsigned(j,4));
					wait for period;
					
					assert match = match_mod --determine if the entity matches the behavior entity
					report "Error for input vector " & integer'image(i) severity error;
				end loop;
			end loop;
			wait;
		end process;	
end behavior;

