
library ieee;
use ieee.std_logic_1164.all;
use work.myLib.all ;
entity GCD_tb is

end GCD_tb;

architecture BEV of GCD_tb is
 Constant data_width : Integer := 8;
 Signal RST, CLK: std_logic;
 Signal Start_i:  std_logic;
 Signal X_i, Y_i: std_logic_vector (data_width -1 downto 0);
 Signal GCD_o :  std_logic_vector (data_width -1 downto 0);
 Signal Done_o :  std_logic;
 begin


 UUT : GCD
 generic map (data_width)
 port map(
	RST, CLK,
	Start_i,
	X_i, Y_i,
	GCD_o,
	Done_o 

);
-- clock
CLK_sig : process
begin
 CLK <= '1'; wait for 1 ns;
 CLK <= '0'; wait for 1 ns;
end process;

--stimulus
Stimulus : process
begin 
 -- Test Case 1: X_i = 12, Y_i = 4
    X_i <= X"0C";
    Y_i <= X"04";
    Start_i <= '1';
    RST <= '1'; 
    wait for 10 ns;
    RST <= '0'; 
    wait for 10 ns;
    Start_i <= '0';

    -- Test Case 2: X_i = 15, Y_i = 12
    X_i <= X"0F";
    Y_i <= X"0C";
    Start_i <= '1';
    RST <= '1'; 
    wait for 10 ns;
    RST <= '0'; 
    wait for 10 ns;
    wait until Done_o = '1';
    Start_i <= '0';

    wait for 300 ns;  -- Optional delay between test cases
   
wait;
end process;
end BEV;
