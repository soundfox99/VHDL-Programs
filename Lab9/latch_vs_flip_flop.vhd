-------------------------------------------------------------------------------
--
-- File        : latch_flip_flop.vhd
-- Design      : latch_flip_flop
-- Architecute : behavioral
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon April 12 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : coded compoenent to compare the outputs of the latch vs flip flop
--
-------------------------------------------------------------------------------

--define needed libraries
library IEEE;
use IEEE.std_logic_1164.all;

library latch_vs_flip_flop;
use latch_vs_flip_flop.all;

--define the entity
entity latch_vs_flip_flop is
	port(
		--define inputs
		 d : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 --define outputs
		 q1 : out STD_LOGIC;
		 qff : out STD_LOGIC
	     );
end latch_vs_flip_flop;

architecture structure of latch_vs_flip_flop is
	--define local version of latch component
	component d_latch
		port(d,le_bar:in std_logic;
		q1:out std_logic);
	end component;
	
	--define local cersion of flip flop compoenent
	component d_flip_flop
		port(d,clk:in std_logic;
		qff:out std_logic);
	end component;
begin
	
	--assign signals to the compoennets
	u1: d_latch port map (d => d, le_bar => clk, q1=>q1);
	u2: d_flip_flop port map (d => d, clk => clk, qff => qff); 
	
end structure;