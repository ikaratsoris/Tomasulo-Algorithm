library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROB_Module is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  Insert_En : in  STD_LOGIC;
			  Remove_En : in  STD_LOGIC;
			  CDB_V : in  STD_LOGIC_VECTOR (31 downto 0);
			  CDB_Q : in  STD_LOGIC_VECTOR (4 downto 0);
			  Instr_Rj : in  STD_LOGIC_VECTOR (4 downto 0);
			  Instr_Rk : in  STD_LOGIC_VECTOR (4 downto 0);
			  Instr_PC : in  STD_LOGIC_VECTOR (31 downto 0);
			  Instr_Type : in  STD_LOGIC_VECTOR (3 downto 0);
			  Instr_Dest : in  STD_LOGIC_VECTOR (4 downto 0);
			  Instr_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
			  Reg_PC_Out : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
			  Reg_Dest_Out : out  STD_LOGIC_VECTOR (4 downto 0):= "00000";
			  Reg_Value_Out : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
			  Reg_Tag_Out : out  STD_LOGIC_VECTOR (4 downto 0):= "00000";
			  Reg_Done_Out : out  STD_LOGIC:= '0';
			  Valid_Bit_Rj : out  STD_LOGIC:= '0';
			  Valid_Bit_Rk : out  STD_LOGIC:= '0');
end ROB_Module;

architecture Behavioral of ROB_Module is

COMPONENT ROB_Write_Control
PORT(
	CDB_V : IN std_logic_vector(31 downto 0);
	CDB_Q : IN std_logic_vector(4 downto 0);
	Insert_En : IN std_logic;
	Remove_En : IN std_logic;
	Instr_PC : IN std_logic_vector(31 downto 0);
	Instr_Type : IN std_logic_vector(3 downto 0);
	Instr_Dest : IN std_logic_vector(4 downto 0);
	Instr_Tag : IN std_logic_vector(4 downto 0);
	Reg_Tag : IN std_logic_vector(4 downto 0);          
	WrEn_PC : OUT std_logic;
	WrEn_Instr_Type : OUT std_logic;
	WrEn_Dest : OUT std_logic;
	WrEn_Value : OUT std_logic;
	WrEn_Tag : OUT std_logic;
	WrEn_Done : OUT std_logic;
	Output_PC : OUT std_logic_vector(31 downto 0);
	Output_Instr_Type : OUT std_logic_vector(3 downto 0);
	Output_Dest : OUT std_logic_vector(4 downto 0);
	Output_Value : OUT std_logic_vector(31 downto 0);
	Output_Tag : OUT std_logic_vector(4 downto 0);
	Output_Done : OUT std_logic
	);
END COMPONENT;

COMPONENT ROB_Registers_Module
PORT(
	Clk : IN std_logic;
	Reset : IN std_logic;
	PC_WE : IN std_logic;
	Instr_Type_WE : IN std_logic;
	Dest_WE : IN std_logic;
	Value_WE : IN std_logic;
	Tag_WE : IN std_logic;
	Done_WE : IN std_logic;
	PC_In : IN std_logic_vector(31 downto 0);
	Instr_Type_In : IN std_logic_vector(3 downto 0);
	Dest_In : IN std_logic_vector(4 downto 0);
	Value_In : IN std_logic_vector(31 downto 0);
	Tag_In : IN std_logic_vector(4 downto 0);
	Done_In : IN std_logic;          
	PC_Out : OUT std_logic_vector(31 downto 0);
	Instr_Type_Out : OUT std_logic_vector(3 downto 0);
	Dest_Out : OUT std_logic_vector(4 downto 0);
	Value_Out : OUT std_logic_vector(31 downto 0);
	Tag_Out : OUT std_logic_vector(4 downto 0);
	Done_Out : OUT std_logic
	);
END COMPONENT;

COMPONENT ROB_Dest_Reg_Comparator
PORT(
	Rx_In : IN std_logic_vector(4 downto 0);
	Dest_Reg_In : IN std_logic_vector(4 downto 0);          
	Valid_Bit : OUT std_logic
	);
END COMPONENT;

signal WrCtrl2Reg_WrEn_PC, WrCtrl2Reg_WrEn_Instr_Type, WrCtrl2Reg_WrEn_Dest,
		 WrCtrl2Reg_WrEn_Value, WrCtrl2Reg_WrEn_Tag, WrCtrl2Reg_WrEn_Done,
		 WrCtrl2Reg_Done, Reg_Done: STD_LOGIC:= '0';
