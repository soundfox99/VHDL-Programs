-------------------------------------------------------------------------------
--
-- File        : decoder_1_of_8.vhd
-- Design      : decoder_1_of_8
-- Architecute : behavioral
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon April 12 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : 3 to 8 decoder
--
-------------------------------------------------------------------------------				


--Define needed libararies
-------------------------------------------------------------------------------
--
-- File        : latches_8.vhd
-- Design      : latches_8
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
-----------------------------------------------------------------------------

--define needed libraires
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--define entity declaration
entity latches_8 is
	port(  
	--define input
	y : in std_logic_vector(2 downto 0);
	d : in std_logic;
	le_bar : in std_logic;
	mr_bar : in std_logic;
	
	--define output vector
	q : out std_logic_vector(0 to 7)
	);
end latches_8;

architecture behavior of latches_8 is
begin
	
	p1 : process(y,d,le_bar,mr_bar)
	--define needed varialbes
	variable data : std_logic_vector(0 to 7);
	
	begin
		if (mr_bar = '0') and (le_bar ='1') then --reset latches
			data := "00000000";
		elsif (mr_bar = '1') and (le_bar ='0') then
			data(to_integer(unsigned(y))) := d; --change latches based off of values
		elsif (mr_bar = '0') and (le_bar ='0') then
			data := "00000000";
			data(to_integer(unsigned(y))) := d; --change latches based off of values
		end if;
		
	q <= data; --output variable to output signal
	end process;
	
end behavior;