library ieee;
use ieee.std_logic_1164.all;

entity half_adder_tb is
end half_adder_tb;

architecture testbench of half_adder_tb is
component half_adder
  port(
	a, b: in std_logic;
	s, c: out std_logic
);
  end component;

  signal a, b: std_logic := '0';
  signal s, c: std_logic := '0';

begin 
dut : half_adder
port map ( a, b, s, c);

stimulus : process
begin
	a <= '1'; b <= '1'; wait for 2ns;

	a <= '0'; b <= '1'; wait for 2ns;
	a <= '1'; b <= '0'; wait for 2ns;
	a <= '0'; b <= '0'; wait for 2ns;

end process stimulus;
end testbench;
 
