library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROB_Mux_Data is
    Port ( Sel : in  STD_LOGIC_VECTOR (2 downto 0);
           Value_0 : in  STD_LOGIC_VECTOR (31 downto 0);
           Value_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Value_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Value_3 : in  STD_LOGIC_VECTOR (31 downto 0);
           Value_4 : in  STD_LOGIC_VECTOR (31 downto 0);
           Value_5 : in  STD_LOGIC_VECTOR (31 downto 0);
           Value_6 : in  STD_LOGIC_VECTOR (31 downto 0);
           Value_7 : in  STD_LOGIC_VECTOR (31 downto 0);
           Mux_Out : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000");
end ROB_Mux_Data;

architecture Behavioral of ROB_Mux_Data is

begin
	Mux_Out <= Value_0 when Sel = "000" else
				  Value_1 when Sel = "001" else
				  Value_2 when Sel = "010" else
				  Value_3 when Sel = "011" else
				  Value_4 when Sel = "100" else
				  Value_5 when Sel = "101" else
				  Value_6 when Sel = "110" else
				  Value_7 when Sel = "111" else
				  "00000000000000000000000000000000";
end Behavioral;