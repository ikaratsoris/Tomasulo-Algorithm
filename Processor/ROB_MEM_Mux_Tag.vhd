library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROB_MEM_Mux_Tag is
    Port ( Sel : in  STD_LOGIC;
           ROB_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
           Mux_Tag_Out : out  STD_LOGIC_VECTOR (4 downto 0):= "00000");
end ROB_MEM_Mux_Tag;

architecture Behavioral of ROB_MEM_Mux_Tag is

begin
	Mux_Tag_Out <= "00000" when Sel = '0' else ROB_Tag;
end Behavioral;