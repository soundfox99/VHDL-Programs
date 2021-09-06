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
-- Description : decoder to covert 3 bit input
--
-------------------------------------------------------------------------------				


--Define needed libararies
library ieee;
use ieee.std_logic_1164.all;

--define entity declaration
entity decoder_1_of_8 is
	port(
		a : in std_logic_vector(2 downto 0); --parallen input data
		y : out std_logic_vector(2 downto 0) --output vector
	);
end decoder_1_of_8;

architecture behavior of decoder_1_of_8 is
begin
	with std_logic_vector(a) select
	y <= 	"000" when "000", --defined designated outputs given inputs
		   	"001" when "001",
			"010" when "010",
			"011" when "011",
			"100" when "100",
			"101" when "101",
			"110" when "110",
			"111" when "111",
			"000" when others; --define defalt condition
end behavior;
		