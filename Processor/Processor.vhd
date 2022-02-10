library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Processor is
    Port ( Clk : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  PC_Input : in  STD_LOGIC_VECTOR (31 downto 0);
			  Instruction : in  STD_LOGIC_VECTOR (19 downto 0);
			  Accepted : out  STD_LOGIC:= '0';
			  Exception_En : out  STD_LOGIC:= '0';
			  Exception_PC : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000");
end Processor;

architecture Behavioral of Processor is

COMPONENT Issue
PORT(
	ROB_Full : IN std_logic;
	Excep_En : IN std_logic;
	RS0_Logic_Busy : IN std_logic;
	RS1_Logic_Busy : IN std_logic;
	RS0_Arith_Busy : IN std_logic;
	RS1_Arith_Busy : IN std_logic;
	RS2_Arith_Busy : IN std_logic;
	Instruction : IN std_logic_vector(19 downto 0);          
	Accepted : OUT std_logic;
	WrEn : OUT std_logic;
	Op : OUT std_logic_vector(3 downto 0);
	Ri : OUT std_logic_vector(4 downto 0);
	Rj : OUT std_logic_vector(4 downto 0);
	Rk : OUT std_logic_vector(4 downto 0);
	RS_Tag : OUT std_logic_vector(4 downto 0)
	);
END COMPONENT;

COMPONENT ROB_RF_Module
PORT(
	Clk : IN std_logic;
	Reset : IN std_logic;
	CDB_V : IN std_logic_vector(31 downto 0);
	CDB_Q : IN std_logic_vector(4 downto 0);
	Issue_WE : IN std_logic;
	Issue_Rj : IN std_logic_vector(4 downto 0);
	Issue_Rk : IN std_logic_vector(4 downto 0);
	Issue_PC : IN std_logic_vector(31 downto 0);
	Issue_Type : IN std_logic_vector(3 downto 0);
	Issue_Dest : IN std_logic_vector(4 downto 0);
	Issue_Tag : IN std_logic_vector(4 downto 0);
	Arith_Excep_En : IN std_logic;
	Arith_Excep_Tag : IN std_logic_vector(4 downto 0);
	Logic_Excep_En : IN std_logic;
	Logic_Excep_Tag : IN std_logic_vector(4 downto 0);          
	Full_FIFO : OUT std_logic;
	Rj_Tag : OUT std_logic_vector(4 downto 0);
	Rk_Tag : OUT std_logic_vector(4 downto 0);
	Rj_Value : OUT std_logic_vector(31 downto 0);
	Rk_Value : OUT std_logic_vector(31 downto 0);
	Excep_En : OUT std_logic;
	Excep_PC : OUT std_logic_vector(31 downto 0)
	);
END COMPONENT;

COMPONENT RS_Arith
PORT(
	Clk : IN std_logic;
	Reset : IN std_logic;
	RS_WE : IN std_logic;
	CDB_V : IN std_logic_vector(31 downto 0);
	CDB_Q : IN std_logic_vector(4 downto 0);
	Issue_Op : IN std_logic_vector(3 downto 0);
	Issue_Tag : IN std_logic_vector(4 downto 0);
	RF_Vj : IN std_logic_vector(31 downto 0);
	RF_Qj : IN std_logic_vector(4 downto 0);
	RF_Vk : IN std_logic_vector(31 downto 0);
	RF_Qk : IN std_logic_vector(4 downto 0);          
	RS0_Busy : OUT std_logic;
	RS1_Busy : OUT std_logic;
	RS2_Busy : OUT std_logic;
	RS_Ready : OUT std_logic;
	RS_Data : OUT std_logic_vector(72 downto 0)
	);
END COMPONENT;

COMPONENT RS_Logic
PORT(
	Clk : IN std_logic;
	Reset : IN std_logic;
	RS_WE : IN std_logic;
	CDB_V : IN std_logic_vector(31 downto 0);
	CDB_Q : IN std_logic_vector(4 downto 0);
	Issue_Op : IN std_logic_vector(3 downto 0);
	Issue_Tag : IN std_logic_vector(4 downto 0);
	RF_Vj : IN std_logic_vector(31 downto 0);
	RF_Qj : IN std_logic_vector(4 downto 0);
	RF_Vk : IN std_logic_vector(31 downto 0);
	RF_Qk : IN std_logic_vector(4 downto 0);          
	RS0_Busy : OUT std_logic;
	RS1_Busy : OUT std_logic;
	RS_Ready : OUT std_logic;
	RS_Data : OUT std_logic_vector(72 downto 0)
	);
END COMPONENT;

COMPONENT FU_Arith
PORT(
	Clk : IN std_logic;
	Reset : IN std_logic;
	RS_Arith_Rdy : IN std_logic;
	RS_Arith_Dt : IN std_logic_vector(72 downto 0);
	CDB_Response : IN std_logic;          
	CDB_Request : OUT std_logic;
	CDB_V : OUT std_logic_vector(31 downto 0);
	CDB_Q : OUT std_logic_vector(4 downto 0);
	ALU_Zero : OUT std_logic;
	ALU_Cout : OUT std_logic;
	ALU_Ovf : OUT std_logic;
	Exce_Tag : OUT std_logic_vector(4 downto 0)
	);
END COMPONENT;

COMPONENT FU_Logic
PORT(
	Clk : IN std_logic;
	Reset : IN std_logic;
	RS_Logic_Rdy : IN std_logic;
	RS_Logic_Dt : IN std_logic_vector(72 downto 0);
	CDB_Response : IN std_logic;          
	CDB_Request : OUT std_logic;
	CDB_V : OUT std_logic_vector(31 downto 0);
	CDB_Q : OUT std_logic_vector(4 downto 0);
	ALU_Zero : OUT std_logic;
	ALU_Cout : OUT std_logic;
	ALU_Ovf : OUT std_logic;
	Exce_Tag : OUT std_logic_vector(4 downto 0)
	);
END COMPONENT;

COMPONENT CDB
PORT(
	Clk : IN std_logic;
	Rst : IN std_logic;
	Req_Arith : IN std_logic;
	Req_Logic : IN std_logic;
	Req_LS : IN std_logic;
	Arith_Tag : IN std_logic_vector(4 downto 0);
	Logic_Tag : IN std_logic_vector(4 downto 0);
	LS_Tag : IN std_logic_vector(4 downto 0);
	Arith_Data : IN std_logic_vector(31 downto 0);
	Logic_Data : IN std_logic_vector(31 downto 0);
	LS_Data : IN std_logic_vector(31 downto 0);          
	Grant_Arith : OUT std_logic;
	Grant_Logic : OUT std_logic;
	Grant_LS : OUT std_logic;
	CDB_Q : OUT std_logic_vector(4 downto 0);
	CDB_V : OUT std_logic_vector(31 downto 0)
	);
END COMPONENT;

signal Logic_RS_to_Issue_Busy_0, Logic_RS_to_Issue_Busy_1, Arith_RS_to_Issue_Busy_0, Arith_RS_to_Issue_Busy_1, Arith_RS_to_Issue_Busy_2,
		 temp_WrEn, Arith_RS_to_FU_Rdy, Logic_RS_to_FU_Rdy, CDB_to_FU_Arith_Resp, FU_Arith_to_CDB_Req, CDB_to_FU_Logic_Resp, FU_Logic_to_CDB_Req,
		 temp_Grant_LS, Arith_Ex_En, Logic_Ex_En, Arith_Zero, Arith_Cout, Arith_Ovf, Logic_Zero, Logic_Cout, Logic_Ovf, ROB_Full, Ex_En: STD_LOGIC:= '0';

signal Issue_to_RS_Op: STD_LOGIC_VECTOR(3 downto 0):= "0000";

signal Issue_to_RF_Ri, Issue_to_RF_Rj, Issue_to_RF_Rk, Issue_to_RF_RS_Tag, RF_to_RS_Qj, RF_to_RS_Qk,
		 FU_Arith_Q_out, FU_Logic_Q_out, CDB_Q_Out, Arith_Ex_Tag, Logic_Ex_Tag, Issue_Ri, Issue_Rj, Issue_Rk: STD_LOGIC_VECTOR(4 downto 0):= "00000";

signal RF_to_RS_Vj, RF_to_RS_Vk, FU_Arith_V_out, FU_Logic_V_out, 
		 CDB_V_Out: STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000";

signal Arith_RS_to_FU_Dt, 
		 Logic_RS_to_FU_Dt: STD_LOGIC_VECTOR(72 downto 0):= "0000000000000000000000000000000000000000000000000000000000000000000000000";

begin
	Issue_Module: Issue PORT MAP(
		ROB_Full => ROB_Full,
		Excep_En => Ex_En,
		RS0_Logic_Busy => Logic_RS_to_Issue_Busy_0,
		RS1_Logic_Busy => Logic_RS_to_Issue_Busy_1,
		RS0_Arith_Busy => Arith_RS_to_Issue_Busy_0,
		RS1_Arith_Busy => Arith_RS_to_Issue_Busy_1,
		RS2_Arith_Busy => Arith_RS_to_Issue_Busy_2,
		Instruction => Instruction,--eksoteriko sima
		Accepted => Accepted,--eksoteriko sima
		WrEn => temp_WrEn,
		Op => Issue_to_RS_Op,
		Ri => Issue_Ri,
		Rj => Issue_Rj,
		Rk => Issue_Rk,
		RS_Tag => Issue_to_RF_RS_Tag
	);
	
	ROB_RF_MEM_Module: ROB_RF_Module PORT MAP(
		Clk => Clk,--eksoteriko sima
		Reset => Reset,--eksoteriko sima
		CDB_V => CDB_V_Out,
		CDB_Q => CDB_Q_Out,
		Issue_WE => temp_WrEn,
		Issue_Rj => Issue_Rj,
		Issue_Rk => Issue_Rk,
		Issue_PC => PC_Input,
		Issue_Type => Issue_to_RS_Op,
		Issue_Dest => Issue_Ri,
		Issue_Tag => Issue_to_RF_RS_Tag,
		Arith_Excep_En => Arith_Ex_En,
		Arith_Excep_Tag => Arith_Ex_Tag,
		Logic_Excep_En => Logic_Ex_En,
		Logic_Excep_Tag => Logic_Ex_Tag,
		Full_FIFO => ROB_Full,
		Rj_Tag => RF_to_RS_Qj,
		Rk_Tag => RF_to_RS_Qk,
		Rj_Value => RF_to_RS_Vj,
		Rk_Value => RF_to_RS_Vk,
		Excep_En => Ex_En,
		Excep_PC => Exception_PC--eksoteriko sima
	);
	
	RS_Arith_Module: RS_Arith PORT MAP(
		Clk => Clk,--eksoteriko sima
		Reset => Reset, --eksoteriko sima
		RS_WE => temp_WrEn,
		CDB_V => CDB_V_Out,
		CDB_Q => CDB_Q_Out,
		Issue_Op => Issue_to_RS_Op,
		Issue_Tag => Issue_to_RF_RS_Tag,
		RF_Vj => RF_to_RS_Vj,
		RF_Qj => RF_to_RS_Qj,
		RF_Vk => RF_to_RS_Vk,
		RF_Qk => RF_to_RS_Qk,
		RS0_Busy => Arith_RS_to_Issue_Busy_0,
		RS1_Busy => Arith_RS_to_Issue_Busy_1,
		RS2_Busy => Arith_RS_to_Issue_Busy_2,
		RS_Ready => Arith_RS_to_FU_Rdy,
		RS_Data => Arith_RS_to_FU_Dt
	);
	
	RS_Logic_Module: RS_Logic PORT MAP(
		Clk => Clk,--eksoteriko sima
		Reset => Reset, --eksoteriko sima
		RS_WE => temp_WrEn,
		CDB_V => CDB_V_Out,
		CDB_Q => CDB_Q_Out,
		Issue_Op => Issue_to_RS_Op,
		Issue_Tag => Issue_to_RF_RS_Tag,
		RF_Vj => RF_to_RS_Vj,
		RF_Qj => RF_to_RS_Qj,
		RF_Vk => RF_to_RS_Vk,
		RF_Qk => RF_to_RS_Qk,
		RS0_Busy => Logic_RS_to_Issue_Busy_0,
		RS1_Busy => Logic_RS_to_Issue_Busy_1,
		RS_Ready => Logic_RS_to_FU_Rdy,
		RS_Data => Logic_RS_to_FU_Dt
	);
	
	FU_Arith_Module: FU_Arith PORT MAP(
		Clk => Clk,--eksoteriko sima
		Reset => Reset, --eksoteriko sima
		RS_Arith_Rdy => Arith_RS_to_FU_Rdy,
		RS_Arith_Dt => Arith_RS_to_FU_Dt,
		CDB_Response => CDB_to_FU_Arith_Resp,
		CDB_Request => FU_Arith_to_CDB_Req,
		CDB_V => FU_Arith_V_out,
		CDB_Q => FU_Arith_Q_out,
		ALU_Zero => Arith_Zero,
		ALU_Cout => Arith_Cout,
		ALU_Ovf => Arith_Ovf,
		Exce_Tag => Arith_Ex_Tag
	);
	
	FU_Logic_Module: FU_Logic PORT MAP(
		Clk => Clk,--eksoteriko sima
		Reset => Reset, --eksoteriko sima
		RS_Logic_Rdy => Logic_RS_to_FU_Rdy,
		RS_Logic_Dt => Logic_RS_to_FU_Dt,
		CDB_Response => CDB_to_FU_Logic_Resp,
		CDB_Request => FU_Logic_to_CDB_Req,
		CDB_V => FU_Logic_V_out,
		CDB_Q => FU_Logic_Q_out,
		ALU_Zero => Logic_Zero,
		ALU_Cout => Logic_Cout,
		ALU_Ovf => Logic_Ovf,
		Exce_Tag => Logic_Ex_Tag
	);
	
	CDB_Module: CDB PORT MAP(
		Clk => Clk,--eksoteriko sima
		Rst => Reset, --eksoteriko sima
		Req_Arith => FU_Arith_to_CDB_Req,
		Req_Logic => FU_Logic_to_CDB_Req,
		Req_LS => '0', --prosorino sima
		Arith_Tag => FU_Arith_Q_out,
		Logic_Tag => FU_Logic_Q_out,
		LS_Tag => "00000", --prosorino sima
		Arith_Data => FU_Arith_V_out,
		Logic_Data => FU_Logic_V_out,
		LS_Data => "00000000000000000000000000000000", --prosorino sima
		Grant_Arith => CDB_to_FU_Arith_Resp,
		Grant_Logic => CDB_to_FU_Logic_Resp,
		Grant_LS => temp_Grant_LS, --prosorino sima
		CDB_Q => CDB_Q_Out,
		CDB_V => CDB_V_Out
	);
	
	Exception_En <= Ex_En;--eksoteriko sima
	Arith_Ex_En <= Arith_Ovf;
	Logic_Ex_En <= Logic_Ovf;
end Behavioral;