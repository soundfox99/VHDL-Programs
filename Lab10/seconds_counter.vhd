-------------------------------------------------------------------------------
--
-- File        : seconds_counter.vhd
-- Design      : seconds_counter
-- Architecute : structural
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon April 12 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : count the number of seconds and roll over counter to 0 after 59
--
-------------------------------------------------------------------------------	

--Define needed libraries
library ieee;
use ieee.std_logic_1164.all;

library seconds_counter;
use seconds_counter.all;

--Define entity declaration
entity seconds_counter is
 	port(
 		f32768hz : in std_logic; -- 32.768khz oscillator
 		rst_n : in std_logic; -- active low synchronous reset
 		clk : in std_logic; -- system clock
 		clr_n : in std_logic; -- active low synchronous clear
 		cnt_en_2 : std_logic; -- count enable 2
 		load_en : in std_logic; -- load enable
 		seconds_setting : in std_logic_vector(6 downto 0);
 		one_hz : out std_logic; -- one Hz square wave
 		seconds : out std_logic_vector(6 downto 0); -- seconds
 		max_count : out std_logic -- maximum count
 		
		 );
		 
		 attribute loc: string; 
		attribute loc of f32768hz: signal is "D3";
		attribute loc of rst_n: signal is "F1";
		attribute loc of clk: signal is "J1";
		attribute loc of clr_n: signal is "C2";
		attribute loc of cnt_en_2: signal is "D1";
		attribute loc of load_en: signal is "B4";
		attribute loc of seconds_setting: signal is "A13,F8,C12,E10,F9,E8,E7";

		attribute loc of one_hz: signal is "C5";
		attribute loc of seconds: signal is "A3,A4,A5,B7,B9,F7,C4";
		attribute loc of max_count: signal is "B6";

end seconds_counter;

architecture structural of seconds_counter is
	--define local version of prescalar
	component one_sec_counter
		port(
			f32768hz : in std_logic;	--32.768 kHz oscillator input
			clk : in std_logic;			--1 MHz clock osc input
			rst_n : in std_logic;			--active low synchronous reset
			clr_n : in std_logic;			--synchrounous clear input
			one_sec_tick : out std_logic;	--one system clock wide pulse each sec
			one_hz : out std_logic		--one Hz output square wave
		);
	end component;
	
	--define local version of pos_edge_detector
	component modulo_60_counter
		port(
			rst_n : in std_logic;-- active low synchronous reset
			clk : in std_logic;-- system clock
			clr_n : in std_logic;-- active low synchronous clear
			load_en : in std_logic;-- parallel load active high
			setting : in std_logic_vector(6 downto 0);-- load value
			cnt_en_1 : in std_logic;-- enable count 1
			cnt_en_2 : in std_logic;-- enable count 2
			max_count : out std_logic;-- maximum count flag
			count : out std_logic_vector(6 downto 0)-- BCD count
		);
	end component;
   	
	--defien local signals
	signal temp_one_sec_tick : std_logic;
begin
	
	--assign signals to the compoennets
	u0 : one_sec_counter port map (f32768hz => f32768hz, clk => clk, rst_n => rst_n, clr_n => clr_n, one_sec_tick => temp_one_sec_tick, one_hz => one_hz);
	u1 : modulo_60_counter port map (rst_n => rst_n, clk => clk, clr_n => clr_n, load_en => load_en, setting => seconds_setting, cnt_en_1 => temp_one_sec_tick, cnt_en_2 => cnt_en_2, max_count => max_count, count => seconds);
end structural;