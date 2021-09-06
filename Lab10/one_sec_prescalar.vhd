library ieee;
use ieee.std_logic_1164.all;


entity one_sec_prescalar is
port(
	clk : in std_logic; -- system clock
	rst_n : in std_logic; -- active low synchronous reset
	clr_n : in std_logic; -- synchronous clear
	cnt_en : in std_logic; -- count enable
	one_hz : out std_logic; -- one Hz square wave output
	one_sec_tick : out std_logic -- one clock wide pulse every sec
);
end one_sec_prescalar;	

architecture behavioral of one_sec_prescalar is
	
	begin 
		pos_edge: process (clk, rst_n, clr_n, cnt_en)
		variable counter : integer := 0;
	
		begin
			if rising_edge(clk) then
				
				one_sec_tick <= '0';
				
				if ((rst_n = '0') or (clr_n = '0')) then
					counter := 0;
					one_sec_tick <= '0';
					one_hz <= '0';
				end if;
				
				if(cnt_en = '1') then
					counter := counter + 1;
				end if;
				
				if (counter = 16384) then
					one_hz <= '1';
				elsif (counter = 32768) then
					one_hz <= '0';
					one_sec_tick <= '1';
					counter := 0;
				end if;
			
			end if;
			
		end process;

end behavioral;