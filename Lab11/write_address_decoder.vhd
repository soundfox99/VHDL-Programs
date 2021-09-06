-------------------------------------------------------------------------------
--
-- File        : write_address_decoder.vhd
-- Design      : write_address_decoder
-- Architecute : behavioral
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon April 22 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : 4 to 10 decoder with enable pins
--
-------------------------------------------------------------------------------	

--Define needed libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  

--Entity declaration of the component
entity write_address_decoder is
	port(
		wr : in std_logic; -- write enable input
		cs_n : in std_logic; -- chip select input
		address : in std_logic_vector(3 downto 0); -- address bus
		y : out std_logic_vector(9 downto 0)-- selected high);
	);
end write_address_decoder;

--architecture description of the compoenent
architecture behavioral of write_address_decoder is
	 type table is array (0 to 15) of std_logic_vector(9 downto 0); --initiate table
	constant table_lookup : table := (	--define table
		"0000000001",
		"0000000010",
		"0000000100",
		"0000001000",
		"0000010000",
		"0000100000",
		"0001000000",
		"0010000000",
		"0100000000",
		"1000000000",
		"0000000000",
		"0000000000",
		"0000000000",
		"0000000000",
		"0000000000",
		"0000000000");
begin 
	
	p1: process (wr, cs_n, address) --define process
	begin
		if (cs_n = '0') and (wr = '1') then	  --implement specified condition
			y <= table_lookup(to_integer(unsigned(address)));	--set y value
		else
			y <= "0000000000";	  --otherwise set y to 0
		end if;
	end process;
end behavioral;