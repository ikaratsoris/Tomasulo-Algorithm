library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS_Module is
    Port ( Clk : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  RS_WrEn : in  STD_LOGIC;
			  RS_Local_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
			  CDB_V_In : in  STD_LOGIC_VECTOR (31 downto 0);
			  CDB_Q_In : in  STD_LOGIC_VECTOR (4 downto 0);
			  Op_In : in  STD_LOGIC_VECTOR (3 downto 0);
			  Tag_In : in  STD_LOGIC_VECTOR (4 downto 0);
			  RF_Vj_In : in  STD_LOGIC_VECTOR (31 downto 0);
			  RF_Qj_In : in  STD_LOGIC_VECTOR (4 downto 0);
			  RF_Vk_In : in  STD_LOGIC_VECTOR (31 downto 0);
			  RF_Qk_In : in  STD_LOGIC_VECTOR (4 downto 0);
			  RS_Q_Ready_Out : out  STD_LOGIC:= '0';
			  RS_Busy_Out : out  STD_LOGIC:= '0';
			  RS_Ready_Out : out  STD_LOGIC:= '0';
			  RS_Data_Out : out  STD_LOGIC_VECTOR (72 downto 0):= "0000000000000000000000000000000000000000000000000000000000000000000000000");
end RS_Module;

architecture Behavioral of RS_Module is

COMPONENT RS_Write_Control
PORT(
	RS_WE : IN std_logic;
	Local_Tag : IN std_logic_vector(4 downto 0);
	CDB_V : IN std_logic_vector(31 downto 0);
	CDB_Q : IN std_logic_vector(4 downto 0);
	Issue_Op : IN std_logic_vector(3 downto 0);
	Issue_Tag : IN std_logic_vector(4 downto 0);
	RF_Vj : IN std_logic_vector(31 downto 0);
	RF_Qj : IN std_logic_vector(4 downto 0);
	RF_Vk : IN std_logic_vector(31 downto 0);
	RF_Qk : IN std_logic_vector(4 downto 0);
	RS_Qj : IN std_logic_vector(4 downto 0);
	RS_Qk : IN std_logic_vector(4 downto 0);          
	WE_Busy : OUT std_logic;
	WE_Op : OUT std_logic;
	WE_Vj : OUT std_logic;
	WE_Qj : OUT std_logic;
	WE_Vk : OUT std_logic;
	WE_Qk : OUT std_logic;
	Busy : OUT std_logic;
	Op : OUT std_logic_vector(3 downto 0);
	Vj : OUT std_logic_vector(31 downto 0);
	Qj : OUT std_logic_vector(4 downto 0);
	Vk : OUT std_logic_vector(31 downto 0);
	Qk : OUT std_logic_vector(4 downto 0)
	);
END COMPONENT;

COMPONENT RS_Registers_Module
PORT(
	CLK : IN std_logic;
	RST : IN std_logic;
	Busy_In : IN std_logic;
	Op_In : IN std_logic_vector(3 downto 0);
	Vj_In : IN std_logic_vector(31 downto 0);
	Qj_In : IN std_logic_vector(4 downto 0);
	Vk_In : IN std_logic_vector(31 downto 0);
	Qk_In : IN std_logic_vector(4 downto 0);
	Busy_WE : IN std_logic;
	Op_WE : IN std_logic;
	Vj_WE : IN std_logic;
	Qj_WE : IN std_logic;
	Vk_WE : IN std_logic;
	Qk_WE : IN std_logic;          
	Busy_Out : OUT std_logic;
	Op_Out : OUT std_logic_vector(3 downto 0);
	Vj_Out : OUT std_logic_vector(31 downto 0);
	Qj_Out : OUT std_logic_vector(4 downto 0);
	Vk_Out : OUT std_logic_vector(31 downto 0);
	Qk_Out : OUT std_logic_vector(4 downto 0)
	);
END COMPONENT;

COMPONENT RS_Read_Control
PORT(
	Local_Tag : IN std_logic_vector(4 downto 0);
	RS_Busy : IN std_logic;
	RS_Op : IN std_logic_vector(3 downto 0);
	RS_Vj : IN std_logic_vector(31 downto 0);
	RS_Qj : IN std_logic_vector(4 downto 0);
	RS_Vk : IN std_logic_vector(31 downto 0);
	RS_Qk : IN std_logic_vector(4 downto 0);          
	RS_Ready : OUT std_logic;
	RS_Out : OUT std_logic_vector(72 downto 0)
	);
END COMPONENT;

COMPONENT RS_Q_Ready
PORT(
	Reset : IN std_logic;
	Local_Tag : IN std_logic_vector(4 downto 0);
	WrEn_Busy : IN std_logic;
	WrEn_Qj : IN std_logic;
	WrEn_Qk : IN std_logic;
	Input_Busy : IN std_logic;
	Input_Qj : IN std_logic_vector(4 downto 0);
	Input_Qk : IN std_logic_vector(4 downto 0);          
	RS_Ready : OUT std_logic
	);
END COMPONENT;

