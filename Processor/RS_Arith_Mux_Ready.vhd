library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS_Arith_Mux_Ready is
    Port ( Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           RS0_Ready : in  STD_LOGIC;
           RS1_Ready : in  STD_LOGIC;
           RS2_Ready : in  STD_LOGIC;
           RS_Arith_Ready : out  STD_LOGIC:= '0');
end RS_Arith_Mux_Ready;

architecture Behavioral of RS_Arith_Mux_Ready is

begin
	RS_Arith_Ready <= RS0_Ready when Sel = "00" else
						   RS1_Ready when Sel = "01" else
						   RS2_Ready when Sel = "10" else
						   '0';
end Behavioral;