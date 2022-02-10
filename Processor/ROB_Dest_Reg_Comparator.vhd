library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROB_Dest_Reg_Comparator is
    Port ( Rx_In : in  STD_LOGIC_VECTOR (4 downto 0);
			  Dest_Reg_In : in  STD_LOGIC_VECTOR (4 downto 0);
			  Valid_Bit : out  STD_LOGIC:= '0');
end ROB_Dest_Reg_Comparator;

architecture Behavioral of ROB_Dest_Reg_Comparator is

begin
	Valid_Bit <= '1' when Rx_In = Dest_Reg_In and Rx_In /= "00000" else '0';
end Behavioral;