signal Busy_Wr_to_Reg, WE_Busy_Wr_to_Reg, WE_Op_Wr_to_Reg, WE_Vj_Wr_to_Reg, WE_Qj_Wr_to_Reg, WE_Vk_Wr_to_Reg, WE_Qk_Wr_to_Reg, Busy_Out_Reg_to_Rd: STD_LOGIC:= '0';
signal Op_Wr_to_Reg, Op_Out_Reg_to_Rd: STD_LOGIC_VECTOR(3 downto 0):= "0000";
signal Qj_Wr_to_Reg, Qk_Wr_to_Reg, Qj_Out_Reg_to_Rd, Qk_Out_Reg_to_Rd: STD_LOGIC_VECTOR(4 downto 0):= "00000";
signal Vj_Wr_to_Reg, Vk_Wr_to_Reg, Vj_Out_Reg_to_Rd, Vk_Out_Reg_to_Rd: STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000";

begin
	Write_Control: RS_Write_Control PORT MAP(
		RS_WE => RS_WrEn, --eksotriko sima
		Local_Tag => RS_Local_Tag, --eksotriko sima
		CDB_V => CDB_V_In, --eksotriko sima
		CDB_Q => CDB_Q_In, --eksotriko sima
		Issue_Op => Op_In, --eksotriko sima
		Issue_Tag => Tag_In, --eksotriko sima
		RF_Vj => RF_Vj_In, --eksotriko sima
		RF_Qj => RF_Qj_In, --eksotriko sima
		RF_Vk => RF_Vk_In, --eksotriko sima
		RF_Qk => RF_Qk_In, --eksotriko sima
		RS_Qj => Qj_Out_Reg_to_Rd,
		RS_Qk => Qk_Out_Reg_to_Rd,
		WE_Busy => WE_Busy_Wr_to_Reg,
		WE_Op => WE_Op_Wr_to_Reg,
		WE_Vj => WE_Vj_Wr_to_Reg,
		WE_Qj => WE_Qj_Wr_to_Reg,
		WE_Vk => WE_Vk_Wr_to_Reg,
		WE_Qk => WE_Qk_Wr_to_Reg,
		Busy => Busy_Wr_to_Reg,
		Op => Op_Wr_to_Reg,
		Vj => Vj_Wr_to_Reg,
		Qj => Qj_Wr_to_Reg,
		Vk => Vk_Wr_to_Reg,
		Qk => Qk_Wr_to_Reg
	);
	
	Registers_Module: RS_Registers_Module PORT MAP(
		CLK => Clk,
		RST => Reset, --eksotriko sima
		Busy_In => Busy_Wr_to_Reg,
		Op_In => Op_Wr_to_Reg,
		Vj_In => Vj_Wr_to_Reg,
		Qj_In => Qj_Wr_to_Reg,
		Vk_In => Vk_Wr_to_Reg,
		Qk_In => Qk_Wr_to_Reg,
		Busy_WE => WE_Busy_Wr_to_Reg,
		Op_WE => WE_Op_Wr_to_Reg,
		Vj_WE => WE_Vj_Wr_to_Reg,
		Qj_WE => WE_Qj_Wr_to_Reg,
		Vk_WE => WE_Vk_Wr_to_Reg,
		Qk_WE => WE_Qk_Wr_to_Reg,
		Busy_Out => Busy_Out_Reg_to_Rd,
		Op_Out => Op_Out_Reg_to_Rd,
		Vj_Out => Vj_Out_Reg_to_Rd,
		Qj_Out => Qj_Out_Reg_to_Rd,
		Vk_Out => Vk_Out_Reg_to_Rd,
		Qk_Out => Qk_Out_Reg_to_Rd
	);
	
	Read_Control: RS_Read_Control PORT MAP(
		Local_Tag => RS_Local_Tag, --eksotriko sima
		RS_Busy => Busy_Out_Reg_to_Rd,
		RS_Op => Op_Out_Reg_to_Rd,
		RS_Vj => Vj_Out_Reg_to_Rd,
		RS_Qj => Qj_Out_Reg_to_Rd,
		RS_Vk => Vk_Out_Reg_to_Rd,
		RS_Qk => Qk_Out_Reg_to_Rd,
		RS_Ready => RS_Ready_Out, --eksotriko sima
		RS_Out => RS_Data_Out --eksotriko sima
	);
	
	Q_Ready: RS_Q_Ready PORT MAP(
		Reset => Reset, --eksotriko sima
		Local_Tag => RS_Local_Tag, --eksotriko sima
		WrEn_Busy => WE_Busy_Wr_to_Reg,
		WrEn_Qj => WE_Qj_Wr_to_Reg,
		WrEn_Qk => WE_Qk_Wr_to_Reg,
		Input_Busy => Busy_Wr_to_Reg,
		Input_Qj => Qj_Wr_to_Reg,
		Input_Qk => Qk_Wr_to_Reg,
		RS_Ready => RS_Q_Ready_Out --eksotriko sima
	);
	
	RS_Busy_Out <= Busy_Out_Reg_to_Rd; --eksotriko sima
end Behavioral;