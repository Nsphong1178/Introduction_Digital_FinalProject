
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture behavior of testbench is

    component main
        Port ( 
            a : in std_logic_vector(7 downto 0);
            b : in std_logic_vector(7 downto 0);
            clk : in std_logic;
            rst : in std_logic;
            gcd_result : out std_logic_vector(7 downto 0)
        );
    end component;

begin
    -- S? d?ng mô-?un GCD
    dut: main port map (
        a,
        b,
        clk,
        rst,
        gcd_result
    );

    -- Quy t?c sinh clock
    stimulus : process
    begin
        while true loop
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
        end loop;
    end process;

    -- Quy t?c ki?m tra
    process
    begin
        -- Ch? m?t vài clock cycle tr??c khi ??t reset
        wait for 20 ns;

        -- Thi?t l?p giá tr? ??u vào a và b
        a <= "11001010";
        b <= "10101010";

        -- ??t reset ?? b?t ??u tính toán
        rst <= '1';
        wait for 10 ns;
        rst <= '0';

        -- Ch? cho k?t qu?
        wait until rising_edge(clk);

        -- Ki?m tra k?t qu?
        assert gcd_result = "00001010" report "Failed for GCD of 202 and 170" severity error;

        -- K?t thúc testbench
        wait;
    end process;

end behavior;
