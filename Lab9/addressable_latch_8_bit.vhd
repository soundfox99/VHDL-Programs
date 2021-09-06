-------------------------------------------------------------------------------
--
-- File        : addressable_latch_8.vhd
-- Design      : addressable_latch_8
-- Architecute : structural
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon April 12 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : structural top level of the 74HC259 chip built using a 
--	a mux compoennet and an 8 latch compoenent
--
-------------------------------------------------------------------------------				


--Define needed libararies
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library C74HC259;
use C74HC259.all;

--define entity declaration
entity addressable_latch_8_bit is
	port(
	--inputs
	a : in std_logic_vector(2 downto 0); 
	d : in std_logic;
	le_bar : in std_logic;
	mr_bar : in std_logic;
	
	q : out std_logic_vector(0 to 7); --output vector
	y : buffer std_logic_vector(2 downto 0) --buffer vector
	);
	
	attribute loc : string;
attribute loc of le_bar  : signal is "P2";
attribute loc of mr_bar  : signal is "P3";
attribute loc of d       : signal is "P4";
attribute loc of a       : signal is "P7,P8,P9";
attribute loc of q       : signal is "P43,P42,P41,P40,P39,P38,P37,P36";

end addressable_latch_8_bit;

architecture structure of addressable_latch_8_bit is

	--define local version of decoder component
	component decoder_1_of_8
		port(
		a : in std_logic_vector(2 downto 0); --parallen input data
		y : out std_logic_vector(2 downto 0)--output vector)
		);
	end component;
	
	--define local cersion of latch compoenent
	component latches_8
		port(
			y : in std_logic_vector(2 downto 0); --input vector
			d : in std_logic;
			le_bar : in std_logic;
			mr_bar : in std_logic;
			q : out std_logic_vector(0 to 7) --output vector
		);
	end component;
begin
	
	--assign signals to the compoennets
	u0: decoder_1_of_8 port map (a => a, y => y);
	u1: latches_8 port map (y => y, d => d, le_bar => le_bar, mr_bar => mr_bar, q => q); 
	
end structure;