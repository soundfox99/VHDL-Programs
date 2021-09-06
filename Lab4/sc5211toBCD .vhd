-------------------------------------------------------------------------------
--
-- File        : sc5211toBCD.vhd
-- Design      : sc5211tobcd
-- Architecute : csawdcs
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon Mar 8 13:56:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : 5211 to BCD converter with 4-bit input
--	and output using "don't cares" and conditional signal
--	assignment
--
-------------------------------------------------------------------------------

--Define needed libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sc5211tobcd is	 --given code segment
	port(
	sc5211 : in std_logic_vector(3 downto 0);
	bcd : out std_logic_vector(3 downto 0)
	);
	
	attribute loc : string;
	attribute loc of sc5211 : signal is "P6,P5,P4,P3";
	attribute loc of bcd : signal is " P24,P25,P26,P27";
	
end sc5211tobcd;

architecture csawdcs of sc5211tobcd is
begin
bcd <= 	"0000" when sc5211 = "0000" else --defined designated outputs given inputs
		"0001" when sc5211 = "0001" else
		"0010" when sc5211 = "0011" else
		"0011" when sc5211 = "0101" else
		"0100" when sc5211 = "0111" else
		"0101" when sc5211 = "1000" else
		"0110" when sc5211 = "1010" else
		"0111" when sc5211 = "1100" else
		"1000" when sc5211 = "1110" else
		"1001" when sc5211 = "1111" else
		"----";
	
end csawdcs;