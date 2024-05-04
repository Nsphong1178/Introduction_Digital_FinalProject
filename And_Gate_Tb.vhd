library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity And_Gate_Tb is
end And_Gate_Tb;

architecture testbench of And_Gate_Tb is
    -- Entity instantiation
    component And_Gate
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               X : out STD_LOGIC);
    end component;

    signal A_TB, B_TB, X_TB : STD_LOGIC;
    
begin
    dut : And_Gate
        port map(A => A_TB, B => B_TB, X => X_TB);

    -- Test stimulus process
    stimulus : process
begin
    -- Loop for stimulus generation 100 times
    for i in 1 to 10 loop
        for j in 0 to 3 loop
            case j is
                when 0 =>
                    A_TB <= '0'; B_TB <= '0';
                when 1 =>
                    A_TB <= '0'; B_TB <= '1';
                when 2 =>
                    A_TB <= '1'; B_TB <= '0';
                when 3 =>
                    A_TB <= '1'; B_TB <= '1';
            end case;

            wait for 10 ns;
        end loop;
    end loop;

    wait;
end process stimulus;


end architecture testbench;

