library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FU_Arith is
    Port ( Clk : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  RS_Arith_Rdy : in  STD_LOGIC;
			  RS_Arith_Dt : in  STD_LOGIC_VECTOR (72 downto 0);
			  CDB_Response : in  STD_LOGIC;
			  CDB_Request : out  STD_LOGIC:= '0';
			  CDB_V : out  STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000";
			  CDB_Q : out  STD_LOGIC_VECTOR(4 downto 0):= "00000";
			  ALU_Zero : out  STD_LOGIC:= '0';
			  ALU_Cout : out  STD_LOGIC:= '0';
			  ALU_Ovf : out  STD_LOGIC:= '0';
			  Exce_Tag : out  STD_LOGIC_VECTOR(4 downto 0):= "00000");
end FU_Arith;

architecture Behavioral of FU_Arith is

COMPONENT FU_Arith_ALU
PORT(
	RS_Arith_Ready : IN std_logic;
	RS_Arith_Data : IN std_logic_vector(72 downto 0);          
	ALU_Zero : OUT std_logic;
	ALU_Cout : OUT std_logic;
	ALU_Ovf : OUT std_logic;
	ALU_V_Out : OUT std_logic_vector(31 downto 0);
	ALU_Q_Out : OUT std_logic_vector(4 downto 0)
	);
END COMPONENT;

COMPONENT FU_Delay_Reg
PORT(
	Clk : IN std_logic;
	RST : IN std_logic;
	WE : IN std_logic;
	Q_In : IN std_logic_vector(4 downto 0);
	V_In : IN std_logic_vector(31 downto 0);          
	Q_Out : OUT std_logic_vector(4 downto 0);
	V_Out : OUT std_logic_vector(31 downto 0)
	);
END COMPONENT;

COMPONENT FU_Arith_WrEn_Control
PORT(
	CDB_Resp : IN std_logic;
	Reg_Q_0 : IN std_logic_vector(4 downto 0);
	Reg_Q_1 : IN std_logic_vector(4 downto 0);
	Reg_Q_2 : IN std_logic_vector(4 downto 0);
	Reg_Q_Out : IN std_logic_vector(4 downto 0);          
	WrEn_0 : OUT std_logic;
	WrEn_1 : OUT std_logic;
	WrEn_2 : OUT std_logic
	);
END COMPONENT;

COMPONENT FU_Req_Control
PORT(
	Resp : IN std_logic;
	Prelast_Q : IN std_logic_vector(4 downto 0);
	Last_Q : IN std_logic_vector(4 downto 0);          
	Req : OUT std_logic
	);
END COMPONENT;

signal temp_WE_0, temp_WE_1, temp_WE_2: std_logic:= '0';
signal Q_ALU_to_Reg0, Q_Reg0_to_Reg1, Q_Reg1_to_Reg2, Q_Reg2_to_Out: std_logic_vector(4 downto 0):= "00000";
signal V_ALU_to_Reg0, V_Reg0_to_Reg1, V_Reg1_to_Reg2: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";

begin
	Arith_ALU: FU_Arith_ALU PORT MAP(
		RS_Arith_Ready => RS_Arith_Rdy, --eksoteriko sima
		RS_Arith_Data => RS_Arith_Dt, --eksoteriko sima
		ALU_Zero => ALU_Zero, --eksoteriko sima
		ALU_Cout => ALU_Cout, --eksoteriko sima
		ALU_Ovf => ALU_Ovf, --eksoteriko sima
		ALU_V_Out => V_ALU_to_Reg0,
		ALU_Q_Out => Q_ALU_to_Reg0
	);
	
	Delay_Reg_0: FU_Delay_Reg PORT MAP(
		Clk => Clk,
		RST => Reset, --eksoteriko sima
		WE => temp_WE_0,
		Q_In => Q_ALU_to_Reg0,
		V_In => V_ALU_to_Reg0,
		Q_Out => Q_Reg0_to_Reg1,
		V_Out => V_Reg0_to_Reg1
	);
	
	Delay_Reg_1: FU_Delay_Reg PORT MAP(
		Clk => Clk,
		RST => Reset, --eksoteriko sima
		WE => temp_WE_1,
		Q_In => Q_Reg0_to_Reg1,
		V_In => V_Reg0_to_Reg1,
		Q_Out => Q_Reg1_to_Reg2,
		V_Out => V_Reg1_to_Reg2
	);
	
	Delay_Reg_2: FU_Delay_Reg PORT MAP(
		Clk => Clk,
		RST => Reset, --eksoteriko sima
		WE => temp_WE_2,
		Q_In => Q_Reg1_to_Reg2,
		V_In => V_Reg1_to_Reg2,
		Q_Out => Q_Reg2_to_Out, --eksoteriko sima
		V_Out => CDB_V --eksoteriko sima
	);
	
	WrEn_Control: FU_Arith_WrEn_Control PORT MAP(
		CDB_Resp => CDB_Response,
		Reg_Q_0 => Q_ALU_to_Reg0,
		Reg_Q_1 => Q_Reg0_to_Reg1,
		Reg_Q_2 => Q_Reg1_to_Reg2,
		Reg_Q_Out => Q_Reg2_to_Out,
		WrEn_0 => temp_WE_0,
		WrEn_1 => temp_WE_1,
		WrEn_2 => temp_WE_2
	);
	
	Req_Control: FU_Req_Control PORT MAP(
		Resp => CDB_Response,
		Prelast_Q => Q_Reg1_to_Reg2,
		Last_Q => Q_Reg2_to_Out,
		Req => CDB_Request
	);
	
	CDB_Q <= Q_Reg2_to_Out;
	Exce_Tag <= Q_ALU_to_Reg0;
end Behavioral;