-------------------------------------------------------------------------------
--
-- File        : pos_edge_detector.vhd
-- Design      : pos_edge_detector
-- Architecute : behavioral
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon April 12 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : output signal will only update on rising edge of clock input
--
-------------------------------------------------------------------------------	

--Define eneded libraries
library ieee;
use ieee.std_logic_1164.all;

--Define componenet entity
entity pos_edge_detector is
port(
	a : in std_logic; -- input signal
	rst_n : in std_logic; -- synchronous reset
	clk : in std_logic; -- system clock
	a_pe : out std_logic); -- one sys. clk wide pulse
end pos_edge_detector;

--Define componenent architecture
architecture behavioral of pos_edge_detector is
	signal a_delayed : std_logic;  --Define signal needed
begin
	posedge: process (rst_n, clk) --Define process
	begin
		if rising_edge(clk) then	--clk pos edge trigger
			if rst_n = '0' then	  --synch reset
				a_pe <= '0';
				a_delayed <= '0';
			else			   --otherswise change output
				a_delayed <= a;
				a_pe <= not a_delayed and a;
			end if;
		end if;
	end process;
end behavioral;