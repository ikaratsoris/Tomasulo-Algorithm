library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CDB is
    Port ( Clk : in  STD_LOGIC;
			  Rst : in  STD_LOGIC;
           Req_Arith : in  STD_LOGIC;
           Req_Logic : in  STD_LOGIC;
           Req_LS : in  STD_LOGIC;
			  Arith_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
           Logic_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
           LS_Tag : in  STD_LOGIC_VECTOR (4 downto 0);
			  Arith_Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Logic_Data : in  STD_LOGIC_VECTOR (31 downto 0);
           LS_Data : in  STD_LOGIC_VECTOR (31 downto 0);
           Grant_Arith : out  STD_LOGIC:= '0';
           Grant_Logic : out  STD_LOGIC:= '0';
           Grant_LS : out  STD_LOGIC:= '0';
			  CDB_Q : out  STD_LOGIC_VECTOR (4 downto 0):= "00000";
			  CDB_V : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000");
end CDB;

architecture Behavioral of CDB is

COMPONENT CDB_Mux_Tag
PORT(
	Sel : IN std_logic_vector(1 downto 0);
	Arith_Tag : IN std_logic_vector(4 downto 0);
	Logic_Tag : IN std_logic_vector(4 downto 0);
	LS_Tag : IN std_logic_vector(4 downto 0);          
	Mux_Tag_Out : OUT std_logic_vector(4 downto 0)
	);
END COMPONENT;

COMPONENT CDB_Mux_Data
PORT(
	Sel : IN std_logic_vector(1 downto 0);
	Arith_Data : IN std_logic_vector(31 downto 0);
	Logic_Data : IN std_logic_vector(31 downto 0);
	LS_Data : IN std_logic_vector(31 downto 0);          
	Mux_Data_Out : OUT std_logic_vector(31 downto 0)
	);
END COMPONENT;

COMPONENT CDB_Control
PORT(
	Clk : IN std_logic;
	Rst : IN std_logic;
	Req_Arith : IN std_logic;
	Req_Logic : IN std_logic;
	Req_LS : IN std_logic;          
	Grant_Arith : OUT std_logic;
	Grant_Logic : OUT std_logic;
	Grant_LS : OUT std_logic;
	Mux_Sel : OUT std_logic_vector(1 downto 0)
	);
END COMPONENT;

signal temp_sel: std_logic_vector(1 downto 0):= "00";

begin
	Mux_Tag: CDB_Mux_Tag PORT MAP(
		Sel => temp_sel,
		Arith_Tag => Arith_Tag, --eksoteriko sima
		Logic_Tag => Logic_Tag, --eksoteriko sima
		LS_Tag => LS_Tag, --eksoteriko sima
		Mux_Tag_Out => CDB_Q --eksoteriko sima
	);
	
	Mux_Data: CDB_Mux_Data PORT MAP(
		Sel => temp_sel,
		Arith_Data => Arith_Data, --eksoteriko sima
		Logic_Data => Logic_Data, --eksoteriko sima
		LS_Data => LS_Data, --eksoteriko sima
		Mux_Data_Out => CDB_V --eksoteriko sima
	);
	
	Control: CDB_Control PORT MAP(
		Clk => Clk,
		Rst => Rst, --eksoteriko sima
		Req_Arith => Req_Arith, --eksoteriko sima
		Req_Logic => Req_Logic, --eksoteriko sima
		Req_LS => Req_LS, --eksoteriko sima
		Grant_Arith => Grant_Arith, --eksoteriko sima
		Grant_Logic => Grant_Logic, --eksoteriko sima
		Grant_LS => Grant_LS, --eksoteriko sima
		Mux_Sel => temp_sel
	);
end Behavioral;