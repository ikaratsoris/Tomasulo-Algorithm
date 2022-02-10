library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RF_Module is
    Port ( Clk : in  STD_LOGIC
	 );
end RF_Module;

architecture Behavioral of RF_Module is

COMPONENT RF_Write_Control
PORT(
	ROB_Move_0 : IN std_logic;
	ROB_Move_1 : IN std_logic;
	ROB_Move_2 : IN std_logic;
	ROB_Move_3 : IN std_logic;
	ROB_Move_4 : IN std_logic;
	ROB_Move_5 : IN std_logic;
	ROB_Move_6 : IN std_logic;
	ROB_Move_7 : IN std_logic;
	ROB_Dest_0 : IN std_logic_vector(4 downto 0);
	ROB_Dest_1 : IN std_logic_vector(4 downto 0);
	ROB_Dest_2 : IN std_logic_vector(4 downto 0);
	ROB_Dest_3 : IN std_logic_vector(4 downto 0);
	ROB_Dest_4 : IN std_logic_vector(4 downto 0);
	ROB_Dest_5 : IN std_logic_vector(4 downto 0);
	ROB_Dest_6 : IN std_logic_vector(4 downto 0);
	ROB_Dest_7 : IN std_logic_vector(4 downto 0);
	ROB_Value_0 : IN std_logic_vector(31 downto 0);
	ROB_Value_1 : IN std_logic_vector(31 downto 0);
	ROB_Value_2 : IN std_logic_vector(31 downto 0);
	ROB_Value_3 : IN std_logic_vector(31 downto 0);
	ROB_Value_4 : IN std_logic_vector(31 downto 0);
	ROB_Value_5 : IN std_logic_vector(31 downto 0);
	ROB_Value_6 : IN std_logic_vector(31 downto 0);
	ROB_Value_7 : IN std_logic_vector(31 downto 0);          
	RF_WrEn : OUT std_logic;
	RF_WrAddr : OUT std_logic_vector(4 downto 0);
	RF_WrData : OUT std_logic_vector(31 downto 0)
	);
END COMPONENT;

COMPONENT RF_Mem
PORT(
	Clk : IN std_logic;
	WrEn : IN std_logic;
	Wr_Addr : IN std_logic_vector(4 downto 0);
	Rd0_Addr : IN std_logic_vector(4 downto 0);
	Rd1_Addr : IN std_logic_vector(4 downto 0);
	Wr_Data : IN std_logic_vector(31 downto 0);          
	Rd0_Data : OUT std_logic_vector(31 downto 0);
	Rd1_Data : OUT std_logic_vector(31 downto 0)
	);
END COMPONENT;

begin
	Write_Control: RF_Write_Control PORT MAP(
		ROB_Move_0 => ,
		ROB_Move_1 => ,
		ROB_Move_2 => ,
		ROB_Move_3 => ,
		ROB_Move_4 => ,
		ROB_Move_5 => ,
		ROB_Move_6 => ,
		ROB_Move_7 => ,
		ROB_Dest_0 => ,
		ROB_Dest_1 => ,
		ROB_Dest_2 => ,
		ROB_Dest_3 => ,
		ROB_Dest_4 => ,
		ROB_Dest_5 => ,
		ROB_Dest_6 => ,
		ROB_Dest_7 => ,
		ROB_Value_0 => ,
		ROB_Value_1 => ,
		ROB_Value_2 => ,
		ROB_Value_3 => ,
		ROB_Value_4 => ,
		ROB_Value_5 => ,
		ROB_Value_6 => ,
		ROB_Value_7 => ,
		RF_WrEn => ,
		RF_WrAddr => ,
		RF_WrData => 
	);
	
	Mem: RF_Mem PORT MAP(
		Clk => Clk,
		WrEn => ,
		Wr_Addr => ,
		Rd0_Addr => ,
		Rd1_Addr => ,
		Wr_Data => ,
		Rd0_Data => ,
		Rd1_Data => 
	);
end Behavioral;