signal WrCtrl2Reg_Instr_Type, Reg_Instr_Type: STD_LOGIC_VECTOR(3 downto 0):= "0000";
signal WrCtrl2Reg_Dest, WrCtrl2Reg_Tag, Reg_Dest, Reg_Tag: STD_LOGIC_VECTOR(4 downto 0):= "00000";
signal WrCtrl2Reg_PC, WrCtrl2Reg_Value, Reg_PC, Reg_Value: STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000";

begin
	Write_Control: ROB_Write_Control PORT MAP(
		CDB_V => CDB_V, --Eksoteriko sima(in)
		CDB_Q => CDB_Q, --Eksoteriko sima(in)
		Insert_En => Insert_En, --Eksoteriko sima(in)
		Remove_En => Remove_En, --Eksoteriko sima(in)
		Instr_PC => Instr_PC, --Eksoteriko sima(in)
		Instr_Type => Instr_Type, --Eksoteriko sima(in)
		Instr_Dest => Instr_Dest, --Eksoteriko sima(in)
		Instr_Tag => Instr_Tag, --Eksoteriko sima(in)
		Reg_Tag => Reg_Tag,
		WrEn_PC => WrCtrl2Reg_WrEn_PC,
		WrEn_Instr_Type => WrCtrl2Reg_WrEn_Instr_Type,
		WrEn_Dest => WrCtrl2Reg_WrEn_Dest,
		WrEn_Value => WrCtrl2Reg_WrEn_Value,
		WrEn_Tag => WrCtrl2Reg_WrEn_Tag,
		WrEn_Done => WrCtrl2Reg_WrEn_Done,
		Output_PC => WrCtrl2Reg_PC,
		Output_Instr_Type => WrCtrl2Reg_Instr_Type,
		Output_Dest => WrCtrl2Reg_Dest,
		Output_Value => WrCtrl2Reg_Value,
		Output_Tag => WrCtrl2Reg_Tag,
		Output_Done => WrCtrl2Reg_Done
	);
	
	Registers_Module: ROB_Registers_Module PORT MAP(
		Clk => Clk, --Eksoteriko sima(in)
		Reset => Reset, --Eksoteriko sima(in)
		PC_WE => WrCtrl2Reg_WrEn_PC,
		Instr_Type_WE => WrCtrl2Reg_WrEn_Instr_Type,
		Dest_WE => WrCtrl2Reg_WrEn_Dest,
		Value_WE => WrCtrl2Reg_WrEn_Value,
		Tag_WE => WrCtrl2Reg_WrEn_Tag,
		Done_WE => WrCtrl2Reg_WrEn_Done,
		PC_In => WrCtrl2Reg_PC,
		Instr_Type_In => WrCtrl2Reg_Instr_Type,
		Dest_In => WrCtrl2Reg_Dest,
		Value_In => WrCtrl2Reg_Value,
		Tag_In => WrCtrl2Reg_Tag,
		Done_In => WrCtrl2Reg_Done,
		PC_Out => Reg_PC,
		Instr_Type_Out => Reg_Instr_Type,
		Dest_Out => Reg_Dest,
		Value_Out => Reg_Value,
		Tag_Out => Reg_Tag,
		Done_Out => Reg_Done
	);
	
	Rj_Dest_Comparator: ROB_Dest_Reg_Comparator PORT MAP(
		Rx_In => Instr_Rj, --Eksoteriko sima(in)
		Dest_Reg_In => Reg_Dest,
		Valid_Bit => Valid_Bit_Rj--Eksoteriko sima(out)
	);
	
	Rk_Dest_Comparator: ROB_Dest_Reg_Comparator PORT MAP(
		Rx_In => Instr_Rk, --Eksoteriko sima(in)
		Dest_Reg_In => Reg_Dest,
		Valid_Bit => Valid_Bit_Rk --Eksoteriko sima(out)
	);
	
	Reg_PC_Out <= Reg_PC; --Eksoteriko sima(out)
	Reg_Dest_Out <= Reg_Dest; --Eksoteriko sima(out)
	Reg_Value_Out <= Reg_Value; --Eksoteriko sima(out)
	Reg_Tag_Out <= Reg_Tag; --Eksoteriko sima(out)
	Reg_Done_Out <= Reg_Done; --Eksoteriko sima(out)
end Behavioral;