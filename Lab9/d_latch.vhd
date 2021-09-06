-------------------------------------------------------------------------------
--
-- File        : d_latch.vhd
-- Design      : d_latch
-- Architecute : behavioral
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon April 12 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : coded d latch component
--
-------------------------------------------------------------------------------

--Define needed libraries
library IEEE;
use IEEE.std_logic_1164.all;

--Define entity declatation
entity d_latch is
	port(
		d : in std_logic;
		le_bar : in std_logic;
		q1 : out std_logic
	);
end d_latch;

--Define architecture declaration
architecture behavioral of d_latch is
begin
	p1:process(d, le_bar) --process to describe the behavior of the dlatch
	begin
		if le_bar = '0' then
			q1 <= d;
		end if;
	end process;
		
end behavioral;