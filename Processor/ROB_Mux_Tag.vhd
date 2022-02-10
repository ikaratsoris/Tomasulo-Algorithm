library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROB_Mux_Tag is
    Port ( Sel : in  STD_LOGIC_VECTOR (2 downto 0);
           Tag_0 : in  STD_LOGIC_VECTOR (4 downto 0);
           Tag_1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Tag_2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Tag_3 : in  STD_LOGIC_VECTOR (4 downto 0);
           Tag_4 : in  STD_LOGIC_VECTOR (4 downto 0);
           Tag_5 : in  STD_LOGIC_VECTOR (4 downto 0);
           Tag_6 : in  STD_LOGIC_VECTOR (4 downto 0);
           Tag_7 : in  STD_LOGIC_VECTOR (4 downto 0);
           Mux_Out : out  STD_LOGIC_VECTOR (4 downto 0):= "00000");
end ROB_Mux_Tag;

architecture Behavioral of ROB_Mux_Tag is

begin
	Mux_Out <= Tag_0 when Sel = "000" else
				  Tag_1 when Sel = "001" else
				  Tag_2 when Sel = "010" else
				  Tag_3 when Sel = "011" else
				  Tag_4 when Sel = "100" else
				  Tag_5 when Sel = "101" else
				  Tag_6 when Sel = "110" else
				  Tag_7 when Sel = "111" else
				  "00000";
end Behavioral;