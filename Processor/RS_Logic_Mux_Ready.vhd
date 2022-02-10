library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS_Logic_Mux_Ready is
    Port ( Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           RS0_Ready : in  STD_LOGIC;
           RS1_Ready : in  STD_LOGIC;
           RS_Logic_Ready : out  STD_LOGIC:= '0');
end RS_Logic_Mux_Ready;

architecture Behavioral of RS_Logic_Mux_Ready is

begin
	RS_Logic_Ready <= RS0_Ready when Sel = "00" else
							RS1_Ready when Sel = "01" else
							'0';
end Behavioral;