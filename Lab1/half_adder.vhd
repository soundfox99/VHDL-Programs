-------------------------------------------------------------------------------
--
-- Title       : half_adder
-- Design      : Lab-1_half_adder
-- Author      : Aditya Jindal
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Hermes\Desktop\Spring_2021\ESE_382\Lab_01\Lab01_half_adder\Lab-1_half_adder\src\half_adder.vhd
-- Generated   : Wed Feb 17 17:45:09 2021
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
	
library  lab_1_half_adder;
use lab_1_half_adder.all;
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
