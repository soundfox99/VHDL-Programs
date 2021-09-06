-------------------------------------------------------------------------------
--
-- File        : bcd2aiken.vhd
-- Design      : bcd2aiken
-- Architecute : cpos/selct_arch
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon March 29 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : Use either cpos or selected signal assignment statment to
--		implement a BCD Code to Aiken Decimal Code Converter
--
-------------------------------------------------------------------------------

library	ieee;
use ieee.std_logic_1164.all;

entity bcd2aiken is
 	port(
 		d, c, b, a : in std_logic;
 		v, w, x, y : out std_logic
 	);
end bcd2aiken;
architecture select_arch of bcd2aiken is
begin
with std_logic_vector'(d, c, b, a) select
(v, w, x, y) <= std_logic_vector'("0000") when "0000",
"0001" when "0001",
"0010" when "0010",
"0011" when "0011",
"0100" when "0100",
"1011" when "0101",
"1100" when "0110",
"1101" when "0111",
"1110" when "1000",
"1111" when "1001",
"----" when others;
end select_arch;