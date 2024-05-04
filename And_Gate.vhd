
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
Port ( 	A: in STD_LOGIC;
	B: in STD_LOGIC;
	X: out STD_LOGIC);
end and_gate;

architecture behavioral of and_gate is
begin 
	process(A, B)
	begin 
		X <= A AND B;
	end process;
end behavioral;
