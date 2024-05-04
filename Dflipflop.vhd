library IEEE;
use IEEE.std_logic_1164.all;

entity d_flipflop is
	port(
	Q : out std_logic;
	clk : in std_logic;
	D : in std_logic
	);
end d_flipflop;
architecture behavioral of D_flipflop is
begin 
	process(clk)
	begin 
		if(rising_edge(clk)) then
		Q <= D;
		end if;
	end process;
end behavioral;