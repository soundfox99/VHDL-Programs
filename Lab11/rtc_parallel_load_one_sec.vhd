-------------------------------------------------------------------------------
--
-- File        : rtc_parallel_load.vhd
-- Design      : rtc_parallel_load
-- Architecute : structural
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon April 22 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : implementation of a real time clock that will count up to
--		23:59:59
--
-------------------------------------------------------------------------------	

--Define needed libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity declaration of component
entity rtc_parallel_load_one_sec is
	port(
		rst_n : in std_logic; -- active low synchronous reset
		clk : in std_logic; -- system clock
		clr_n : in std_logic; -- active low synchronous clear
		address : in std_logic_vector(3 downto 0);
		data : in std_logic_vector(6 downto 0);
		wr_n : in std_logic; -- write control strobe, active low
		cs_n : in std_logic; -- chip select strobe, active low
		f32768hz : in std_logic; -- 32.768 kHz oscillator input
		max_count : out std_logic;-- max count
		one_hz : out std_logic; -- one Hz output square wave
		count_sec : out std_logic_vector(6 downto 0); -- BCD sec count
		count_min : out std_logic_vector(6 downto 0); -- BCD min count
		count_hour : out std_logic_vector(5 downto 0) -- BCD hour count
	);
	attribute loc: string; 
	attribute loc of f32768hz: signal is "D3";
	attribute loc of rst_n: signal is "F1";
	attribute loc of clk: signal is "J1";
	attribute loc of clr_n: signal is "C2";
	attribute loc of cs_n: signal is "E10";
	attribute loc of wr_n: signal is "B4";

	attribute loc of data: signal is "A13,F8,C12,F9,E8,E7,D7";
	attribute loc of address: signal is "C5,E6,A10,D9";

	attribute loc of one_hz: signal is "B5";
	attribute loc of max_count: signal is "D6";
	attribute loc of count_sec: signal is "A3,A4,A5,B7,B9,F7,C4";
	attribute loc of count_min: signal is "B1, E3, F5,F2,E2,D2,C1";
	attribute loc of count_hour: signal is "H2,G2,L3,K4,K1,J3";

end rtc_parallel_load_one_sec;


--Architecture description of component
architecture structural of rtc_parallel_load_one_sec is	

	--Define local descriptions of components
	component pos_edge_detector
		port(
			a : in std_logic; -- input signal
			rst_n : in std_logic; -- synchronous reset
			clk : in std_logic; -- system clock
			a_pe : out std_logic -- one sys. clk wide pulse
		);
	end component;
	
	component clock_chain
		port(
			rst_n : in std_logic; -- active low synchronous reset
			clk : in std_logic; -- system clock
			clr_n : in std_logic; -- active low synchronous clear
			load_sec_en : in std_logic; -- parallel load active high
			load_min_en : in std_logic; -- parallel load active high
			load_hour_en : in std_logic; -- parallel load active high
			setting_sec : in std_logic_vector(6 downto 0); -- load value
			setting_min : in std_logic_vector(6 downto 0); -- load value
			setting_hour : in std_logic_vector(5 downto 0); -- load value
			cnt_en_1 : in std_logic; -- enable count 1
			cnt_en_2 : in std_logic; -- enable count 2
			max_count : out std_logic; -- maximum count flag
			count_sec : out std_logic_vector(6 downto 0); -- BCD count
			count_min : out std_logic_vector(6 downto 0);-- BCD count
			count_hour : out std_logic_vector(5 downto 0) -- BCD count
		);
	end component;
	
	component write_address_decoder
		port(
			wr : in std_logic; -- write enable input
			cs_n : in std_logic; -- chip select input
			address : in std_logic_vector(3 downto 0); -- address bus
			y : out std_logic_vector(9 downto 0)-- selected high);
		);
	end component;
	
	component s_r_flip_flop
		port(
			s : in std_logic; -- set input
			r : in std_logic; -- reset input
			clk : in std_logic; -- system clock
			rst_n : in std_logic; -- synchronous SET of FF
			q : out std_logic -- FF output
		);
	end component;
	
	component one_sec_counter
		port (
			f32768hz : in std_logic;	--32.768 kHz oscillator input
			clk : in std_logic;			--1 MHz clock osc input
			rst_n : in std_logic;			--active low synchronous reset
			clr_n : in std_logic;			--synchrounous clear input
			one_sec_tick : out std_logic;	--one system clock wide pulse each sec
			one_hz : out std_logic		--one Hz output square wave
		);
		
	end component;
   	
	signal wr_temp, q_temp, one_sec_tick_temp : std_logic;
	signal y_temp : std_logic_vector(9 downto 0);
	
begin 
	--link components together and defien the description of the component
	u0 : pos_edge_detector port map (a => wr_n, rst_n => rst_n, clk => clk, a_pe => wr_temp);
	u1 : write_address_decoder port map (cs_n => cs_n, address => address, wr => wr_temp, y => y_temp);
	u2 : s_r_flip_flop port map (clk => clk, rst_n => rst_n, s => y_temp(4), r => y_temp(0), q => q_temp);
	u3 : one_sec_counter port map (f32768hz => f32768hz, clk => clk, rst_n => rst_n, clr_n => clr_n, one_hz => one_hz, one_sec_tick => one_sec_tick_temp);
	u4 : clock_chain port map (	rst_n => rst_n,
							  	clk => clk,
								clr_n => clr_n,
								load_sec_en => y_temp(1),
								load_min_en	=> y_temp(2),
								load_hour_en => y_temp(3),
								setting_sec => data(6 downto 0),
								setting_min	=> data(6 downto 0),
								setting_hour => data(5 downto 0),
								cnt_en_1 => one_sec_tick_temp,
								cnt_en_2 => q_temp,
								max_count => max_count,
								count_sec => count_sec,
								count_min => count_min,
								count_hour => count_hour
							);
end structural;