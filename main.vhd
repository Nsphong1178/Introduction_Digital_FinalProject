library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           gcd_result : out STD_LOGIC_VECTOR (7 downto 0));
end main;

architecture Behavioral of main is
begin
    process(clk, rst)
    variable temp_a, temp_b : STD_LOGIC_VECTOR (7 downto 0);
    begin
        if rst = '1' then
            temp_a := a;
            temp_b := b;
        elsif rising_edge(clk) then
            while temp_b /= "00000000" loop
                if temp_a > temp_b then
                    temp_a := temp_a - temp_b;
                else
                    temp_b := temp_b - temp_a;
                end if;
            end loop;
            gcd_result <= temp_a;
        end if;
    end process;
end Behavioral;
