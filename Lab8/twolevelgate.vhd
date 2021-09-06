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

entity twolevelgate is
	port ( a : in std_logic;
	b : in std_logic;
	c : in std_logic;
	f : out std_logic);
end twolevelgate;

architecture behavioral of twolevelgate is
	signal s1 : std_logic;
begin
	
	u0: process ( a, b )
	begin
		s1 <= a and b;
	end process u0;
	
	u1: process ( c, s1)
	begin
		f <= c or s1;
	end process u1;
	
end behavioral;