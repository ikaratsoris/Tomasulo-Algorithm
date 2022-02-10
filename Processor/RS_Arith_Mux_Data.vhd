library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS_Arith_Mux_Data is
    Port ( Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           RS0_Data : in  STD_LOGIC_VECTOR (72 downto 0);
           RS1_Data : in  STD_LOGIC_VECTOR (72 downto 0);
           RS2_Data : in  STD_LOGIC_VECTOR (72 downto 0);
           RS_Arith_Data : out  STD_LOGIC_VECTOR (72 downto 0):= "0000000000000000000000000000000000000000000000000000000000000000000000000");
end RS_Arith_Mux_Data;

architecture Behavioral of RS_Arith_Mux_Data is

begin
	RS_Arith_Data <= RS0_Data when Sel = "00" else
						  RS1_Data when Sel = "01" else
						  RS2_Data when Sel = "10" else
						  "0000000000000000000000000000000000000000000000000000000000000000000000000";
end Behavioral;