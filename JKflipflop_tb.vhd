
library ieee;
use ieee.std_logic_1164.all;

entity JK_FlipFlop_TB is
end entity JK_FlipFlop_TB;

architecture Behavioral of JK_FlipFlop_TB is
    -- Khai báo tín hi?u c?n thi?t
    signal J, K, CLK, RST : std_logic;
    signal Q, Q_bar : std_logic;

    -- Component under test
    component JK_FlipFlop
        port (
            J, K, CLK, RST : in std_logic;
            Q, Q_bar       : out std_logic
        );
    end component JK_FlipFlop;

begin
    -- Instantiate JK flip-flop
    DUT : JK_FlipFlop
    port map (
        J    => J,
        K    => K,
        CLK  => CLK,
        RST  => RST,
        Q    => Q,
        Q_bar => Q_bar
    );

    -- Stimulus process
    stimulus_process : process
    begin
        -- Apply reset
        RST <= '1';
        wait for 10 ns;

        -- Release reset
        RST <= '0';

        -- Test case 1: Set Q
        J <= '1';
        K <= '0';
        wait for 10 ns;

        -- Test case 2: Reset Q
        J <= '0';
        K <= '1';
        wait for 10 ns;

        -- Test case 3: Toggle Q
        J <= '1';
        K <= '1';
        wait for 10 ns;

        -- End simulation
        wait;
    end process stimulus_process;

end architecture Behavioral;
