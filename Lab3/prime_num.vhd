-------------------------------------------------------------------------------
--
-- File        : prime_num.vhd
-- Design      : prime_num
-- Architecute : dataflow
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Sun Feb 28 13:56:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : 4-bit prime detector with inputs 'a' 'b' 'c' and 'd'
--		Outputs 'prime'. Implements in product of sums dataflow architecutre.
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity prime_num is
	 port(
		 d : in STD_LOGIC;	   		--1 bit input
		 c : in STD_LOGIC;	   		--1 bit input
		 b : in STD_LOGIC;	   		--1 bit input
		 a : in STD_LOGIC;	   		--1 bit input
		 prime : out STD_LOGIC		--1 bit output
	     );
end prime_num;


architecture cpos of prime_num is
begin

	prime <= (d or c or b or a)	   --boolean expression for prime
		 and (d or c or b or not a)
		 and (d or not c or b or a)
		 and (d or not c or not b or a)
		 and (not d or c or b or a)
		 and (not d or c or b or not a)
		 and (not d or c or not b or a)
		 and (not d or not c or b or a)
		 and (not d or not c or not b or a)
		 and (not d or not c or not b or not a);

end cpos;
