library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RO_Module is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  CDB_V : in  STD_LOGIC_VECTOR(31 downto 0);
			  CDB_Q : in  STD_LOGIC_VECTOR(4 downto 0);
			  Issue_WE : in  STD_LOGIC;
			  Issue_Rj : in  STD_LOGIC_VECTOR(4 downto 0);
			  Issue_Rk : in  STD_LOGIC_VECTOR(4 downto 0);
			  Issue_PC : in  STD_LOGIC_VECTOR(31 downto 0);
			  Issue_Type : in  STD_LOGIC_VECTOR(3 downto 0);
			  Issue_Dest : in  STD_LOGIC_VECTOR(4 downto 0);
			  Issue_Tag : in  STD_LOGIC_VECTOR(4 downto 0);
			  Arith_Excep_En : in  STD_LOGIC;
			  Arith_Excep_Tag : in  STD_LOGIC_VECTOR(4 downto 0);
			  Logic_Excep_En : in  STD_LOGIC;
			  Logic_Excep_Tag : in  STD_LOGIC_VECTOR(4 downto 0);
			  Full_FIFO : out  STD_LOGIC:= '0';
			  External_Mux_j : out  STD_LOGIC:= '0';
			  External_Mux_k : out  STD_LOGIC:= '0';
			  Rj_Tag_Out : out  STD_LOGIC_VECTOR(4 downto 0):= "00000";
			  Rk_Tag_Out : out  STD_LOGIC_VECTOR(4 downto 0):= "00000";
			  Rj_Value_Out : out  STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000";
			  Rk_Value_Out : out  STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000";
			  RF_WrEn : out  STD_LOGIC:= '0';
			  RF_WrAddr : out  STD_LOGIC_VECTOR(4 downto 0):= "00000";
			  RF_WrData : out  STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000";
			  Excep_En : out  STD_LOGIC:= '0';
			  Excep_PC : out  STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000");
end RO_Module;

architecture Behavioral of RO_Module is

COMPONENT ROB_FIFO_Full_Check
PORT(
	FIFO_Head : IN std_logic_vector(2 downto 0);
	FIFO_Tail : IN std_logic_vector(2 downto 0);          
	FIFO_Full : OUT std_logic
	);
END COMPONENT;

COMPONENT ROB_Insert_Control
PORT(
	Reset : IN std_logic;
	Issue_WrEn : IN std_logic;
	Issue_Tag : IN std_logic_vector(4 downto 0);          
	Insert_0 : OUT std_logic;
	Insert_1 : OUT std_logic;
	Insert_2 : OUT std_logic;
	Insert_3 : OUT std_logic;
	Insert_4 : OUT std_logic;
	Insert_5 : OUT std_logic;
	Insert_6 : OUT std_logic;
	Insert_7 : OUT std_logic;
	Tail_FIFO_Out : OUT std_logic_vector(2 downto 0)
	);
END COMPONENT;

COMPONENT ROB_Remove_Control
PORT(
	Reset : IN std_logic;
	Done_0 : IN std_logic;
	Done_1 : IN std_logic;
	Done_2 : IN std_logic;
	Done_3 : IN std_logic;
	Done_4 : IN std_logic;
	Done_5 : IN std_logic;
	Done_6 : IN std_logic;
	Done_7 : IN std_logic;          
	Remove_0 : OUT std_logic;
	Remove_1 : OUT std_logic;
	Remove_2 : OUT std_logic;
	Remove_3 : OUT std_logic;
	Remove_4 : OUT std_logic;
	Remove_5 : OUT std_logic;
	Remove_6 : OUT std_logic;
	Remove_7 : OUT std_logic;
	Head_FIFO_Out : OUT std_logic_vector(2 downto 0)
	);
END COMPONENT;

