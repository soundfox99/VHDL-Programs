-------------------------------------------------------------------------------
--
-- File        : s_r_flip_flop.vhd
-- Design      : s_r_flop_flop
-- Architecute : behavioral
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon April 22 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : s r flip flop implemented in VHDL code
--
-------------------------------------------------------------------------------	

--Define needed libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

--Entity declaration of the SR Flip Flop
entity s_r_flip_flop is	
	port(
		s : in std_logic; -- set input
		r : in std_logic; -- reset input
		clk : in std_logic; -- system clock
		rst_n : in std_logic; -- synchronous SET of FF
		q : out std_logic -- FF output
	);
end s_r_flip_flop;

--Architecture description of the entity
architecture behavioral of s_r_flip_flop is
	signal q_sig : std_logic;
begin
	posedge : process (s,r,clk,rst_n)
	begin
		if rising_edge(clk) then --only change when with rising clock edge
			if rst_n = '0' then	--synchronous set
				q_sig <= '1';
			elsif (s = '1') and (r = '0') then --implement set
				q_sig <= '1';
			elsif (s = '0') and (r = '1') then --implement reset
				q_sig <= '0';
			elsif (s = '0') and (r = '0') then
				q_sig <= s or (not r and q_sig);
			end if;	
		end if;
	end process;
	q <= q_sig;
end behavioral;
