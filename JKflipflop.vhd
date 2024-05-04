library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity JK_FlipFlop is
    port (
        J, K, CLK, RST : in std_logic;
        Q, Q_bar       : out std_logic
    );
end entity JK_FlipFlop;

architecture Behavioral_JK of JK_FlipFlop is
    signal Q_next: std_logic;

begin
    process(CLK, RST)
    begin
        if RST = '1' then
            Q_next <= '0';  -- Reset: Set Q to 0
        elsif rising_edge(CLK) then
            if (J = '0' and K = '0') then
                Q_next <= Q_next;  -- Hold state
            elsif (J = '0' and K = '1') then
                Q_next <= '0';  -- Reset state
            elsif (J = '1' and K = '0') then
                Q_next <= '1';  -- Set state
            elsif (J = '1' and K = '1') then
                Q_next <= not Q_next;  -- Toggle state
            end if;
        end if;
    end process;

    Q <= Q_next;
    Q_bar <= not Q_next;
end Behavioral_JK;
