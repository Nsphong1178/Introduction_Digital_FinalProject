library ieee;
use ieee.std_logic_1164.all;

entity Regn is
 generic (data_width : Integer := 8);
 port(
	RST, CLK: in std_logic;
	EN: in std_logic;
	D: in std_logic_vector (data_width -1 downto 0);
	Q : out std_logic_vector (data_width -1 downto 0)

);

end Regn;

architecture RTL of Regn is
begin
 process(RST, CLK)
 begin	
  if (RST = '1') then
	Q <= (others => '0');
  elsif (CLK'event and CLK = '1') then
	if (EN = '1') then 
		Q <= D;
	end if;
  end if;
 end process;
end RTL;