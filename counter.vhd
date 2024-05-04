
library ieee;
use ieee.std_logic_1164.all;

entity Counter is
 generic (data_width : Integer := 8);
 port(
	RST, CLK: in std_logic;
	EN: in std_logic;
	D: in std_logic_vector (data_width -1 downto 0);
	Q : out std_logic_vector (data_width -1 downto 0)

);

end Counter;

architecture RTL of Counter is
    signal count : unsigned(data_width - 1 downto 0);
begin
    process(CLK, RST)
    begin
        if RST = '1' then
            count <= (others => '0');
        elsif rising_edge(CLK) then
            if EN = '1' then
                count <= count + 1;
            end if;
        end if;
    end process;
    
    Q <= std_logic_vector(count);
end RTL;

