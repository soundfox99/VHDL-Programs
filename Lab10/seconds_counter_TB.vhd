-- Task 5 Seconds Counter Testbench
library ieee;
use ieee.std_logic_1164.all;

library seconds_counter;
use seconds_counter.all;

entity seconds_counter_tb is
end seconds_counter_tb;

architecture tb_architecture of seconds_counter_tb is

	-- stimulus signals
	signal f32768hz : std_logic := '0';
	signal rst_n : std_logic;
	signal clk : std_logic := '0';
	signal clr_n : std_logic;
	signal cnt_en_2 : std_logic;
	signal load_en : std_logic;
	signal seconds_setting : std_logic_vector(6 downto 0);
	-- observed signals
	signal one_hz : std_logic;
	signal seconds : std_logic_vector(6 downto 0);
	signal max_count : std_logic;

	constant period_32768hz : time := 30517 ns;
	constant period : time := 1us;	
	
begin

	-- Unit Under Test port map
	UUT : entity seconds_counter
		port map (f32768hz => f32768hz, rst_n => rst_n, clk => clk,
			clr_n => clr_n, cnt_en_2 => cnt_en_2, load_en => load_en,
			seconds_setting => seconds_setting, one_hz => one_hz,
			seconds => seconds,	max_count => max_count);

	rst_n <= '0', '1' after 3 * period;	-- reset signal
	--load_en <= '1', '0' after 3 * period;
	
	clr_n <= '1';			-- unused control signals
	cnt_en_2 <= '1';
	load_en <= '0';
	seconds_setting <= "0001001";
	
	
	f32768hz_clk: process
	begin
		wait for period_32768hz / 2.0;
			f32768hz <= not f32768hz;
	end process;
	
	-- system clock
	sys_clk: process
	begin
		wait for period / 2.0;
		clk <= not clk;		
	end process;
	
end tb_architecture;



