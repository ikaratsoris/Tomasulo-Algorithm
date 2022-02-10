library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Excep_PC_Reg is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  Excep_En_In : in  STD_LOGIC;
           Excep_PC_In : in  STD_LOGIC_VECTOR (31 downto 0);
           Excep_En_Out : out  STD_LOGIC:= '0';
           Excep_PC_Out : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000");
end Excep_PC_Reg;

architecture Behavioral of Excep_PC_Reg is

signal Lock_PC: STD_LOGIC:= '0';

begin
process
	begin
		wait until Clk'EVENT and Clk = '1';
		if Reset = '1' then
			Lock_PC <= '0';
			Excep_En_Out <= '0';
			Excep_PC_Out <= "00000000000000000000000000000000";
		else
			if Lock_PC = '0' and Excep_En_In = '1' then
				Lock_PC <= '1';
				Excep_En_Out <= '1';
				Excep_PC_Out <= Excep_PC_In;
			end if;
		end if;
end process;
end Behavioral;