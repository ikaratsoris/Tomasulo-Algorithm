library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FU_Arith_WrEn_Control is
    Port ( CDB_Resp : in  STD_LOGIC;
			  Reg_Q_0 : in  STD_LOGIC_VECTOR (4 downto 0); --Reg_0_In
			  Reg_Q_1 : in  STD_LOGIC_VECTOR (4 downto 0); --Reg_1_In
			  Reg_Q_2 : in  STD_LOGIC_VECTOR (4 downto 0); --Reg_2_In
			  Reg_Q_Out : in  STD_LOGIC_VECTOR (4 downto 0); --Reg_2_Out
			  WrEn_0 : out  STD_LOGIC:= '0';
			  WrEn_1 : out  STD_LOGIC:= '0';
           WrEn_2 : out  STD_LOGIC:= '0');
end FU_Arith_WrEn_Control;

architecture Behavioral of FU_Arith_WrEn_Control is

begin
process(CDB_Resp, Reg_Q_0, Reg_Q_1, Reg_Q_2, Reg_Q_Out)
	begin
		if CDB_Resp = '1' then
			if Reg_Q_Out /= "00000" then
				WrEn_0 <= '1';
				WrEn_1 <= '1';
				WrEn_2 <= '1';
			else
				WrEn_0 <= '0';
				WrEn_1 <= '0';
				WrEn_2 <= '0';
			end if;
		else
			if Reg_Q_0 = "00000" and Reg_Q_1 = "00000" and Reg_Q_2 = "00000" and Reg_Q_Out = "00000" then
				WrEn_0 <= '0';
				WrEn_1 <= '0';
				WrEn_2 <= '0';
			elsif Reg_Q_0 /= "00000" and Reg_Q_1 = "00000" and Reg_Q_2 = "00000" and Reg_Q_Out = "00000" then
				WrEn_0 <= '1';
				WrEn_1 <= '0';
				WrEn_2 <= '0';
			elsif Reg_Q_0 = "00000" and Reg_Q_1 /= "00000" and Reg_Q_2 = "00000" and Reg_Q_Out = "00000" then
				WrEn_0 <= '1';
				WrEn_1 <= '1';
				WrEn_2 <= '0';
			elsif Reg_Q_0 /= "00000" and Reg_Q_1 /= "00000" and Reg_Q_2 = "00000" and Reg_Q_Out = "00000" then
				WrEn_0 <= '1';
				WrEn_1 <= '1';
				WrEn_2 <= '0';
			elsif Reg_Q_0 = "00000" and Reg_Q_1 = "00000" and Reg_Q_2 /= "00000" and Reg_Q_Out = "00000" then
				WrEn_0 <= '0';
				WrEn_1 <= '1';
				WrEn_2 <= '1';
			elsif Reg_Q_0 /= "00000" and Reg_Q_1 = "00000" and Reg_Q_2 /= "00000" and Reg_Q_Out = "00000" then
				WrEn_0 <= '1';
				WrEn_1 <= '1';
				WrEn_2 <= '1';
			elsif Reg_Q_0 = "00000" and Reg_Q_1 /= "00000" and Reg_Q_2 /= "00000" and Reg_Q_Out = "00000" then
				WrEn_0 <= '1';
				WrEn_1 <= '1';
				WrEn_2 <= '1';
			elsif Reg_Q_0 /= "00000" and Reg_Q_1 /= "00000" and Reg_Q_2 /= "00000" and Reg_Q_Out = "00000" then
				WrEn_0 <= '1';
				WrEn_1 <= '1';
				WrEn_2 <= '1';
			elsif Reg_Q_0 = "00000" and Reg_Q_1 = "00000" and Reg_Q_2 = "00000" and Reg_Q_Out /= "00000" then
				WrEn_0 <= '0';
				WrEn_1 <= '0';
				WrEn_2 <= '0';
			elsif Reg_Q_0 /= "00000" and Reg_Q_1 = "00000" and Reg_Q_2 = "00000" and Reg_Q_Out /= "00000" then
				WrEn_0 <= '1';
				WrEn_1 <= '0';
				WrEn_2 <= '0';
			elsif Reg_Q_0 = "00000" and Reg_Q_1 /= "00000" and Reg_Q_2 = "00000" and Reg_Q_Out /= "00000" then
				WrEn_0 <= '1';
				WrEn_1 <= '1';
				WrEn_2 <= '0';
			elsif Reg_Q_0 /= "00000" and Reg_Q_1 /= "00000" and Reg_Q_2 = "00000" and Reg_Q_Out /= "00000" then
				WrEn_0 <= '1';
				WrEn_1 <= '1';
				WrEn_2 <= '0';
			elsif Reg_Q_0 = "00000" and Reg_Q_1 = "00000" and Reg_Q_2 /= "00000" and Reg_Q_Out /= "00000" then
				WrEn_0 <= '0';
				WrEn_1 <= '0';
				WrEn_2 <= '0';
			elsif Reg_Q_0 /= "00000" and Reg_Q_1 = "00000" and Reg_Q_2 /= "00000" and Reg_Q_Out /= "00000" then
				WrEn_0 <= '1';
				WrEn_1 <= '0';
				WrEn_2 <= '0';
			elsif Reg_Q_0 = "00000" and Reg_Q_1 /= "00000" and Reg_Q_2 /= "00000" and Reg_Q_Out /= "00000" then
				WrEn_0 <= '0';
				WrEn_1 <= '0';
				WrEn_2 <= '0';
			elsif Reg_Q_0 /= "00000" and Reg_Q_1 /= "00000" and Reg_Q_2 /= "00000" and Reg_Q_Out /= "00000" then
				WrEn_0 <= '0';
				WrEn_1 <= '0';
				WrEn_2 <= '0';
			else
				WrEn_0 <= '0';
				WrEn_1 <= '0';
				WrEn_2 <= '0';
			end if;
		end if;
end process;
end Behavioral;