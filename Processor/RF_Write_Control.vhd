library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RF_Write_Control is
    Port ( ROB_Move_0 : in  STD_LOGIC;
			  ROB_Move_1 : in  STD_LOGIC;
			  ROB_Move_2 : in  STD_LOGIC;
			  ROB_Move_3 : in  STD_LOGIC;
			  ROB_Move_4 : in  STD_LOGIC;
			  ROB_Move_5 : in  STD_LOGIC;
			  ROB_Move_6 : in  STD_LOGIC;
			  ROB_Move_7 : in  STD_LOGIC;
			  ROB_Dest_0 : in  STD_LOGIC_VECTOR (4 downto 0);
			  ROB_Dest_1 : in  STD_LOGIC_VECTOR (4 downto 0);
			  ROB_Dest_2 : in  STD_LOGIC_VECTOR (4 downto 0);
			  ROB_Dest_3 : in  STD_LOGIC_VECTOR (4 downto 0);
			  ROB_Dest_4 : in  STD_LOGIC_VECTOR (4 downto 0);
			  ROB_Dest_5 : in  STD_LOGIC_VECTOR (4 downto 0);
			  ROB_Dest_6 : in  STD_LOGIC_VECTOR (4 downto 0);
			  ROB_Dest_7 : in  STD_LOGIC_VECTOR (4 downto 0);
			  ROB_Value_0 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ROB_Value_1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ROB_Value_2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ROB_Value_3 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ROB_Value_4 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ROB_Value_5 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ROB_Value_6 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ROB_Value_7 : in  STD_LOGIC_VECTOR (31 downto 0);
			  RF_WrEn : out  STD_LOGIC:= '0';
			  RF_WrAddr : out  STD_LOGIC_VECTOR (4 downto 0):= "00000";
			  RF_WrData : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000");
end RF_Write_Control;

architecture Behavioral of RF_Write_Control is

begin
process(ROB_Move_0, ROB_Move_1, ROB_Move_2, ROB_Move_3, ROB_Move_4, ROB_Move_5, ROB_Move_6, ROB_Move_7)
	begin
		if ROB_Move_0 = '1' then
			RF_WrEn <= '1';
			RF_WrAddr <= ROB_Dest_0;
			RF_WrData <= ROB_Value_0;
		elsif ROB_Move_1 = '1' then
			RF_WrEn <= '1';
			RF_WrAddr <= ROB_Dest_1;
			RF_WrData <= ROB_Value_1;
		elsif ROB_Move_2 = '1' then
			RF_WrEn <= '1';
			RF_WrAddr <= ROB_Dest_2;
			RF_WrData <= ROB_Value_2;
		elsif ROB_Move_3 = '1' then
			RF_WrEn <= '1';
			RF_WrAddr <= ROB_Dest_3;
			RF_WrData <= ROB_Value_3;
		elsif ROB_Move_4 = '1' then
			RF_WrEn <= '1';
			RF_WrAddr <= ROB_Dest_4;
			RF_WrData <= ROB_Value_4;
		elsif ROB_Move_5 = '1' then
			RF_WrEn <= '1';
			RF_WrAddr <= ROB_Dest_5;
			RF_WrData <= ROB_Value_5;
		elsif ROB_Move_6 = '1' then
			RF_WrEn <= '1';
			RF_WrAddr <= ROB_Dest_6;
			RF_WrData <= ROB_Value_6;
		elsif ROB_Move_7 = '1' then
			RF_WrEn <= '1';
			RF_WrAddr <= ROB_Dest_7;
			RF_WrData <= ROB_Value_7;
		else
			RF_WrEn <= '0';
			RF_WrAddr <= "00000";
			RF_WrData <= "00000000000000000000000000000000";
		end if;
end process;
end Behavioral;