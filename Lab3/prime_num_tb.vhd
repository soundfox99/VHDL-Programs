-- d:\Bkvhdl_progs\Chap01\half_adder\src\half_adder_tb.vhd

library	ieee;
use ieee.std_logic_1164.all;
library prime_cpos;
use prime_cpos.all;


entity testbench is
end testbench;

architecture behavior of testbench is

	-- Declare local signals to assign values to and observe
	signal a_tb, b_tb, c_tb, d_tb, prime_tb :  std_logic;
	
	begin
	-- Create an instance of the circuit to be tested
	uut: entity prime_num port map(a => a_tb, b => b_tb,
		c => c_tb, d => d_tb, prime => prime_tb);
	
	-- Define a process to apply input stimulus and test outputs
	tb : process
		constant period: time := 20 ns;
		
		begin		-- Apply every possible input combination
		
		d_tb <= '0';	--apply input combination 0000 and check outputs
		c_tb <= '0';
		b_tb <= '0';
		a_tb <= '0';
		wait for period;
		assert ((prime_tb = '0'))
		report "Test Failed Number 0" severity error;
		
		d_tb <= '0';	--apply input combination 0001 and check outputs
		c_tb <= '0';
		b_tb <= '0';
		a_tb <= '1';
		wait for period;
		assert ((prime_tb = '0'))
		report "Test Failed Number 1" severity error;
		
		d_tb <= '0';	--apply input combination 0010 and check outputs
		c_tb <= '0';
		b_tb <= '1';
		a_tb <= '0';
		wait for period;
		assert ((prime_tb = '1'))
		report "Test Failed Number 2" severity error;
		
		d_tb <= '0';	--apply input combination 0011 and check outputs
		c_tb <= '0';
		b_tb <= '1';
		a_tb <= '1';
		wait for period;
		assert ((prime_tb = '1'))
		report "Test Failed Number 3" severity error;
		
		d_tb <= '0';	--apply input combination 0100 and check outputs
		c_tb <= '1';
		b_tb <= '0';
		a_tb <= '0';
		wait for period;
		assert ((prime_tb = '0'))
		report "Test Failed Number 4" severity error;
		
		d_tb <= '0';	--apply input combination 0101 and check outputs
		c_tb <= '1';
		b_tb <= '0';
		a_tb <= '1';
		wait for period;
		assert ((prime_tb = '1'))
		report "Test Failed Number 5" severity error;
		
		d_tb <= '0';	--apply input combination 0110 and check outputs
		c_tb <= '1';
		b_tb <= '1';
		a_tb <= '0';
		wait for period;
		assert ((prime_tb = '0'))
		report "Test Failed Number 6" severity error;
		
		d_tb <= '0';	--apply input combination 0111 and check outputs
		c_tb <= '1';
		b_tb <= '1';
		a_tb <= '1';
		wait for period;
		assert ((prime_tb = '1'))
		report "Test Failed Number 7" severity error;
		
		d_tb <= '1';	--apply input combination 1000 and check outputs
		c_tb <= '0';
		b_tb <= '0';
		a_tb <= '0';
		wait for period;
		assert ((prime_tb = '0'))
		report "Test Failed Number 8" severity error;
		
		d_tb <= '1';	--apply input combination 1001 and check outputs
		c_tb <= '0';
		b_tb <= '0';
		a_tb <= '1';
		wait for period;
		assert ((prime_tb = '0'))
		report "Test Failed Number 9" severity error;
		
		d_tb <= '1';	--apply input combination 1010 and check outputs
		c_tb <= '0';
		b_tb <= '1';
		a_tb <= '0';
		wait for period;
		assert ((prime_tb = '0'))
		report "Test Failed Number 10" severity error;
		
		d_tb <= '1';	--apply input combination 1011 and check outputs
		c_tb <= '0';
		b_tb <= '1';
		a_tb <= '1';
		wait for period;
		assert ((prime_tb = '1'))
		report "Test Failed Number 11" severity error;
		
		d_tb <= '1';	--apply input combination 1100 and check outputs
		c_tb <= '1';
		b_tb <= '0';
		a_tb <= '0';
		wait for period;
		assert ((prime_tb = '0'))
		report "Test Failed Number 12" severity error;
		
		d_tb <= '1';	--apply input combination 1101 and check outputs
		c_tb <= '1';
		b_tb <= '0';
		a_tb <= '1';
		wait for period;
		assert ((prime_tb = '1'))
		report "Test Failed Number 13" severity error;
		
		d_tb <= '1';	--apply input combination 1110 and check outputs
		c_tb <= '1';
		b_tb <= '1';
		a_tb <= '0';
		wait for period;
		assert ((prime_tb = '0'))
		report "Test Failed Number 14" severity error;	
		
		d_tb <= '1';	--apply input combination 1111 and check outputs
		c_tb <= '1';
		b_tb <= '1';
		a_tb <= '1';
		wait for period;
		assert ((prime_tb = '0'))
		report "Test Failed Number 15" severity error;
		
		wait;	-- indefinitely suspend process
		
	end process;
	
end;
