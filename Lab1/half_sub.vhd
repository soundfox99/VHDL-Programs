-------------------------------------------------------------------------------
--
-- Title       : half_sub
-- Design      : half_sub
-- Author      : Aditya Jindal
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : F:\Spring_2021\ESE_382\Lab_01\Lab\Lab01b_half_sub\half_sub\half_sub\src\half_sub.vhd
-- Generated   : Thu Feb 18 08:39:34 2021
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Use the dataflow architecture to create a hald subtractor
--				with inputs a and b, and outputs differ and borrow.
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {half_sub} architecture {dataflow}}

library IEEE;
use IEEE.std_logic_1164.all;

entity half_sub is
	 port(
		 a : in STD_LOGIC;
		 b : in STD_LOGIC;
		 differ : out STD_LOGIC;
		 borrow : out STD_LOGIC
	     );
end half_sub;

--}} End of automatically maintained section

architecture dataflow of half_sub is
begin

	differ <= (a xor b);
	borrow <= (not a and b);

end dataflow;
