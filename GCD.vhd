library ieee;
use ieee.std_logic_1164.all;
use work.myLib.all;
entity GCD is
 generic (data_width : Integer := 8);
 port(
	RST, CLK: in std_logic;
	Start_i: in std_logic;
	X_i, Y_i: in std_logic_vector (data_width -1 downto 0);
	GCD_o : out std_logic_vector (data_width -1 downto 0);
	Done_o : out std_logic

);

end GCD;

architecture RTL of GCD is

 Signal X_sel, Y_sel : std_logic;
 Signal X_ld, Y_ld : std_logic;
 Signal GCD_ld : std_logic;
 Signal X_neq_Y, X_lt_Y : std_logic;
 begin
 CTRL_UNIT: Controller
 port map (
	RST, CLK,
	Start_i,
	X_sel, Y_sel,
	X_ld, Y_ld ,
	GCD_ld ,
	X_neq_Y, X_lt_Y ,
	Done_o 

);
 
DATA_PATH_UNIT : Datapath
generic map (data_width)
port map(
	RST, CLK,
	X_i, Y_i,
	GCD_o,
	X_sel, Y_sel,
	X_ld, Y_ld,
	GCD_ld,
	X_neq_Y, X_lt_Y
);


end RTL;