COMPONENT ROB_Module
PORT(
	Clk : IN std_logic;
	Reset : IN std_logic;
	Insert_En : IN std_logic;
	Remove_En : IN std_logic;
	CDB_V : IN std_logic_vector(31 downto 0);
	CDB_Q : IN std_logic_vector(4 downto 0);
	Instr_Rj : IN std_logic_vector(4 downto 0);
	Instr_Rk : IN std_logic_vector(4 downto 0);
	Instr_PC : IN std_logic_vector(31 downto 0);
	Instr_Type : IN std_logic_vector(3 downto 0);
	Instr_Dest : IN std_logic_vector(4 downto 0);
	Instr_Tag : IN std_logic_vector(4 downto 0);          
	Reg_PC_Out : OUT std_logic_vector(31 downto 0);
	Reg_Dest_Out : OUT std_logic_vector(4 downto 0);
	Reg_Value_Out : OUT std_logic_vector(31 downto 0);
	Reg_Tag_Out : OUT std_logic_vector(4 downto 0);
	Reg_Done_Out : OUT std_logic;
	Valid_Bit_Rj : OUT std_logic;
	Valid_Bit_Rk : OUT std_logic
	);
END COMPONENT;

COMPONENT ROB_Mux_Control
PORT(
	Tail_FIFO : IN std_logic_vector(2 downto 0);
	Valid_Bit_0 : IN std_logic;
	Valid_Bit_1 : IN std_logic;
	Valid_Bit_2 : IN std_logic;
	Valid_Bit_3 : IN std_logic;
	Valid_Bit_4 : IN std_logic;
	Valid_Bit_5 : IN std_logic;
	Valid_Bit_6 : IN std_logic;
	Valid_Bit_7 : IN std_logic;          
	Mux_Sel_Reg_ROB : OUT std_logic_vector(2 downto 0);
	MUX_Sel_ROB_MEM : OUT std_logic
	);
END COMPONENT;

COMPONENT ROB_Mux_Tag
PORT(
	Sel : IN std_logic_vector(2 downto 0);
	Tag_0 : IN std_logic_vector(4 downto 0);
	Tag_1 : IN std_logic_vector(4 downto 0);
	Tag_2 : IN std_logic_vector(4 downto 0);
	Tag_3 : IN std_logic_vector(4 downto 0);
	Tag_4 : IN std_logic_vector(4 downto 0);
	Tag_5 : IN std_logic_vector(4 downto 0);
	Tag_6 : IN std_logic_vector(4 downto 0);
	Tag_7 : IN std_logic_vector(4 downto 0);          
	Mux_Out : OUT std_logic_vector(4 downto 0)
	);
END COMPONENT;

COMPONENT ROB_Mux_Data
PORT(
	Sel : IN std_logic_vector(2 downto 0);
	Value_0 : IN std_logic_vector(31 downto 0);
	Value_1 : IN std_logic_vector(31 downto 0);
	Value_2 : IN std_logic_vector(31 downto 0);
	Value_3 : IN std_logic_vector(31 downto 0);
	Value_4 : IN std_logic_vector(31 downto 0);
	Value_5 : IN std_logic_vector(31 downto 0);
	Value_6 : IN std_logic_vector(31 downto 0);
	Value_7 : IN std_logic_vector(31 downto 0);          
	Mux_Out : OUT std_logic_vector(31 downto 0)
	);
END COMPONENT;

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

COMPONENT Excep_Control
PORT(
	Clk : IN std_logic;
	Reset : IN std_logic;
	Arith_Excep_En : IN std_logic;
	Arith_Excep_Tag : IN std_logic_vector(4 downto 0);
	Logic_Excep_En : IN std_logic;
	Logic_Excep_Tag : IN std_logic_vector(4 downto 0);
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
	Ex_En : OUT std_logic;
	Ex_PC : OUT std_logic_vector(31 downto 0)
	);
END COMPONENT;

