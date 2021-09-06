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

entity clock_chain is
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
end clock_chain;   

architecture structural of clock_chain is

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
	
	component modulo_24_counter
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
	end component;
	
	signal cnt_en_1_min : std_logic;
	signal cnt_en_1_hour : std_logic;
	signal max_count_sec, max_count_min, max_count_hour : std_logic;
	
begin
	u0 : modulo_60_counter port map (rst_n => rst_n, clk => clk, clr_n => clr_n, load_en => load_sec_en, setting => setting_sec, cnt_en_1 => cnt_en_1, cnt_en_2 => cnt_en_2, max_count => max_count_sec, count => count_sec);
	cnt_en_1_min <= cnt_en_1 and max_count_sec;
	u1 : modulo_60_counter port map (rst_n => rst_n, clk => clk, clr_n => clr_n, load_en => load_min_en, setting => setting_min, cnt_en_1 => cnt_en_1_min, cnt_en_2 => cnt_en_2, max_count => max_count_min, count => count_min);
	cnt_en_1_hour <= (cnt_en_1 and max_count_min and max_count_sec);
	u2 : modulo_24_counter port map (rst_n => rst_n, clk => clk, clr_n => clr_n, load_en => load_hour_en, setting => setting_hour, cnt_en_1 => cnt_en_1_hour, cnt_en_2 => cnt_en_2, max_count => max_count_hour, count => count_hour);
	max_count <= max_count_sec and max_count_min and max_count_hour;
end structural;


