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

library nandwfb;
use nandwfb.all;

--define entity
entity testbench is
end testbench;

architecture behavior of testbench is


	-- Declare local signals to assign values
	signal sigout, enable : std_logic;

	begin
	--Create an instance of the circuit to be tested
	uut : entity nandwfb  port map(enable => enable, sigout => sigout);
		
	-- Define a process to apply the input stimuls and test outputs
	tb : process
	constant period: time := 20 ns;
	
	begin		--Apply every pssible input combination
	
	enable <= '0';
	wait for 50 ns;
	enable <= '1';
	wait for 350 ns;
	
	wait; --indefinitely suspend process
	end process;
end behavior;