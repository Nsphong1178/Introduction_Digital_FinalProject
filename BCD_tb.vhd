library ieee;
use ieee.std_logic_1164.all;

entity BCD_tb is
end BCD_tb;

architecture BEV of BCD_tb is
    signal CLK, RST : std_logic;
    signal count : std_logic_vector (3 downto 0);
begin
    UUT : entity work.counter_BCD
        port map (
            CLK => CLK,
            RST => RST,
            count => count
        );
    
    -- Clock process
    CLK_sig : process
    begin
        CLK <= '1'; wait for 1 ns;
        CLK <= '0'; wait for 1 ns;
    end process;

    -- Stimulus process
    stimulus : process
    begin
	RST <= '0';
        wait for 50 ns;      -- Wait for some time before starting
        RST <= '1';          -- Release reset
        wait for 20 ns;      -- Wait for some time after releasing reset
	RST <= '0';
	wait for 30 ns;  
        wait;
    end process;

end BEV;
