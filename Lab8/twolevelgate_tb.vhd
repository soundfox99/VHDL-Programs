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

library twolevelgate;
use twolevelgate.all;

--define entity
entity testbench is
end testbench;

architecture behavior of testbench is


	-- Declare local signals to assign values
	signal a, b, c, f: std_logic;

	begin
	--Create an instance of the circuit to be tested
	uut : entity twolevelgate  port map(a => a, b => b,
		c => c, f => f);
		
	-- Define a process to apply the input stimuls and test outputs
	tb : process
	constant period: time := 20 ns;
	
	begin		--Apply every pssible input combination
	
	a <= '0';
	b <= '0';
	c <= '0';
	wait for period;
	assert(f = '0')
	report "Test failed for combination" 
		&std_logic'image(a)
		&std_logic'image(b)
		&std_logic'image(c)
		& " Output was: "
		&std_logic'image(f)
		
	severity error; --report issue
	
	a <= '0';
	b <= '0';
	c <= '1';
	wait for period;
	assert(f = '1')
	report "Test failed for combination" 
		&std_logic'image(a)
		&std_logic'image(b)
		&std_logic'image(c)
		& " Output was: "
		&std_logic'image(f)
		
	severity error; --report issue
	
	a <= '0';
	b <= '1';
	c <= '0';
	wait for period;
	assert(f = '0')
	report "Test failed for combination" 
		&std_logic'image(a)
		&std_logic'image(b)
		&std_logic'image(c)
		& " Output was: "
		&std_logic'image(f)
		
	severity error; --report issue
	
	a <= '0';
	b <= '1';
	c <= '1';
	wait for period;
	assert(f = '1')
	report "Test failed for combination" 
		&std_logic'image(a)
		&std_logic'image(b)
		&std_logic'image(c)
		& " Output was: "
		&std_logic'image(f)
		
	severity error; --report issue
	
	a <= '1';
	b <= '0';
	c <= '0';
	wait for period;
	assert(f = '0')
	report "Test failed for combination" 
		&std_logic'image(a)
		&std_logic'image(b)
		&std_logic'image(c)
		& " Output was: "
		&std_logic'image(f)
		
	severity error; --report issue
	
	a <= '1';
	b <= '0';
	c <= '1';
	wait for period;
	assert(f = '1')
	report "Test failed for combination" 
		&std_logic'image(a)
		&std_logic'image(b)
		&std_logic'image(c)
		& " Output was: "
		&std_logic'image(f)
		
	severity error; --report issue
	
	a <= '1';
	b <= '1';
	c <= '0';
	wait for period;
	assert(f = '1')
	report "Test failed for combination" 
		&std_logic'image(a)
		&std_logic'image(b)
		&std_logic'image(c)
		& " Output was: "
		&std_logic'image(f)
		
	severity error; --report issue
	
	a <= '1';
	b <= '1';
	c <= '1';
	wait for period;
	assert(f = '1')
	report "Test failed for combination" 
		&std_logic'image(a)
		&std_logic'image(b)
		&std_logic'image(c)
		& " Output was: "
		&std_logic'image(f)
		
	severity error; --report issue

	
	wait; --indefinitely suspend process
	end process;
end behavior;