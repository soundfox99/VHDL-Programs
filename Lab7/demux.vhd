-------------------------------------------------------------------------------
--
-- File        : demux.vhd
-- Design      : demux
-- Architecute : condsa
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon March 22 14:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : Implement a 4 to 1 demux
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity demux is
 port(
 	s1 : in std_logic;
 	s0 : in std_logic;
 	datain : in std_logic_vector(3 downto 0);
 	route0, route1, route2, route3 : out std_logic_vector(3 downto 0)
 );
end demux;

architecture condsa of demux is
begin

	route0 <= datain when std_logic_vector'(s1,s0) = "00" else "ZZZZ";
 	route1 <= datain when std_logic_vector'(s1,s0) = "01" else "ZZZZ";
 	route2 <= datain when std_logic_vector'(s1,s0) = "10" else "ZZZZ";
 	route3 <= datain when std_logic_vector'(s1,s0) = "11" else "ZZZZ";

end condsa;
