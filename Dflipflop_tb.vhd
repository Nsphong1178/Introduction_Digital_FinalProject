library ieee;
use ieee.std_logic_1164.all;

entity d_flipflop_tb is
end d_flipflop_tb;

architecture testbench of d_flipflop_tb10 is
   component d_flipflop
      port(
         clk, D : in std_logic;
         Q      : out std_logic
      );
   end component;

   signal clk, D : std_logic := '0';
   signal Q : std_logic := '0';

begin
   dut : d_flipflop
      port map(clk, D, Q);

   clock_gen : process
   begin 
      while true loop
         wait for 2 ns;
         clk <= not clk;
      end loop;
   end process clock_gen;

   stimulus : process
   begin
      wait for 4 ns;
      D <= '0'; wait for 4 ns;
      D <= '1'; wait for 4 ns;
      D <= '0'; wait for 20 ns;
      D <= '1'; wait for 10 ns;
      wait for 4 ns;
      D <= '0'; wait for 4 ns;
      D <= '1'; wait for 4 ns;
      D <= '0'; wait for 20 ns;
      D <= '1'; wait for 10 ns;
      wait for 100 ns;  -- Adjust the time according to your simulation requirements
   end process stimulus;

end testbench;

