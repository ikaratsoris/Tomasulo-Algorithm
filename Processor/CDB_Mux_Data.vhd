library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CDB_Mux_Data is
    Port ( Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Arith_Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Logic_Data : in  STD_LOGIC_VECTOR (31 downto 0);
           LS_Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Mux_Data_Out : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000");
end CDB_Mux_Data;

architecture Behavioral of CDB_Mux_Data is

begin
	Mux_Data_Out <= Arith_Data when Sel = "00" else
						 Logic_Data when Sel = "01" else
						 LS_Data when Sel = "10" else
						 "00000000000000000000000000000000";
end Behavioral;