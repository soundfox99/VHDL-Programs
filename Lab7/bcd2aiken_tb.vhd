-------------------------------------------------------------------------------
--
-- File        : bcd2aiken_tb.vhd
-- Design      : bcd2aiken_tb
-- Architecute : behavior
-- Author      : Aditya Jindal

--
-------------------------------------------------------------------------------
--
-- Generated   : Mon March 29 13:26:30 2021
--
-------------------------------------------------------------------------------
--
-- Description : Self Checking Testbench that uses record and arrays to
--		evaulate our BCD to Aiken Binary converter.
--
-------------------------------------------------------------------------------

--import needed libaries and modules
library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_1164.all;
library bcd2aiken;
use bcd2aiken.all;


entity testbench is
end testbench;

architecture behavior of testbench is

	-- Declare local signals to assign values to and observe
	signal a_tb, b_tb, c_tb, d_tb, v_tb, w_tb, x_tb, y_tb :  std_logic;
	
	--Create list of signals we can use to make table
	type test_vector is record
		d : std_logic;
		c : std_logic;
		b : std_logic;
		a : std_logic;
		
		v : std_logic;
		w : std_logic;
		x : std_logic;
		y : std_logic;
	end record;
	
	--Create test_array variable
	type test_array is array (natural range <>)
	of test_vector;
	
	--Create vector table
	constant test_vectors : test_array := 
	--d,c,b,a,v,w,x,y
	(('0','0','0','0','0','0','0','0'),
	('0','0','0','1','0','0','0','1'),
	('0','0','1','0','0','0','1','0'),
	('0','0','1','1','0','0','1','1'),
	('0','1','0','0','0','1','0','0'),
	('0','1','0','1','1','0','1','1'),
	('0','1','1','0','1','1','0','0'),
	('0','1','1','1','1','1','0','1'),
	('1','0','0','0','1','1','1','0'),
	('1','0','0','1','1','1','1','1'),
	('1','0','1','0','-','-','-','-'),
	('1','0','1','1','-','-','-','-'),
	('1','1','0','0','-','-','-','-'),
	('1','1','0','1','-','-','-','-'),
	('1','1','1','0','-','-','-','-'),
	('1','1','1','1','-','-','-','-'));
	
	
	begin
	-- Create an instance of the circuit to be tested
	uut: entity bcd2aiken port map(a => a_tb, b => b_tb,
		c => c_tb, d => d_tb, v => v_tb, w => w_tb,
		x => x_tb, y => y_tb);
	
		-- Define a process to apply input stimulus and test outputs
	
	tb : process
	
		--Define constant needed for the testbench
		constant period: time := 20 ns;
		constant dont_care : boolean := true;
		
		begin		-- Apply every possible input combination
		  
		if (not(dont_care)) then  --conditional if dont_care false
			
		for i in 0 to 9 loop --loop thorugh first 10 arrays of the test vector arrays	
			d_tb <= test_vectors(i).d;	--set values of signals
			c_tb <= test_vectors(i).c;
			b_tb <= test_vectors(i).b;
			a_tb <= test_vectors(i).a;
			wait for period;			--suspend for 20ns
			
			assert (( v_tb = test_vectors(i).v and w_tb = test_vectors(i).w  --evaulate final solutions
				and x_tb = test_vectors(i).x and y_tb = test_vectors(i).y))
			
				report  "Test Failed, dont_care=false, " & integer'image(i) 
						& "Input Combination " 
						& std_logic'image(d_tb) 
						& std_logic'image(c_tb) 
						& std_logic'image(b_tb) 
						& std_logic'image(a_tb)
						& " Expected Value "
						& std_logic'image(test_vectors(i).v) 
						& std_logic'image(test_vectors(i).w) 
						& std_logic'image(test_vectors(i).x) 
						& std_logic'image(test_vectors(i).y)
						& " Actual Value "
						& std_logic'image(v_tb) 
						& std_logic'image(w_tb) 
						& std_logic'image(x_tb) 
						& std_logic'image(y_tb) severity error; --report issue
			
		end loop;	
			
		elsif (dont_care) then  --conditional if dont_care true
			for i in 0 to 15 loop	--loop through the entire array
				d_tb <= test_vectors(i).d;  --assign signal values
				c_tb <= test_vectors(i).c;
				b_tb <= test_vectors(i).b;
				a_tb <= test_vectors(i).a;
				wait for period;
			
				assert (( v_tb = test_vectors(i).v and w_tb = test_vectors(i).w	--evuate signal outputs
					and x_tb = test_vectors(i).x and y_tb = test_vectors(i).y));
				
				report  "Test Failed, dont_care=true, " & integer'image(i) 
						& "Input Combination " 
						& std_logic'image(d_tb) 
						& std_logic'image(c_tb) 
						& std_logic'image(b_tb) 
						& std_logic'image(a_tb)
						& " Expected Value "
						& std_logic'image(test_vectors(i).v) 
						& std_logic'image(test_vectors(i).w) 
						& std_logic'image(test_vectors(i).x) 
						& std_logic'image(test_vectors(i).y)
						& " Actual Value "
						& std_logic'image(v_tb) 
						& std_logic'image(w_tb) 
						& std_logic'image(x_tb) 
						& std_logic'image(y_tb)
					   
				severity error; --report issue
				
			end loop;			
		end if;
		
		wait;	-- indefinitely suspend process
		
		end process;
	
end;
