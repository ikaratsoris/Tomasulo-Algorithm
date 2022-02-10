library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CDB_Mux_Tag is
    Port ( Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Arith_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
           Logic_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
           LS_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
           Mux_Tag_Out : out  STD_LOGIC_VECTOR (4 downto 0):= "00000");
end CDB_Mux_Tag;

architecture Behavioral of CDB_Mux_Tag is

begin
	Mux_Tag_Out <= Arith_Tag when Sel = "00" else
						Logic_Tag when Sel = "01" else
						LS_Tag when Sel = "10" else
						"00000";
end Behavioral;