library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROB_RF_Module is
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
			  Rj_Tag : out  STD_LOGIC_VECTOR(4 downto 0):= "00000";
			  Rk_Tag : out  STD_LOGIC_VECTOR(4 downto 0):= "00000";
			  Rj_Value : out  STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000";
			  Rk_Value : out  STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000";
			  Excep_En : out  STD_LOGIC:= '0';
			  Excep_PC : out  STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000");
end ROB_RF_Module;

architecture Behavioral of ROB_RF_Module is

COMPONENT RO_Module
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
	External_Mux_j : OUT std_logic;
	External_Mux_k : OUT std_logic;
	Rj_Tag_Out : OUT std_logic_vector(4 downto 0);
	Rk_Tag_Out : OUT std_logic_vector(4 downto 0);
	Rj_Value_Out : OUT std_logic_vector(31 downto 0);
	Rk_Value_Out : OUT std_logic_vector(31 downto 0);
	RF_WrEn : OUT std_logic;
	RF_WrAddr : OUT std_logic_vector(4 downto 0);
	RF_WrData : OUT std_logic_vector(31 downto 0);
	Excep_En : OUT std_logic;
	Excep_PC : OUT std_logic_vector(31 downto 0)
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

COMPONENT ROB_MEM_Mux_Tag
PORT(
	Sel : IN std_logic;
	ROB_Tag : IN std_logic_vector(4 downto 0);          
	Mux_Tag_Out : OUT std_logic_vector(4 downto 0)
	);
END COMPONENT;

COMPONENT ROB_MEM_Mux_Data
PORT(
	Sel : IN std_logic;
	RF_Mem_Value : IN std_logic_vector(31 downto 0);
	ROB_Value : IN std_logic_vector(31 downto 0);          
	Mux_Data_Out : OUT std_logic_vector(31 downto 0)
	);
END COMPONENT;

signal Sel_Mux_j, Sel_Mux_k, RF_WE: STD_LOGIC:= '0';
signal ROB_Tag_Rj, ROB_Tag_Rk, RF_WA: STD_LOGIC_VECTOR(4 downto 0):= "00000";
signal ROB_Value_Rj, ROB_Value_Rk, RF_WD, MEM_Value_Rj, MEM_Value_Rk: STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000000";

begin
	Reorder_Module: RO_Module PORT MAP(
		Clk => Clk,--Eksoteriko sima
		Reset => Reset,--Eksoteriko sima
		CDB_V => CDB_V,--Eksoteriko sima
		CDB_Q => CDB_Q,--Eksoteriko sima
		Issue_WE => Issue_WE,--Eksoteriko sima
		Issue_Rj => Issue_Rj,--Eksoteriko sima
		Issue_Rk => Issue_Rk,--Eksoteriko sima
		Issue_PC => Issue_PC,--Eksoteriko sima
		Issue_Type => Issue_Type,--Eksoteriko sima
		Issue_Dest => Issue_Dest,--Eksoteriko sima
		Issue_Tag => Issue_Tag,--Eksoteriko sima
		Arith_Excep_En => Arith_Excep_En,--Eksoteriko sima
		Arith_Excep_Tag => Arith_Excep_Tag,--Eksoteriko sima
		Logic_Excep_En => Logic_Excep_En,--Eksoteriko sima
		Logic_Excep_Tag => Logic_Excep_Tag,--Eksoteriko sima
		Full_FIFO => Full_FIFO,--Eksoteriko sima
		External_Mux_j => Sel_Mux_j,
		External_Mux_k => Sel_Mux_k,
		Rj_Tag_Out => ROB_Tag_Rj,
		Rk_Tag_Out => ROB_Tag_Rk,
		Rj_Value_Out => ROB_Value_Rj,
		Rk_Value_Out => ROB_Value_Rk,
		RF_WrEn => RF_WE,
		RF_WrAddr => RF_WA,
		RF_WrData => RF_WD,
		Excep_En => Excep_En,--Eksoteriko sima
		Excep_PC => Excep_PC--Eksoteriko sima
	);
	
	RF_Memory: RF_Mem PORT MAP(
		Clk => Clk,--Eksoteriko sima
		WrEn => RF_WE,
		Wr_Addr => RF_WA,
		Rd0_Addr => Issue_Rj,--Eksoteriko sima
		Rd1_Addr => Issue_Rk,--Eksoteriko sima
		Wr_Data => RF_WD,
		Rd0_Data => MEM_Value_Rj,
		Rd1_Data => MEM_Value_Rk
	);
	
	Rj_Mux_Tag: ROB_MEM_Mux_Tag PORT MAP(
		Sel => Sel_Mux_j,
		ROB_Tag => ROB_Tag_Rj,
		Mux_Tag_Out => Rj_Tag--Eksoteriko sima
	);
	
	Rk_Mux_Tag: ROB_MEM_Mux_Tag PORT MAP(
		Sel => Sel_Mux_k,
		ROB_Tag => ROB_Tag_Rk,
		Mux_Tag_Out => Rk_Tag--Eksoteriko sima
	);
	
	Rj_Mux_Data: ROB_MEM_Mux_Data PORT MAP(
		Sel => Sel_Mux_j,
		RF_Mem_Value => MEM_Value_Rj,
		ROB_Value => ROB_Value_Rj,
		Mux_Data_Out => Rj_Value--Eksoteriko sima
	);
	
	Rk_Mux_Data: ROB_MEM_Mux_Data PORT MAP(
		Sel => Sel_Mux_k,
		RF_Mem_Value => MEM_Value_Rk,
		ROB_Value => ROB_Value_Rk,
		Mux_Data_Out => Rk_Value--Eksoteriko sima
	);
end Behavioral;