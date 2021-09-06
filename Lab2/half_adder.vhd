-------------------------------------------------------------------------------
--
-- Title       : half_adder
-- Design      : Lab01_hald_adder
-- Author      : user382
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : F:\Spring_2021\ESE_382\Lab_01\Lab\Lab01_half_adder\Lab01_hald_adder\src\half_adder.vhd
-- Generated   : Thu Feb 18 08:22:32 2021
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {half_adder} architecture {dataflow}}

library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
	 port(
		 a : in STD_LOGIC;
		 b : in STD_LOGIC;
		 carry_out : out STD_LOGIC;
		 sum : out STD_LOGIC
	     );
end half_adder;

--}} End of automatically maintained section

architecture dataflow of half_adder is
begin

	sum <= (not a and b) or (a and not b);
	carry_out <= a and b;

end dataflow;
