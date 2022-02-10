library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROB_Registers_Module is
    Port ( Clk : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
			  PC_WE : in  STD_LOGIC;
			  Instr_Type_WE : in  STD_LOGIC;
			  Dest_WE : in  STD_LOGIC;
			  Value_WE : in  STD_LOGIC;
			  Tag_WE : in  STD_LOGIC;
			  Done_WE : in  STD_LOGIC;
			  PC_In : in  STD_LOGIC_VECTOR (31 downto 0);
			  Instr_Type_In : in  STD_LOGIC_VECTOR (3 downto 0);
			  Dest_In : in  STD_LOGIC_VECTOR (4 downto 0);
			  Value_In : in  STD_LOGIC_VECTOR (31 downto 0);
			  Tag_In : in  STD_LOGIC_VECTOR (4 downto 0);
			  Done_In : in  STD_LOGIC;
			  PC_Out : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
			  Instr_Type_Out : out  STD_LOGIC_VECTOR (3 downto 0):= "0000";
			  Dest_Out : out  STD_LOGIC_VECTOR (4 downto 0):= "00000";
			  Value_Out : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
			  Tag_Out : out  STD_LOGIC_VECTOR (4 downto 0):= "00000";
			  Done_Out : out  STD_LOGIC:= '0');
end ROB_Registers_Module;

architecture Behavioral of ROB_Registers_Module is

COMPONENT Reg_1
PORT(
	CLK : IN std_logic;
	WE : IN std_logic;
	RST : IN std_logic;
	Data : IN std_logic;          
	Dout : OUT std_logic
	);
END COMPONENT;

COMPONENT Reg_4
PORT(
	CLK : IN std_logic;
	WE : IN std_logic;
	RST : IN std_logic;
	Data : IN std_logic_vector(3 downto 0);          
	Dout : OUT std_logic_vector(3 downto 0)
	);
END COMPONENT;

COMPONENT Reg_5
PORT(
	CLK : IN std_logic;
	WE : IN std_logic;
	RST : IN std_logic;
	Data : IN std_logic_vector(4 downto 0);          
	Dout : OUT std_logic_vector(4 downto 0)
	);
END COMPONENT;

COMPONENT Reg_32
PORT(
	CLK : IN std_logic;
	WE : IN std_logic;
	RST : IN std_logic;
	Data : IN std_logic_vector(31 downto 0);          
	Dout : OUT std_logic_vector(31 downto 0)
	);
END COMPONENT;

begin
	PC_Reg: Reg_32 PORT MAP(
		CLK => Clk,
		WE => PC_WE,
		RST => Reset,
		Data => PC_In,
		Dout => PC_Out
	);
	
	Instr_Type_Reg: Reg_4 PORT MAP(
		CLK => Clk,
		WE => Instr_Type_WE,
		RST => Reset,
		Data => Instr_Type_In,
		Dout => Instr_Type_Out
	);
	
	Dest_Reg: Reg_5 PORT MAP(
		CLK => Clk,
		WE => Dest_WE,
		RST => Reset,
		Data => Dest_In,
		Dout => Dest_Out
	);
	
	Value_Reg: Reg_32 PORT MAP(
		CLK => Clk,
		WE => Value_WE,
		RST => Reset,
		Data => Value_In,
		Dout => Value_Out
	);
	
	Tag_Reg: Reg_5 PORT MAP(
		CLK => Clk,
		WE => Tag_WE,
		RST => Reset,
		Data => Tag_In,
		Dout => Tag_Out
	);
	
	Done_Reg: Reg_1 PORT MAP(
		CLK => Clk,
		WE => Done_WE,
		RST => Reset,
		Data => Done_In,
		Dout => Done_Out
	);
end Behavioral;