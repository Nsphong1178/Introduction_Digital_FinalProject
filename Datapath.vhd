
library ieee;
use ieee.std_logic_1164.all;
use work.myLib.all;
entity Datapath is
 generic (data_width : Integer := 8);
 port(
--	RST, CLK: in std_logic;
--	X_i, Y_i: in std_logic_vector (data_width -1 downto 0);
--	GCD_o : out std_logic_vector (data_width -1 downto 0);
--	X_sel, Y_sel : in std_logic;
--	X_ld, Y_ld : in std_logic;
--	GCD_ld  : in std_logic;
--	X_neq_Y, X_lt_Y : out std_logic
	CLK, RST: in std_logic;
	Data_in: in std_logic_vector (data_width -1 downto 0);
	int_we, we, int_re, re: in std_logic;
	Data_out: out std_logic_vector (data_width -1 downto 0);
	Min_Sel, Addr_Sel: in std_logic;
	Addr: in std_logic_vector (1 downto 0);
	Start: in std_logic;
	Done: in std_logic;
	Z_i, Z_j, A_gt_B: out std_logic;
	
	ld_i, ld_j, En_i, En_j, EN_A, EN_B: in std_logic;

);

end Datapath;

architecture RTL of Datapath is
  SIGNAL State : std_logic_vector(4 DOWNTO 0) ;
  -- Signal for connecting to Mem_block
  signal nReset :      std_logic := '0';
  signal addr : std_logic_vector( ADDR_WIDTH-1 downto 0);
  signal  wen  :       std_logic;
  signal  datain :  std_logic_vector(DATA_WIDTH -1 downto 0);
  signal  ren :       std_logic;
  signal i,i_plus_1,j,i_mux_j : std_logic_vector( ADDR_WIDTH-1 downto 0);
  signal A,B,A_mux_B, dataout : std_logic_vector(DATA_WIDTH -1 downto 0);
  
 begin
 -- mux for X
  X_src <=  X_i when X_sel = '1' else XsubY;
 -- mux for Y
  Y_src <=  Y_i when Y_sel = '1' else YsubX;
 -- comparator not equal
 X_neq_Y <= '1' when X /= Y else '0';
 -- reg X
 X_lt_Y <= '1' when X < Y else '0';
-- X - Y
 XsubY <= X - Y;
-- Y - X
 YsubX <= Y - X;
 REGX : REGn
 generic map (data_width => data_width)
 port map(
	RST => RST,
	CLK => CLK,
	EN => X_ld,
	D => X_src,
	Q => X
);
 -- reg Y
REGY : REGn
 generic map (data_width => data_width)
 port map(
	RST => RST,
	CLK => CLK,
	EN => Y_ld,
	D => Y_src,
	Q => Y
);
-- reg GCD
REG_GCD : REGn
 generic map (data_width => data_width)
 port map(
	RST => RST,
	CLK => CLK,
	EN => GCD_ld,
	D => X,
	Q => GCD_o
);
 end RTL;