signal Insert_En_0, Insert_En_1, Insert_En_2, Insert_En_3, Insert_En_4, Insert_En_5, Insert_En_6, Insert_En_7,
		 Remove_En_0, Remove_En_1, Remove_En_2, Remove_En_3, Remove_En_4, Remove_En_5, Remove_En_6, Remove_En_7,
		 Rmv_0, Rmv_1, Rmv_2, Rmv_3, Rmv_4, Rmv_5, Rmv_6, Rmv_7, ROB_Done_Out_0, ROB_Done_Out_1, ROB_Done_Out_2,
		 ROB_Done_Out_3, ROB_Done_Out_4, ROB_Done_Out_5, ROB_Done_Out_6, ROB_Done_Out_7, ROB_Valid_Bit_Rj_0,
		 ROB_Valid_Bit_Rj_1, ROB_Valid_Bit_Rj_2, ROB_Valid_Bit_Rj_3, ROB_Valid_Bit_Rj_4, ROB_Valid_Bit_Rj_5,
		 ROB_Valid_Bit_Rj_6, ROB_Valid_Bit_Rj_7, ROB_Valid_Bit_Rk_0, ROB_Valid_Bit_Rk_1, ROB_Valid_Bit_Rk_2,
		 ROB_Valid_Bit_Rk_3, ROB_Valid_Bit_Rk_4, ROB_Valid_Bit_Rk_5, ROB_Valid_Bit_Rk_6, ROB_Valid_Bit_Rk_7,
		 Clear_0, Clear_1, Clear_2, Clear_3, Clear_4, Clear_5, Clear_6, Clear_7: STD_LOGIC:= '0';
		 
signal FIFO_Head, FIFO_Tail, Local_Mux_j, Local_Mux_k: STD_LOGIC_VECTOR(2 downto 0):= "000";

signal ROB_Dest_Out_0, ROB_Dest_Out_1, ROB_Dest_Out_2, ROB_Dest_Out_3, ROB_Dest_Out_4, ROB_Dest_Out_5, ROB_Dest_Out_6,
		 ROB_Dest_Out_7, ROB_Tag_Out_0, ROB_Tag_Out_1, ROB_Tag_Out_2, ROB_Tag_Out_3, ROB_Tag_Out_4, ROB_Tag_Out_5, ROB_Tag_Out_6,
		 ROB_Tag_Out_7: STD_LOGIC_VECTOR(4 downto 0):= "00000";

signal ROB_PC_Out_0, ROB_PC_Out_1, ROB_PC_Out_2, ROB_PC_Out_3, ROB_PC_Out_4, ROB_PC_Out_5, ROB_PC_Out_6, ROB_PC_Out_7,
		 ROB_Value_Out_0, ROB_Value_Out_1, ROB_Value_Out_2, ROB_Value_Out_3, ROB_Value_Out_4, ROB_Value_Out_5, ROB_Value_Out_6,
		 ROB_Value_Out_7: STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000";

