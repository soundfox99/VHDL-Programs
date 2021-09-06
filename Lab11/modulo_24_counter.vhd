-------------------------------------------------------------------------------
--
-- File        : modulo_60_counter.vhd
-- Design      : modulo_60_counter
-- Architecute : behavioral
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon April 12 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : output will count to 59 in BCD and then roll over to 0
--
-------------------------------------------------------------------------------	

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity modulo_24_counter is
port(
	rst_n : in std_logic; -- active low synchronous reset
	clk : in std_logic; -- system clock
	clr_n : in std_logic; -- active low synchronous clear
	load_en : in std_logic; -- parallel load counter
	setting : in std_logic_vector(5 downto 0); -- load value
	cnt_en_1 : in std_logic; -- enable count 1
	cnt_en_2 : in std_logic; -- enable count 2
	max_count : out std_logic; -- maximum count flag
	count : out std_logic_vector(5 downto 0) -- BCD count
);
end modulo_24_counter;

architecture behavior of modulo_24_counter is

begin
	--defien process
	p1: process(rst_n,clk,clr_n,load_en,setting, cnt_en_1, cnt_en_2)
	
	--define variables
	variable counter_ones : integer := 0;
	variable counter_tens : integer := 0;
	
	begin
		if rising_edge(clk) then --detect clock positive edge
			if (rst_n = '0') or (clr_n = '0') then	 --define resets
				counter_ones := 0;
				counter_tens := 0;
			elsif (load_en = '1') then	  --define load operation
				counter_ones := to_integer(unsigned(setting(3 downto 0)));
				counter_tens := to_integer(unsigned(setting(5 downto 4)));
			elsif (cnt_en_2 = '1') then	 --define counting conditions
				if (cnt_en_1 = '1') then
					if (counter_ones = 3) and (counter_tens = 2) then
						counter_ones := 0;
						counter_tens := 0;
					elsif (counter_ones < 9) then
						counter_ones := counter_ones + 1;
					elsif (counter_ones >= 9) then
						counter_ones := 0;
						counter_tens := counter_tens + 1;
					end if;
						
				end if;
			end if;
		end if;
		
		if (counter_tens = 2) and (counter_ones = 3) then	--detect max count and set signal
			max_count <= '1';
		else
			max_count <= '0';
		end if;
		
		--output the counter variables
		count <= std_logic_vector(to_unsigned(counter_tens, 2)) & std_logic_vector(to_unsigned(counter_ones, 4));
	end process;
end behavior;