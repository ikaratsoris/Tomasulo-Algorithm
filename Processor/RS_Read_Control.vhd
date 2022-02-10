library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS_Read_Control is
    Port ( Local_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
			  RS_Busy : in  STD_LOGIC;
			  RS_Op : in  STD_LOGIC_VECTOR (3 downto 0);
           RS_Vj : in  STD_LOGIC_VECTOR (31 downto 0);
           RS_Qj : in  STD_LOGIC_VECTOR (4 downto 0);
           RS_Vk : in  STD_LOGIC_VECTOR (31 downto 0);
           RS_Qk : in  STD_LOGIC_VECTOR (4 downto 0);
           RS_Ready : out  STD_LOGIC:= '0';
           RS_Out : out  STD_LOGIC_VECTOR (72 downto 0):= "0000000000000000000000000000000000000000000000000000000000000000000000000");
end RS_Read_Control;

architecture Behavioral of RS_Read_Control is

begin
process(RS_Busy, RS_Op, RS_Vj, RS_Qj, RS_Vk, RS_Qk)
	begin
		if RS_Qj = "00000" and RS_Qk = "00000" and RS_Busy = '1' then
			RS_Ready <= '1';
			RS_Out(72 downto 68) <= Local_Tag;
			RS_Out(67 downto 64) <= RS_Op;
			RS_Out(63 downto 32) <= RS_Vj;
			RS_Out(31 downto 0) <= RS_Vk;
		else
			RS_Ready <= '0';
			RS_Out <= "0000000000000000000000000000000000000000000000000000000000000000000000000";
		end if;
end process;
end Behavioral;