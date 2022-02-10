library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Excep_PC_Control is
    Port ( Arith_Excep_En : in  STD_LOGIC;
			  Logic_Excep_En : in  STD_LOGIC;
			  Arith_Excep_PC : in  STD_LOGIC_VECTOR (31 downto 0);
           Logic_Excep_PC : in  STD_LOGIC_VECTOR (31 downto 0);
			  Ex_En : out  STD_LOGIC:= '0';
           Ex_PC : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000");
end Excep_PC_Control;

architecture Behavioral of Excep_PC_Control is

begin
process(Arith_Excep_En, Logic_Excep_En, Arith_Excep_PC, Logic_Excep_PC)
	begin
		if Arith_Excep_En = '1' and Logic_Excep_En = '0' then
			Ex_En <= '1';
			Ex_PC <= Arith_Excep_PC;
		elsif Arith_Excep_En = '0' and Logic_Excep_En = '1' then
			Ex_En <= '1';
			Ex_PC <= Logic_Excep_PC;
		elsif Arith_Excep_En = '1' and Logic_Excep_En = '1' then
			Ex_En <= '1';
			if Arith_Excep_PC < Logic_Excep_PC then
				Ex_PC <= Arith_Excep_PC;
			else
				Ex_PC <= Logic_Excep_PC;
			end if;
		else
			Ex_En <= '0';
			Ex_PC <= "00000000000000000000000000000000";
		end if;
end process;
end Behavioral;