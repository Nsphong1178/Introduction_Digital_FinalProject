library ieee;
use ieee.std_logic_1164.all;

package myLib is
--reg 
component Regn is
 generic (data_width : Integer := 8);
 port(
	RST, CLK: in std_logic;
	EN: in std_logic;
	D: in std_logic_vector (data_width -1 downto 0);
	Q : out std_logic_vector (data_width -1 downto 0)

);
end component;

component Datapath is
 generic (data_width : Integer := 8);
 port(
	RST, CLK: in std_logic;
	X_i, Y_i: in std_logic_vector (data_width -1 downto 0);
	GCD_o : out std_logic_vector (data_width -1 downto 0);
	X_sel, Y_sel : in std_logic;
	X_ld, Y_ld : in std_logic;
	GCD_ld  : in std_logic;
	X_neq_Y, X_lt_Y : out std_logic
);
end component;

component Controller is
 port(
	RST, CLK: in std_logic;
	Start_i: in std_logic;
	X_sel, Y_sel: out std_logic;
	X_ld, Y_ld : out std_logic;
	GCD_ld : out std_logic;
	X_neq_Y, X_lt_Y : in std_logic;
	Done_o : out std_logic

);

end component;

component GCD is
 generic (data_width : Integer := 8);
 port(
	RST, CLK: in std_logic;
	Start_i: in std_logic;
	X_i, Y_i: in std_logic_vector (data_width -1 downto 0);
	GCD_o : out std_logic_vector (data_width -1 downto 0);
	Done_o : out std_logic

);

end component;

end myLib;
