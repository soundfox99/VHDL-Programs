-------------------------------------------------------------------------------
--
-- File        : dff_en.vhd
-- Design      : dff_en
-- Architecute : behavioral
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon April 12 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : d flip flop with reset and enable inputs
--
-------------------------------------------------------------------------------

--Define needed libraries
library ieee;
use ieee.std_logic_1164.all;

--define entity declaration
entity dff_en is
 	port(
 		d : in std_logic; -- data input
 		clk : in std_logic; -- clock input
 		en : in std_logic; -- enable input
 		rst_bar : in std_logic; -- asynchronous reset
 		q : out std_logic -- output
 	);
end dff_en;

--Define architectuer of the compoenent
architecture behavior of dff_en is
begin
	--define behavior of the component
	p1 : process(d, clk, en, rst_bar)
	begin
		if rst_bar = '1' then --reset flip flop
			q <= '0';
		elsif (rst_bar) = '0' and (en = '1') then
			if clk'event and clk = '1' then
				q <= d;	--output data only if certain conditions are met
			end if;
		end if;
	end process;
end behavior;