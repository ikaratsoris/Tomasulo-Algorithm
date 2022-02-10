library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Excep_Control is
    Port ( Clk : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  Arith_Excep_En : in  STD_LOGIC;
           Arith_Excep_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
			  Logic_Excep_En : in  STD_LOGIC;
           Logic_Excep_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
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
			  Ex_En : out  STD_LOGIC:= '0';
			  Ex_PC : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000");
end Excep_Control;

architecture Behavioral of Excep_Control is

COMPONENT Excep_FU_Control
PORT(
	Excep_En : IN std_logic;
	Excep_Tag : IN std_logic_vector(4 downto 0);
	ROB_PC_0 : IN std_logic_vector(31 downto 0);
	ROB_PC_1 : IN std_logic_vector(31 downto 0);
	ROB_PC_2 : IN std_logic_vector(31 downto 0);
	ROB_PC_3 : IN std_logic_vector(31 downto 0);
	ROB_PC_4 : IN std_logic_vector(31 downto 0);
	ROB_PC_5 : IN std_logic_vector(31 downto 0);
	ROB_PC_6 : IN std_logic_vector(31 downto 0);
	ROB_PC_7 : IN std_logic_vector(31 downto 0);
	ROB_Tag_0 : IN std_logic_vector(4 downto 0);
	ROB_Tag_1 : IN std_logic_vector(4 downto 0);
	ROB_Tag_2 : IN std_logic_vector(4 downto 0);
	ROB_Tag_3 : IN std_logic_vector(4 downto 0);
	ROB_Tag_4 : IN std_logic_vector(4 downto 0);
	ROB_Tag_5 : IN std_logic_vector(4 downto 0);
	ROB_Tag_6 : IN std_logic_vector(4 downto 0);
	ROB_Tag_7 : IN std_logic_vector(4 downto 0);          
	ROB_Clear_0 : OUT std_logic;
	ROB_Clear_1 : OUT std_logic;
	ROB_Clear_2 : OUT std_logic;
	ROB_Clear_3 : OUT std_logic;
	ROB_Clear_4 : OUT std_logic;
	ROB_Clear_5 : OUT std_logic;
	ROB_Clear_6 : OUT std_logic;
	ROB_Clear_7 : OUT std_logic;
	Excep_PC : OUT std_logic_vector(31 downto 0)
	);
END COMPONENT;

COMPONENT Excep_PC_Control
PORT(
	Arith_Excep_En : IN std_logic;
	Logic_Excep_En : IN std_logic;
	Arith_Excep_PC : IN std_logic_vector(31 downto 0);
	Logic_Excep_PC : IN std_logic_vector(31 downto 0);          
	Ex_En : OUT std_logic;
	Ex_PC : OUT std_logic_vector(31 downto 0)
	);
END COMPONENT;

COMPONENT Excep_PC_Reg
PORT(
	Clk : IN std_logic;
	Reset : IN std_logic;
	Excep_En_In : IN std_logic;
	Excep_PC_In : IN std_logic_vector(31 downto 0);          
	Excep_En_Out : OUT std_logic;
	Excep_PC_Out : OUT std_logic_vector(31 downto 0)
	);
END COMPONENT;

signal Arith_ROB_Clear_0, Arith_ROB_Clear_1, Arith_ROB_Clear_2, Arith_ROB_Clear_3,
		 Arith_ROB_Clear_4, Arith_ROB_Clear_5, Arith_ROB_Clear_6, Arith_ROB_Clear_7,
		 Logic_ROB_Clear_0, Logic_ROB_Clear_1, Logic_ROB_Clear_2, Logic_ROB_Clear_3,
		 Logic_ROB_Clear_4, Logic_ROB_Clear_5, Logic_ROB_Clear_6, Logic_ROB_Clear_7,
		 Local_En: STD_LOGIC:= '0';
signal Arith_PC, Logic_PC, Local_PC: STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000";

begin
	Arith_Excep_FU_Control: Excep_FU_Control PORT MAP(
		Excep_En => Arith_Excep_En, --Eksoteriko sima
		Excep_Tag => Arith_Excep_Tag, --Eksoteriko sima
		ROB_PC_0 => ROB_PC_0, --Eksoteriko sima
		ROB_PC_1 => ROB_PC_1, --Eksoteriko sima
		ROB_PC_2 => ROB_PC_2, --Eksoteriko sima
		ROB_PC_3 => ROB_PC_3, --Eksoteriko sima
		ROB_PC_4 => ROB_PC_4, --Eksoteriko sima
		ROB_PC_5 => ROB_PC_5, --Eksoteriko sima
		ROB_PC_6 => ROB_PC_6, --Eksoteriko sima
		ROB_PC_7 => ROB_PC_7, --Eksoteriko sima
		ROB_Tag_0 => ROB_Tag_0, --Eksoteriko sima
		ROB_Tag_1 => ROB_Tag_1, --Eksoteriko sima
		ROB_Tag_2 => ROB_Tag_2, --Eksoteriko sima
		ROB_Tag_3 => ROB_Tag_3, --Eksoteriko sima
		ROB_Tag_4 => ROB_Tag_4, --Eksoteriko sima
		ROB_Tag_5 => ROB_Tag_5, --Eksoteriko sima
		ROB_Tag_6 => ROB_Tag_6, --Eksoteriko sima
		ROB_Tag_7 => ROB_Tag_7, --Eksoteriko sima
		ROB_Clear_0 => Arith_ROB_Clear_0,
		ROB_Clear_1 => Arith_ROB_Clear_1,
		ROB_Clear_2 => Arith_ROB_Clear_2,
		ROB_Clear_3 => Arith_ROB_Clear_3,
		ROB_Clear_4 => Arith_ROB_Clear_4,
		ROB_Clear_5 => Arith_ROB_Clear_5,
		ROB_Clear_6 => Arith_ROB_Clear_6,
		ROB_Clear_7 => Arith_ROB_Clear_7,
		Excep_PC => Arith_PC
	);
	
	Logic_Excep_FU_Control: Excep_FU_Control PORT MAP(
		Excep_En => Logic_Excep_En, --Eksoteriko sima
		Excep_Tag => Logic_Excep_Tag, --Eksoteriko sima
		ROB_PC_0 => ROB_PC_0, --Eksoteriko sima
		ROB_PC_1 => ROB_PC_1, --Eksoteriko sima
		ROB_PC_2 => ROB_PC_2, --Eksoteriko sima
		ROB_PC_3 => ROB_PC_3, --Eksoteriko sima
		ROB_PC_4 => ROB_PC_4, --Eksoteriko sima
		ROB_PC_5 => ROB_PC_5, --Eksoteriko sima
		ROB_PC_6 => ROB_PC_6, --Eksoteriko sima
		ROB_PC_7 => ROB_PC_7, --Eksoteriko sima
		ROB_Tag_0 => ROB_Tag_0, --Eksoteriko sima
		ROB_Tag_1 => ROB_Tag_1, --Eksoteriko sima
		ROB_Tag_2 => ROB_Tag_2, --Eksoteriko sima
		ROB_Tag_3 => ROB_Tag_3, --Eksoteriko sima
		ROB_Tag_4 => ROB_Tag_4, --Eksoteriko sima
		ROB_Tag_5 => ROB_Tag_5, --Eksoteriko sima
		ROB_Tag_6 => ROB_Tag_6, --Eksoteriko sima
		ROB_Tag_7 => ROB_Tag_7, --Eksoteriko sima
		ROB_Clear_0 => Logic_ROB_Clear_0,
		ROB_Clear_1 => Logic_ROB_Clear_1,
		ROB_Clear_2 => Logic_ROB_Clear_2,
		ROB_Clear_3 => Logic_ROB_Clear_3,
		ROB_Clear_4 => Logic_ROB_Clear_4,
		ROB_Clear_5 => Logic_ROB_Clear_5,
		ROB_Clear_6 => Logic_ROB_Clear_6,
		ROB_Clear_7 => Logic_ROB_Clear_7,
		Excep_PC => Logic_PC
	);
	
	PC_Control: Excep_PC_Control PORT MAP(
		Arith_Excep_En => Arith_Excep_En, --Eksoteriko sima
		Logic_Excep_En => Logic_Excep_En, --Eksoteriko sima
		Arith_Excep_PC => Arith_PC,
		Logic_Excep_PC => Logic_PC,
		Ex_En => Local_En,
		Ex_PC => Local_PC
	);
	
	PC_Reg: Excep_PC_Reg PORT MAP(
		Clk => Clk,
		Reset => Reset,
		Excep_En_In => Local_En,
		Excep_PC_In => Local_PC,
		Excep_En_Out => Ex_En,
		Excep_PC_Out => Ex_PC
	);

	ROB_Clear_0 <= Arith_ROB_Clear_0 or Logic_ROB_Clear_0; --Eksoteriko sima
	ROB_Clear_1 <= Arith_ROB_Clear_1 or Logic_ROB_Clear_1; --Eksoteriko sima
	ROB_Clear_2 <= Arith_ROB_Clear_2 or Logic_ROB_Clear_2; --Eksoteriko sima
	ROB_Clear_3 <= Arith_ROB_Clear_3 or Logic_ROB_Clear_3; --Eksoteriko sima
	ROB_Clear_4 <= Arith_ROB_Clear_4 or Logic_ROB_Clear_4; --Eksoteriko sima
	ROB_Clear_5 <= Arith_ROB_Clear_5 or Logic_ROB_Clear_5; --Eksoteriko sima
	ROB_Clear_6 <= Arith_ROB_Clear_6 or Logic_ROB_Clear_6; --Eksoteriko sima
	ROB_Clear_7 <= Arith_ROB_Clear_7 or Logic_ROB_Clear_7; --Eksoteriko sima
end Behavioral;