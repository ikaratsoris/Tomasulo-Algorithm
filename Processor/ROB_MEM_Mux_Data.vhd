library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROB_MEM_Mux_Data is
    Port ( Sel : in  STD_LOGIC;
           RF_Mem_Value : in  STD_LOGIC_VECTOR (31 downto 0);
           ROB_Value : in  STD_LOGIC_VECTOR (31 downto 0);
           Mux_Data_Out : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000");
end ROB_MEM_Mux_Data;

architecture Behavioral of ROB_MEM_Mux_Data is

begin
	Mux_Data_Out <= RF_Mem_Value when Sel = '0' else ROB_Value;
end Behavioral;