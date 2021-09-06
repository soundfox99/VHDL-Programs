-------------------------------------------------------------------------------
--
-- File        : decoder_1_of_8_tb.vhd
-- Design      : decoder_1_of_8_tb
-- Architecute : behavior
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon March 29 14:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : Implement a testbench to to verify decoder works correctly
--
-----------------------------------------------------------------------------

--Define needed libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library C74HC259;
use C74HC259.all;

--define entity
entity testbench is
end testbench;

architecture behavior of testbench is
		signal a : std_logic_vector(2 downto 0); --parallen input data
		signal y : std_logic_vector(2 downto 0);
		
		begin
			--UUT
			uut : entity decoder_1_of_8 port map (a => a, y =>y);
		
		test:process
		
		--define constants
		constant period : time := 20ns;
		
		begin
			for i in 0 to 7 loop --loop through all possible combinations of a
				a <= std_logic_vector(to_unsigned(i, 3));	--assign values to a
				wait for period;
				assert(y = std_logic_vector(to_unsigned(i+1, 4))) --test valeus for y
				report "Test failed " & integer'image(i) severity error;	--report error
			end loop;
		
		wait;
		
		end process;
		
end;
				