begin
	FIFO_Full_Check: ROB_FIFO_Full_Check PORT MAP(
		FIFO_Head => FIFO_Head,
		FIFO_Tail => FIFO_Tail,
		FIFO_Full => Full_FIFO--Eksoteriko sima
	);

	Insert_Control: ROB_Insert_Control PORT MAP(
		Reset => Reset,--Eksoteriko sima
		Issue_WrEn => Issue_WE,--Eksoteriko sima
		Issue_Tag => Issue_Tag,--Eksoteriko sima
		Insert_0 => Insert_En_0,
		Insert_1 => Insert_En_1,
		Insert_2 => Insert_En_2,
		Insert_3 => Insert_En_3,
		Insert_4 => Insert_En_4,
		Insert_5 => Insert_En_5,
		Insert_6 => Insert_En_6,
		Insert_7 => Insert_En_7,
		Tail_FIFO_Out => FIFO_Tail
	);
	
	Remove_Control: ROB_Remove_Control PORT MAP(
		Reset => Reset,--Eksoteriko sima
		Done_0 => ROB_Done_Out_0,
		Done_1 => ROB_Done_Out_1,
		Done_2 => ROB_Done_Out_2,
		Done_3 => ROB_Done_Out_3,
		Done_4 => ROB_Done_Out_4,
		Done_5 => ROB_Done_Out_5,
		Done_6 => ROB_Done_Out_6,
		Done_7 => ROB_Done_Out_7,
		Remove_0 => Remove_En_0,
		Remove_1 => Remove_En_1,
		Remove_2 => Remove_En_2,
		Remove_3 => Remove_En_3,
		Remove_4 => Remove_En_4,
		Remove_5 => Remove_En_5,
		Remove_6 => Remove_En_6,
		Remove_7 => Remove_En_7,
		Head_FIFO_Out => FIFO_Head
	);

	ROB_Module_0: ROB_Module PORT MAP(
		Clk => Clk,--Eksoteriko sima
		Reset => Reset,--Eksoteriko sima
		Insert_En => Insert_En_0,
		Remove_En => Rmv_0,
		CDB_V => CDB_V,--Eksoteriko sima
		CDB_Q => CDB_Q,--Eksoteriko sima
		Instr_Rj => Issue_Rj,--Eksoteriko sima
		Instr_Rk => Issue_Rk,--Eksoteriko sima
		Instr_PC => Issue_PC,--Eksoteriko sima
		Instr_Type => Issue_Type,--Eksoteriko sima
		Instr_Dest => Issue_Dest,--Eksoteriko sima
		Instr_Tag => Issue_Tag,--Eksoteriko sima
		Reg_PC_Out => ROB_PC_Out_0,
		Reg_Dest_Out => ROB_Dest_Out_0,
		Reg_Value_Out => ROB_Value_Out_0,
		Reg_Tag_Out => ROB_Tag_Out_0,
		Reg_Done_Out => ROB_Done_Out_0,
		Valid_Bit_Rj => ROB_Valid_Bit_Rj_0,
		Valid_Bit_Rk => ROB_Valid_Bit_Rk_0
	);
	
	ROB_Module_1: ROB_Module PORT MAP(
		Clk => Clk,--Eksoteriko sima
		Reset => Reset,--Eksoteriko sima
		Insert_En => Insert_En_1,
		Remove_En => Rmv_1,
		CDB_V => CDB_V,--Eksoteriko sima
		CDB_Q => CDB_Q,--Eksoteriko sima
		Instr_Rj => Issue_Rj,--Eksoteriko sima
		Instr_Rk => Issue_Rk,--Eksoteriko sima
		Instr_PC => Issue_PC,--Eksoteriko sima
		Instr_Type => Issue_Type,--Eksoteriko sima
		Instr_Dest => Issue_Dest,--Eksoteriko sima
		Instr_Tag => Issue_Tag,--Eksoteriko sima
		Reg_PC_Out => ROB_PC_Out_1,
		Reg_Dest_Out => ROB_Dest_Out_1,
		Reg_Value_Out => ROB_Value_Out_1,
		Reg_Tag_Out => ROB_Tag_Out_1,
		Reg_Done_Out => ROB_Done_Out_1,
		Valid_Bit_Rj => ROB_Valid_Bit_Rj_1,
		Valid_Bit_Rk => ROB_Valid_Bit_Rk_1
	);
	
	ROB_Module_2: ROB_Module PORT MAP(
		Clk => Clk,--Eksoteriko sima
		Reset => Reset,--Eksoteriko sima
		Insert_En => Insert_En_2,
		Remove_En => Rmv_2,
		CDB_V => CDB_V,--Eksoteriko sima
		CDB_Q => CDB_Q,--Eksoteriko sima
		Instr_Rj => Issue_Rj,--Eksoteriko sima
		Instr_Rk => Issue_Rk,--Eksoteriko sima
		Instr_PC => Issue_PC,--Eksoteriko sima
		Instr_Type => Issue_Type,--Eksoteriko sima
		Instr_Dest => Issue_Dest,--Eksoteriko sima
		Instr_Tag => Issue_Tag,--Eksoteriko sima
		Reg_PC_Out => ROB_PC_Out_2,
		Reg_Dest_Out => ROB_Dest_Out_2,
		Reg_Value_Out => ROB_Value_Out_2,
		Reg_Tag_Out => ROB_Tag_Out_2,
		Reg_Done_Out => ROB_Done_Out_2,
		Valid_Bit_Rj => ROB_Valid_Bit_Rj_2,
		Valid_Bit_Rk => ROB_Valid_Bit_Rk_2
	);
	
	ROB_Module_3: ROB_Module PORT MAP(
		Clk => Clk,--Eksoteriko sima
		Reset => Reset,--Eksoteriko sima
		Insert_En => Insert_En_3,
		Remove_En => Rmv_3,
		CDB_V => CDB_V,--Eksoteriko sima
		CDB_Q => CDB_Q,--Eksoteriko sima
		Instr_Rj => Issue_Rj,--Eksoteriko sima
		Instr_Rk => Issue_Rk,--Eksoteriko sima
		Instr_PC => Issue_PC,--Eksoteriko sima
		Instr_Type => Issue_Type,--Eksoteriko sima
		Instr_Dest => Issue_Dest,--Eksoteriko sima
		Instr_Tag => Issue_Tag,--Eksoteriko sima
		Reg_PC_Out => ROB_PC_Out_3,
		Reg_Dest_Out => ROB_Dest_Out_3,
		Reg_Value_Out => ROB_Value_Out_3,
		Reg_Tag_Out => ROB_Tag_Out_3,
		Reg_Done_Out => ROB_Done_Out_3,
		Valid_Bit_Rj => ROB_Valid_Bit_Rj_3,
		Valid_Bit_Rk => ROB_Valid_Bit_Rk_3
	);
	
	ROB_Module_4: ROB_Module PORT MAP(
		Clk => Clk,--Eksoteriko sima
		Reset => Reset,--Eksoteriko sima
		Insert_En => Insert_En_4,
		Remove_En => Rmv_4,
		CDB_V => CDB_V,--Eksoteriko sima
		CDB_Q => CDB_Q,--Eksoteriko sima
		Instr_Rj => Issue_Rj,--Eksoteriko sima
		Instr_Rk => Issue_Rk,--Eksoteriko sima
		Instr_PC => Issue_PC,--Eksoteriko sima
		Instr_Type => Issue_Type,--Eksoteriko sima
		Instr_Dest => Issue_Dest,--Eksoteriko sima
		Instr_Tag => Issue_Tag,--Eksoteriko sima
		Reg_PC_Out => ROB_PC_Out_4,
		Reg_Dest_Out => ROB_Dest_Out_4,
		Reg_Value_Out => ROB_Value_Out_4,
		Reg_Tag_Out => ROB_Tag_Out_4,
		Reg_Done_Out => ROB_Done_Out_4,
		Valid_Bit_Rj => ROB_Valid_Bit_Rj_4,
		Valid_Bit_Rk => ROB_Valid_Bit_Rk_4
	);
	
	ROB_Module_5: ROB_Module PORT MAP(
		Clk => Clk,--Eksoteriko sima
		Reset => Reset,--Eksoteriko sima
		Insert_En => Insert_En_5,
		Remove_En => Rmv_5,
		CDB_V => CDB_V,--Eksoteriko sima
		CDB_Q => CDB_Q,--Eksoteriko sima
		Instr_Rj => Issue_Rj,--Eksoteriko sima
		Instr_Rk => Issue_Rk,--Eksoteriko sima
		Instr_PC => Issue_PC,--Eksoteriko sima
		Instr_Type => Issue_Type,--Eksoteriko sima
		Instr_Dest => Issue_Dest,--Eksoteriko sima
		Instr_Tag => Issue_Tag,--Eksoteriko sima
		Reg_PC_Out => ROB_PC_Out_5,
		Reg_Dest_Out => ROB_Dest_Out_5,
		Reg_Value_Out => ROB_Value_Out_5,
		Reg_Tag_Out => ROB_Tag_Out_5,
		Reg_Done_Out => ROB_Done_Out_5,
		Valid_Bit_Rj => ROB_Valid_Bit_Rj_5,
		Valid_Bit_Rk => ROB_Valid_Bit_Rk_5
	);
	
	ROB_Module_6: ROB_Module PORT MAP(
		Clk => Clk,--Eksoteriko sima
		Reset => Reset,--Eksoteriko sima
		Insert_En => Insert_En_6,
		Remove_En => Rmv_6,
		CDB_V => CDB_V,--Eksoteriko sima
		CDB_Q => CDB_Q,--Eksoteriko sima
		Instr_Rj => Issue_Rj,--Eksoteriko sima
		Instr_Rk => Issue_Rk,--Eksoteriko sima
		Instr_PC => Issue_PC,--Eksoteriko sima
		Instr_Type => Issue_Type,--Eksoteriko sima
		Instr_Dest => Issue_Dest,--Eksoteriko sima
		Instr_Tag => Issue_Tag,--Eksoteriko sima
		Reg_PC_Out => ROB_PC_Out_6,
		Reg_Dest_Out => ROB_Dest_Out_6,
		Reg_Value_Out => ROB_Value_Out_6,
		Reg_Tag_Out => ROB_Tag_Out_6,
		Reg_Done_Out => ROB_Done_Out_6,
		Valid_Bit_Rj => ROB_Valid_Bit_Rj_6,
		Valid_Bit_Rk => ROB_Valid_Bit_Rk_6
	);
	
	ROB_Module_7: ROB_Module PORT MAP(
		Clk => Clk,--Eksoteriko sima
		Reset => Reset,--Eksoteriko sima
		Insert_En => Insert_En_7,
		Remove_En => Rmv_7,
		CDB_V => CDB_V,--Eksoteriko sima
		CDB_Q => CDB_Q,--Eksoteriko sima
		Instr_Rj => Issue_Rj,--Eksoteriko sima
		Instr_Rk => Issue_Rk,--Eksoteriko sima
		Instr_PC => Issue_PC,--Eksoteriko sima
		Instr_Type => Issue_Type,--Eksoteriko sima
		Instr_Dest => Issue_Dest,--Eksoteriko sima
		Instr_Tag => Issue_Tag,--Eksoteriko sima
		Reg_PC_Out => ROB_PC_Out_7,
		Reg_Dest_Out => ROB_Dest_Out_7,
		Reg_Value_Out => ROB_Value_Out_7,
		Reg_Tag_Out => ROB_Tag_Out_7,
		Reg_Done_Out => ROB_Done_Out_7,
		Valid_Bit_Rj => ROB_Valid_Bit_Rj_7,
		Valid_Bit_Rk => ROB_Valid_Bit_Rk_7
	);
	
	Rj_Mux_Control: ROB_Mux_Control PORT MAP(
		Tail_FIFO => FIFO_Tail,
		Valid_Bit_0 => ROB_Valid_Bit_Rj_0,
		Valid_Bit_1 => ROB_Valid_Bit_Rj_1,
		Valid_Bit_2 => ROB_Valid_Bit_Rj_2,
		Valid_Bit_3 => ROB_Valid_Bit_Rj_3,
		Valid_Bit_4 => ROB_Valid_Bit_Rj_4,
		Valid_Bit_5 => ROB_Valid_Bit_Rj_5,
		Valid_Bit_6 => ROB_Valid_Bit_Rj_6,
		Valid_Bit_7 => ROB_Valid_Bit_Rj_7,
		Mux_Sel_Reg_ROB => Local_Mux_j,
		MUX_Sel_ROB_MEM => External_Mux_j--Eksoteriko sima
	);
	
	Rk_Mux_Control: ROB_Mux_Control PORT MAP(
		Tail_FIFO => FIFO_Tail,
		Valid_Bit_0 => ROB_Valid_Bit_Rk_0,
		Valid_Bit_1 => ROB_Valid_Bit_Rk_1,
		Valid_Bit_2 => ROB_Valid_Bit_Rk_2,
		Valid_Bit_3 => ROB_Valid_Bit_Rk_3,
		Valid_Bit_4 => ROB_Valid_Bit_Rk_4,
		Valid_Bit_5 => ROB_Valid_Bit_Rk_5,
		Valid_Bit_6 => ROB_Valid_Bit_Rk_6,
		Valid_Bit_7 => ROB_Valid_Bit_Rk_7,
		Mux_Sel_Reg_ROB => Local_Mux_k,
		MUX_Sel_ROB_MEM => External_Mux_k--Eksoteriko sima
	);
	
	Rj_Mux_Tag: ROB_Mux_Tag PORT MAP(
		Sel => Local_Mux_j,
		Tag_0 => ROB_Tag_Out_0,
		Tag_1 => ROB_Tag_Out_1,
		Tag_2 => ROB_Tag_Out_2,
		Tag_3 => ROB_Tag_Out_3,
		Tag_4 => ROB_Tag_Out_4,
		Tag_5 => ROB_Tag_Out_5,
		Tag_6 => ROB_Tag_Out_6,
		Tag_7 => ROB_Tag_Out_7,
		Mux_Out => Rj_Tag_Out--Eksoteriko sima
	);
	
	Rk_Mux_Tag: ROB_Mux_Tag PORT MAP(
		Sel => Local_Mux_k,
		Tag_0 => ROB_Tag_Out_0,
		Tag_1 => ROB_Tag_Out_1,
		Tag_2 => ROB_Tag_Out_2,
		Tag_3 => ROB_Tag_Out_3,
		Tag_4 => ROB_Tag_Out_4,
		Tag_5 => ROB_Tag_Out_5,
		Tag_6 => ROB_Tag_Out_6,
		Tag_7 => ROB_Tag_Out_7,
		Mux_Out => Rk_Tag_Out--Eksoteriko sima
	);
	
	Rj_Mux_Data: ROB_Mux_Data PORT MAP(
		Sel => Local_Mux_j,
		Value_0 => ROB_Value_Out_0,
		Value_1 => ROB_Value_Out_1,
		Value_2 => ROB_Value_Out_2,
		Value_3 => ROB_Value_Out_3,
		Value_4 => ROB_Value_Out_4,
		Value_5 => ROB_Value_Out_5,
		Value_6 => ROB_Value_Out_6,
		Value_7 => ROB_Value_Out_7,
		Mux_Out => Rj_Value_Out--Eksoteriko sima
	);
	
	Rk_Mux_Data: ROB_Mux_Data PORT MAP(
		Sel => Local_Mux_k,
		Value_0 => ROB_Value_Out_0,
		Value_1 => ROB_Value_Out_1,
		Value_2 => ROB_Value_Out_2,
		Value_3 => ROB_Value_Out_3,
		Value_4 => ROB_Value_Out_4,
		Value_5 => ROB_Value_Out_5,
		Value_6 => ROB_Value_Out_6,
		Value_7 => ROB_Value_Out_7,
		Mux_Out => Rk_Value_Out--Eksoteriko sima
	);
	
	RF_Wr_Control: RF_Write_Control PORT MAP(
		ROB_Move_0 => Remove_En_0,
		ROB_Move_1 => Remove_En_1,
		ROB_Move_2 => Remove_En_2,
		ROB_Move_3 => Remove_En_3,
		ROB_Move_4 => Remove_En_4,
		ROB_Move_5 => Remove_En_5,
		ROB_Move_6 => Remove_En_6,
		ROB_Move_7 => Remove_En_7,
		ROB_Dest_0 => ROB_Dest_Out_0,
		ROB_Dest_1 => ROB_Dest_Out_1,
		ROB_Dest_2 => ROB_Dest_Out_2,
		ROB_Dest_3 => ROB_Dest_Out_3,
		ROB_Dest_4 => ROB_Dest_Out_4,
		ROB_Dest_5 => ROB_Dest_Out_5,
		ROB_Dest_6 => ROB_Dest_Out_6,
		ROB_Dest_7 => ROB_Dest_Out_7,
		ROB_Value_0 => ROB_Value_Out_0,
		ROB_Value_1 => ROB_Value_Out_1,
		ROB_Value_2 => ROB_Value_Out_2,
		ROB_Value_3 => ROB_Value_Out_3,
		ROB_Value_4 => ROB_Value_Out_4,
		ROB_Value_5 => ROB_Value_Out_5,
		ROB_Value_6 => ROB_Value_Out_6,
		ROB_Value_7 => ROB_Value_Out_7,
		RF_WrEn => RF_WrEn,--Eksoteriko sima
		RF_WrAddr => RF_WrAddr,--Eksoteriko sima
		RF_WrData => RF_WrData--Eksoteriko sima
	);
	
	Ex_Control: Excep_Control PORT MAP(
		Clk => Clk,--Eksoteriko sima
		Reset => Reset,--Eksoteriko sima
		Arith_Excep_En => Arith_Excep_En,--Eksoteriko sima
		Arith_Excep_Tag => Arith_Excep_Tag,--Eksoteriko sima
		Logic_Excep_En => Logic_Excep_En,--Eksoteriko sima
		Logic_Excep_Tag => Logic_Excep_Tag,--Eksoteriko sima
		ROB_PC_0 => ROB_PC_Out_0,
		ROB_PC_1 => ROB_PC_Out_1,
		ROB_PC_2 => ROB_PC_Out_2,
		ROB_PC_3 => ROB_PC_Out_3,
		ROB_PC_4 => ROB_PC_Out_4,
		ROB_PC_5 => ROB_PC_Out_5,
		ROB_PC_6 => ROB_PC_Out_6,
		ROB_PC_7 => ROB_PC_Out_7,
		ROB_Tag_0 => ROB_Tag_Out_0,
		ROB_Tag_1 => ROB_Tag_Out_1,
		ROB_Tag_2 => ROB_Tag_Out_2,
		ROB_Tag_3 => ROB_Tag_Out_3,
		ROB_Tag_4 => ROB_Tag_Out_4,
		ROB_Tag_5 => ROB_Tag_Out_5,
		ROB_Tag_6 => ROB_Tag_Out_6,
		ROB_Tag_7 => ROB_Tag_Out_7,
		ROB_Clear_0 => Clear_0,
		ROB_Clear_1 => Clear_1,
		ROB_Clear_2 => Clear_2,
		ROB_Clear_3 => Clear_3,
		ROB_Clear_4 => Clear_4,
		ROB_Clear_5 => Clear_5,
		ROB_Clear_6 => Clear_6,
		ROB_Clear_7 => Clear_7,
		Ex_En => Excep_En,--Eksoteriko sima
		Ex_PC => Excep_PC--Eksoteriko sima
	);
	
	Rmv_0 <= Clear_0 or Remove_En_0;
	Rmv_1 <= Clear_1 or Remove_En_1;
	Rmv_2 <= Clear_2 or Remove_En_2;
	Rmv_3 <= Clear_3 or Remove_En_3;
	Rmv_4 <= Clear_4 or Remove_En_4;
	Rmv_5 <= Clear_5 or Remove_En_5;
	Rmv_6 <= Clear_6 or Remove_En_6;
	Rmv_7 <= Clear_7 or Remove_En_7;
end Behavioral;