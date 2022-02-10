library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS_Logic is
    Port ( Clk : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  RS_WE : in  STD_LOGIC;
			  CDB_V : in  STD_LOGIC_VECTOR (31 downto 0);
			  CDB_Q : in  STD_LOGIC_VECTOR (4 downto 0);
			  Issue_Op : in  STD_LOGIC_VECTOR (3 downto 0);
			  Issue_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
			  RF_Vj : in  STD_LOGIC_VECTOR (31 downto 0);
			  RF_Qj : in  STD_LOGIC_VECTOR (4 downto 0);
			  RF_Vk : in  STD_LOGIC_VECTOR (31 downto 0);
			  RF_Qk : in  STD_LOGIC_VECTOR (4 downto 0);
			  RS0_Busy : out  STD_LOGIC:= '0';
			  RS1_Busy : out  STD_LOGIC:= '0';
			  RS_Ready : out  STD_LOGIC:= '0';
			  RS_Data : out  STD_LOGIC_VECTOR (72 downto 0):= "0000000000000000000000000000000000000000000000000000000000000000000000000");
end RS_Logic;

architecture Behavioral of RS_Logic is

COMPONENT RS_Module
PORT(
	Clk : IN std_logic;
	Reset : IN std_logic;
	RS_WrEn : IN std_logic;
	RS_Local_Tag : IN std_logic_vector(4 downto 0);
	CDB_V_In : IN std_logic_vector(31 downto 0);
	CDB_Q_In : IN std_logic_vector(4 downto 0);
	Op_In : IN std_logic_vector(3 downto 0);
	Tag_In : IN std_logic_vector(4 downto 0);
	RF_Vj_In : IN std_logic_vector(31 downto 0);
	RF_Qj_In : IN std_logic_vector(4 downto 0);
	RF_Vk_In : IN std_logic_vector(31 downto 0);
	RF_Qk_In : IN std_logic_vector(4 downto 0);          
	RS_Q_Ready_Out : OUT std_logic;
	RS_Busy_Out : OUT std_logic;
	RS_Ready_Out : OUT std_logic;
	RS_Data_Out : OUT std_logic_vector(72 downto 0)
	);
END COMPONENT;

COMPONENT RS_Logic_Mux_Ready
PORT(
	Sel : IN std_logic_vector(1 downto 0);
	RS0_Ready : IN std_logic;
	RS1_Ready : IN std_logic;          
	RS_Logic_Ready : OUT std_logic
	);
END COMPONENT;

COMPONENT RS_Logic_Mux_Data
PORT(
	Sel : IN std_logic_vector(1 downto 0);
	RS0_Data : IN std_logic_vector(72 downto 0);
	RS1_Data : IN std_logic_vector(72 downto 0);          
	RS_Logic_Data : OUT std_logic_vector(72 downto 0)
	);
END COMPONENT;

COMPONENT RS_Logic_Control
PORT(
	Clk : IN std_logic;
	Reset : IN std_logic;
	RS0_Ready : IN std_logic;
	RS1_Ready : IN std_logic;
	CDB_Q : IN std_logic_vector(4 downto 0);          
	Mux_Sel : OUT std_logic_vector(1 downto 0)
	);
END COMPONENT;

signal RS0_Ready, RS1_Ready, RS0_Q_Ready, RS1_Q_Ready: STD_LOGIC:= '0';
signal Mux_Select: STD_LOGIC_VECTOR(1 downto 0):= "11";
signal RS0_Data, RS1_Data: STD_LOGIC_VECTOR(72 downto 0):= "0000000000000000000000000000000000000000000000000000000000000000000000000";

begin
	RS0_Module: RS_Module PORT MAP(
		Clk => Clk,
		Reset => Reset, --eksoteriko sima
		RS_WrEn => RS_WE, --eksoteriko sima
		RS_Local_Tag => "00001",
		CDB_V_In => CDB_V, --eksoteriko sima
		CDB_Q_In => CDB_Q, --eksoteriko sima
		Op_In => Issue_Op, --eksoteriko sima
		Tag_In => Issue_Tag, --eksoteriko sima
		RF_Vj_In => RF_Vj, --eksoteriko sima
		RF_Qj_In => RF_Qj, --eksoteriko sima
		RF_Vk_In => RF_Vk, --eksoteriko sima
		RF_Qk_In => RF_Qk, --eksoteriko sima
		RS_Q_Ready_Out => RS0_Q_Ready,
		RS_Busy_Out => RS0_Busy, --eksoteriko sima
		RS_Ready_Out => RS0_Ready,
		RS_Data_Out => RS0_Data
	);
	
	RS1_Module: RS_Module PORT MAP(
		Clk => Clk,
		Reset => Reset, --eksoteriko sima
		RS_WrEn => RS_WE, --eksoteriko sima
		RS_Local_Tag => "00010",
		CDB_V_In => CDB_V, --eksoteriko sima
		CDB_Q_In => CDB_Q, --eksoteriko sima
		Op_In => Issue_Op, --eksoteriko sima
		Tag_In => Issue_Tag, --eksoteriko sima
		RF_Vj_In => RF_Vj, --eksoteriko sima
		RF_Qj_In => RF_Qj, --eksoteriko sima
		RF_Vk_In => RF_Vk, --eksoteriko sima
		RF_Qk_In => RF_Qk, --eksoteriko sima
		RS_Q_Ready_Out => RS1_Q_Ready,
		RS_Busy_Out => RS1_Busy, --eksoteriko sima
		RS_Ready_Out => RS1_Ready,
		RS_Data_Out => RS1_Data
	);
	
	Mux_Ready: RS_Logic_Mux_Ready PORT MAP(
		Sel => Mux_Select,
		RS0_Ready => RS0_Ready,
		RS1_Ready => RS1_Ready,
		RS_Logic_Ready => RS_Ready
	);
	
	Mux_Data: RS_Logic_Mux_Data PORT MAP(
		Sel => Mux_Select,
		RS0_Data => RS0_Data,
		RS1_Data => RS1_Data,
		RS_Logic_Data => RS_Data
	);
	
	Control: RS_Logic_Control PORT MAP(
		Clk => Clk,
		Reset => Reset, --eksoteriko sima
		RS0_Ready => RS0_Q_Ready,
		RS1_Ready => RS1_Q_Ready,
		CDB_Q => CDB_Q, --eksoteriko sima
		Mux_Sel => Mux_Select
	);
end Behavioral;