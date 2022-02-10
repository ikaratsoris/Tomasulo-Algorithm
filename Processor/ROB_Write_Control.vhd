library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROB_Write_Control is
    Port ( CDB_V : in  STD_LOGIC_VECTOR (31 downto 0);
			  CDB_Q : in  STD_LOGIC_VECTOR (4 downto 0);
			  Insert_En : in  STD_LOGIC;
			  Remove_En : in  STD_LOGIC;
			  Instr_PC : in  STD_LOGIC_VECTOR (31 downto 0);
			  Instr_Type : in  STD_LOGIC_VECTOR (3 downto 0);
			  Instr_Dest : in  STD_LOGIC_VECTOR (4 downto 0);
			  Instr_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
			  Reg_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
			  WrEn_PC : out  STD_LOGIC:= '0';
			  WrEn_Instr_Type : out  STD_LOGIC:= '0';
			  WrEn_Dest : out  STD_LOGIC:= '0';
			  WrEn_Value : out  STD_LOGIC:= '0';
			  WrEn_Tag : out  STD_LOGIC:= '0';
			  WrEn_Done : out  STD_LOGIC:= '0';
			  Output_PC : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
			  Output_Instr_Type : out  STD_LOGIC_VECTOR (3 downto 0):= "0000";
			  Output_Dest : out  STD_LOGIC_VECTOR (4 downto 0):= "00000";
			  Output_Value : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
			  Output_Tag : out  STD_LOGIC_VECTOR (4 downto 0):= "00000";
			  Output_Done : out  STD_LOGIC:= '0');
end ROB_Write_Control;

architecture Behavioral of ROB_Write_Control is

begin
process(CDB_Q, Insert_En, Remove_En)
	begin
		if Remove_En = '1' then --Arxikopoihsh tou Reg otan teleiwsei thn douleia tou
			WrEn_PC <= '1';
			WrEn_Instr_Type <= '1';
			WrEn_Dest <= '1';
			WrEn_Value <= '1';
			WrEn_Tag <= '1';
			WrEn_Done <= '1';
			Output_PC <= "00000000000000000000000000000000";
			Output_Instr_Type <= "0000";
			Output_Dest <= "00000";
			Output_Value <= "00000000000000000000000000000000";
			Output_Tag <= "00000";
			Output_Done <= '0';
		elsif Insert_En = '1' then --Eisagwgi neas entolis
			WrEn_PC <= '1';
			WrEn_Instr_Type <= '1';
			WrEn_Dest <= '1';
			WrEn_Value <= '1';
			WrEn_Tag <= '1';
			WrEn_Done <= '1';
			Output_PC <= Instr_PC;
			Output_Instr_Type <= Instr_Type;
			Output_Dest <= Instr_Dest;
			Output_Value <= "00000000000000000000000000000000";
			Output_Tag <= Instr_Tag;
			Output_Done <= '0';
		elsif CDB_Q = Reg_Tag and CDB_Q /= "00000" then --Enhmerwsh tou Value kai Done = 1
			WrEn_PC <= '0';
			WrEn_Instr_Type <= '0';
			WrEn_Dest <= '0';
			WrEn_Value <= '1';
			WrEn_Tag <= '1';
			WrEn_Done <= '1';
			Output_PC <= "00000000000000000000000000000000";
			Output_Instr_Type <= "0000";
			Output_Dest <= "00000";
			Output_Value <= CDB_V;
			Output_Tag <= "00000";
			Output_Done <= '1';
		else
			WrEn_PC <= '0';
			WrEn_Instr_Type <= '0';
			WrEn_Dest <= '0';
			WrEn_Value <= '0';
			WrEn_Tag <= '0';
			WrEn_Done <= '0';
			Output_PC <= "00000000000000000000000000000000";
			Output_Instr_Type <= "0000";
			Output_Dest <= "00000";
			Output_Value <= "00000000000000000000000000000000";
			Output_Tag <= "00000";
			Output_Done <= '0';
		end if;
end process;
end Behavioral;