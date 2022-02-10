library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Excep_FU_Control is
    Port ( Excep_En : in  STD_LOGIC;
           Excep_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
			  ROB_PC_0 : in  STD_LOGIC_VECTOR (31 downto 0);
           ROB_PC_1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ROB_PC_2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ROB_PC_3 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ROB_PC_4 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ROB_PC_5 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ROB_PC_6 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ROB_PC_7 : in  STD_LOGIC_VECTOR (31 downto 0);
           ROB_Tag_0 : in  STD_LOGIC_VECTOR (4 downto 0);
           ROB_Tag_1 : in  STD_LOGIC_VECTOR (4 downto 0);
			  ROB_Tag_2 : in  STD_LOGIC_VECTOR (4 downto 0);
			  ROB_Tag_3 : in  STD_LOGIC_VECTOR (4 downto 0);
			  ROB_Tag_4 : in  STD_LOGIC_VECTOR (4 downto 0);
			  ROB_Tag_5 : in  STD_LOGIC_VECTOR (4 downto 0);
			  ROB_Tag_6 : in  STD_LOGIC_VECTOR (4 downto 0);
			  ROB_Tag_7 : in  STD_LOGIC_VECTOR (4 downto 0);
           ROB_Clear_0 : out  STD_LOGIC:= '0';
           ROB_Clear_1 : out  STD_LOGIC:= '0';
			  ROB_Clear_2 : out  STD_LOGIC:= '0';
			  ROB_Clear_3 : out  STD_LOGIC:= '0';
			  ROB_Clear_4 : out  STD_LOGIC:= '0';
			  ROB_Clear_5 : out  STD_LOGIC:= '0';
			  ROB_Clear_6 : out  STD_LOGIC:= '0';
			  ROB_Clear_7 : out  STD_LOGIC:= '0';
			  Excep_PC : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000");
end Excep_FU_Control;

architecture Behavioral of Excep_FU_Control is

begin
process(Excep_En, Excep_Tag)
	begin
		if Excep_En = '0' then
			Excep_PC <= "00000000000000000000000000000000";
			ROB_Clear_0 <= '0';
			ROB_Clear_1 <= '0';
			ROB_Clear_2 <= '0';
			ROB_Clear_3 <= '0';
			ROB_Clear_4 <= '0';
			ROB_Clear_5 <= '0';
			ROB_Clear_6 <= '0';
			ROB_Clear_7 <= '0';
		else
			if Excep_Tag = ROB_Tag_0 then
				Excep_PC <= ROB_PC_0;
				ROB_Clear_0 <= '1';
				ROB_Clear_1 <= '1';
				ROB_Clear_2 <= '1';
				ROB_Clear_3 <= '1';
				ROB_Clear_4 <= '1';
				ROB_Clear_5 <= '1';
				ROB_Clear_6 <= '1';
				ROB_Clear_7 <= '1';
			elsif Excep_Tag = ROB_Tag_1 then
				Excep_PC <= ROB_PC_1;
				ROB_Clear_0 <= '0';
				ROB_Clear_1 <= '1';
				ROB_Clear_2 <= '1';
				ROB_Clear_3 <= '1';
				ROB_Clear_4 <= '1';
				ROB_Clear_5 <= '1';
				ROB_Clear_6 <= '1';
				ROB_Clear_7 <= '1';
			elsif Excep_Tag = ROB_Tag_2 then
				Excep_PC <= ROB_PC_2;
				ROB_Clear_0 <= '0';
				ROB_Clear_1 <= '0';
				ROB_Clear_2 <= '1';
				ROB_Clear_3 <= '1';
				ROB_Clear_4 <= '1';
				ROB_Clear_5 <= '1';
				ROB_Clear_6 <= '1';
				ROB_Clear_7 <= '1';
			elsif Excep_Tag = ROB_Tag_3 then
				Excep_PC <= ROB_PC_3;
				ROB_Clear_0 <= '0';
				ROB_Clear_1 <= '0';
				ROB_Clear_2 <= '0';
				ROB_Clear_3 <= '1';
				ROB_Clear_4 <= '1';
				ROB_Clear_5 <= '1';
				ROB_Clear_6 <= '1';
				ROB_Clear_7 <= '1';
			elsif Excep_Tag = ROB_Tag_4 then
				Excep_PC <= ROB_PC_4;
				ROB_Clear_0 <= '0';
				ROB_Clear_1 <= '0';
				ROB_Clear_2 <= '0';
				ROB_Clear_3 <= '0';
				ROB_Clear_4 <= '1';
				ROB_Clear_5 <= '1';
				ROB_Clear_6 <= '1';
				ROB_Clear_7 <= '1';
			elsif Excep_Tag = ROB_Tag_5 then
				Excep_PC <= ROB_PC_5;
				ROB_Clear_0 <= '0';
				ROB_Clear_1 <= '0';
				ROB_Clear_2 <= '0';
				ROB_Clear_3 <= '0';
				ROB_Clear_4 <= '0';
				ROB_Clear_5 <= '1';
				ROB_Clear_6 <= '1';
				ROB_Clear_7 <= '1';
			elsif Excep_Tag = ROB_Tag_6 then
				Excep_PC <= ROB_PC_6;
				ROB_Clear_0 <= '0';
				ROB_Clear_1 <= '0';
				ROB_Clear_2 <= '0';
				ROB_Clear_3 <= '0';
				ROB_Clear_4 <= '0';
				ROB_Clear_5 <= '0';
				ROB_Clear_6 <= '1';
				ROB_Clear_7 <= '1';
			elsif Excep_Tag = ROB_Tag_7 then
				Excep_PC <= ROB_PC_7;
				ROB_Clear_0 <= '0';
				ROB_Clear_1 <= '0';
				ROB_Clear_2 <= '0';
				ROB_Clear_3 <= '0';
				ROB_Clear_4 <= '0';
				ROB_Clear_5 <= '0';
				ROB_Clear_6 <= '0';
				ROB_Clear_7 <= '1';
			else
				null;
			end if;
		end if;
end process;
end Behavioral;