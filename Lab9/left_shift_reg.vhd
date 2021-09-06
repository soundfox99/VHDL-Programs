-------------------------------------------------------------------------------
--
-- File        : left_shift_reg.vhd
-- Design      : left_shift_reg
-- Architecute : behavioral
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon April 12 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : left shift register that shifts data left 1 bit for every rising clock edge
--		the component as a enable shift, serial_out, and rst_bar to clear the register
--
-------------------------------------------------------------------------------


--Define needed libraries
library IEEE;
use IEEE.std_logic_1164.all;

--define entity declaration
entity left_shift_reg is
 	port(
 		d : in std_logic_vector(3 downto 0); -- parallel input data
 		load : in std_logic; -- synchronous load parallel input
 		en_shift : in std_logic; -- enable shift if load is unasserted
 		clk : in std_logic; -- clk
 		rst_bar : in std_logic; -- asynchronous reset
 		serial_out : out std_logic -- serial output
 	);
end left_shift_reg;

--define architecture of the componenet
architecture behavior of left_shift_reg is
begin
	
	p1: process(d,load,en_shift,clk,rst_bar)
		variable data : std_logic_vector(3 downto 0); --defien data variable
	begin
		if rst_bar = '1' then
			data := "0000";	  --reset data if reset is hit
		elsif (rst_bar = '0') then
			if clk'event and clk = '1'then	  --all other signals are synchrnous
				if (load = '1') then
					data := d;	   --load new data
				elsif (load = '0') and (en_shift = '1') then
					data := data(2 downto 0) & '0';		--shift regester if conditions met
				end if;
			end if;
		end if;
		serial_out <= data(3); --update serial out
	end process;
	
end behavior;

			