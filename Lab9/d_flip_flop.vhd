-------------------------------------------------------------------------------
--
-- File        : d_flip_flop.vhd
-- Design      : d_flip_flop
-- Architecute : behavioral
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon April 12 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : coded d flip flop
--
-------------------------------------------------------------------------------

--needed libraries
library IEEE;
use IEEE.std_logic_1164.all;

--flip flop entity declaration
entity d_flip_flop is
	 port(
		 d : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 qff : out STD_LOGIC
	     );
end d_flip_flop;

architecture behavioral of d_flip_flop is
begin
	
	p2 : process(clk) --proccess to descibe behavior
	begin
		if clk'event and clk= '1' then --if condition to only change on positve edge
			qff <= d;
		end if;
	end process;
end behavioral;