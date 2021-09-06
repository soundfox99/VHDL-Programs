-------------------------------------------------------------------------------
--
-- File        : one_sec_counter.vhd
-- Design      : one_sec_counter
-- Architecute : structural
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon April 12 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : Component outputs a 1 Hz pulse based on 32768Hz input
--
-------------------------------------------------------------------------------

--Define needed libaries
library ieee;
use ieee.std_logic_1164.all;

--Define component entity
entity one_sec_counter is
	port (
	f32768hz : in std_logic;	--32.768 kHz oscillator input
	clk : in std_logic;			--1 MHz clock osc input
	rst_n : in std_logic;			--active low synchronous reset
	clr_n : in std_logic;			--synchrounous clear input
	one_sec_tick : out std_logic;	--one system clock wide pulse each sec
	one_hz : out std_logic		--one Hz output square wave
	);
end one_sec_counter;

--Define compoenent architecutre
architecture structural of one_sec_counter is
	--define local version of prescalar
	component pos_edge_detector
		port(
		a : in std_logic; -- input signal
		rst_n : in std_logic; -- synchronous reset
		clk : in std_logic; -- system clock
		a_pe : out std_logic -- one sys. clk wide pulse
		);
	end component;
	
	--define local version of pos_edge_detector
	component one_sec_prescalar
		port(
			clk : in std_logic; -- system clock
			rst_n : in std_logic; -- active low synchronous reset
			clr_n : in std_logic; -- synchronous clear
			cnt_en : in std_logic; -- count enable
			one_hz : out std_logic; -- one Hz square wave output
			one_sec_tick : out std_logic -- one clock wid
		);
	end component;
	
	--define local variables
	signal temp : std_logic;
	
begin
	
	--assign signals to the compoennets
	u0: pos_edge_detector port map (a => f32768hz, rst_n => rst_n, clk => clk, a_pe => temp);
	u1: one_sec_prescalar port map (cnt_en => temp, rst_n => rst_n, clk => clk, clr_n => clr_n, one_hz => one_hz, one_sec_tick => one_sec_tick);
end structural;