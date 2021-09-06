-------------------------------------------------------------------------------
--
-- File        : twolevelgate.vhd
-- Design      : twolevelgate
-- Architecute : behavior
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon April 5, 13:36:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : create an or gate
--
-------------------------------------------------------------------------------									   


library ieee;
use ieee.std_logic_1164.all;

entity nandwfb is
 port(
 enable : in std_logic;
 sigout : out std_logic
 );
 
attribute loc : string;
attribute loc of enable  : signal is "P3";
attribute loc of sigout  : signal is "P27";

end nandwfb;


architecture behavioral of nandwfb is
	signal s1 : std_logic;
begin
	
	sigout <= s1;
	s1 <= enable nand s1;
	
end behavioral;