
library ieee;
use ieee.std_logic_1164.all;

entity Controller is
 port(
	RST, CLK: in std_logic;
	Start_i: in std_logic;
	X_sel, Y_sel: out std_logic;
	X_ld, Y_ld : out std_logic;
	GCD_ld : out std_logic;
	X_neq_Y, X_lt_Y : in std_logic;
	Done_o : out std_logic

);

end Controller;

architecture RTL of GCD is
type State_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12);
Signal state : State_type;
begin
FSM : process(RST, CLK)
  begin
    if (RST = '1') then
	State <= S0;
    elsif (CLK'event and CLK = '1') then 
	case State is
		when S0 =>
		State <= S1;
		when S1 =>
		if(Start_i = '1') then
		State <= S2;
		else 
		State <= S1;
		end if;
		when S2 =>
		State <= S3;
		when S3 =>
		State <= S4;
		when S4 =>
		if X_neq_Y = '1' then 
			State <= S5;
		else State <= S9;
		end if;
		when S5 =>
		if X_lt_Y = '1' then
		State <= S6;
		else State <= S7;
		end if;
		when S6 => 
		State <= S4;
		when S7 => 
		State <= S4;
		when S10 =>
		State <= S11;
		when S11 =>
		State <= S12;
		when S12 =>
		State <= S0;
		when others => State <= S0;
	end case;
	end if;
end process;
X_sel <= '1' when state = S2 else '0';
X_ld <= '1' when (state = S2 or state = S7) else '0';

Y_sel <= '1' when state = S3 else '0';
Y_ld <= '1' when (state = S3 or state = S6) else '0';

GCD_ld  <= '1' when state = S9 else '0';
Done_o <= '1' when (state = S10 and state = S11) else '0';
end RTL;
