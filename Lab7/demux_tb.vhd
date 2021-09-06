-------------------------------------------------------------------------------
--
-- File        : demux_tb.vhd
-- Design      : demux
-- Architecute : behavior
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon March 29 14:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : Implement a testbench to to verify a 4 to 1 demultiplexer
--
-------------------------------------------------------------------------------

--Import needed libraries and entities
library ieee;
use ieee.std_logic_1164.all;		
use ieee.std_logic_unsigned.all;
library demux;
use demux.all;

--define entity
entity testbench is
end testbench;

--define architecture
architecture behavior of testbench is

	--define signals
	signal s0, s1: std_logic;
	signal datain: std_logic_vector(3 downto 0);
	signal route0, route1, route2, route3 : std_logic_vector(3 downto 0);
	
	begin
		--define the portmap to the entity
		UUT : entity demux 
			port map ( s0 => s0, s1 => s1, datain => datain,
			route0 => route0, route1 => route1, route2 => route2, route3 => route3);
	
	tb : process
	
	--define constants
	constant period: time := 20ns;
	
	begin 
		datain <= "0000";
		
		s0 <= '0'; --test 00 combination				   
		s1 <= '0'; 
		wait for period;
		--test the outputs of the vector
		assert ((route0 = datain) and (route1 = "ZZZZ") and (route2 = "ZZZZ") and (route3 = "ZZZZ"))
		report "Test Failed for (0,0)" severity error;
			
		s0 <= '1';	--test 01 combination			   
		s1 <= '0'; 
		wait for period; 
		--test the outputs of the vector
		assert ((route0 = "ZZZZ") and (route1 = datain) and (route2 = "ZZZZ") and (route3 = "ZZZZ"))
		report "Test Failed for (1,0)" severity error;
			
		s0 <= '0';	--test 10 combination			   
		s1 <= '1'; 
		wait for period;
		--test the outputs of the vector
		assert ((route0 = "ZZZZ") and (route1 = "ZZZZ") and (route2 = datain) and (route3 = "ZZZZ"))
		report "Test Failed for (0,1)" severity error;
			
			
		s0 <= '1';	--test 11 combination			   
		s1 <= '1'; 
		wait for period;
		--test the outputs of the vector
		assert ((route0 = "ZZZZ") and (route1 = "ZZZZ") and (route2 = "ZZZZ") and (route3 = datain))
		report "Test Failed for (1,1)" severity error;
		
		wait;
		end process;
end behavior;