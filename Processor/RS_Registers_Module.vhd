library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RS_Registers_Module is
    Port ( CLK : in  STD_LOGIC;
			  RST : in  STD_LOGIC;
           Busy_In : in  STD_LOGIC;
           Op_In : in  STD_LOGIC_VECTOR (3 downto 0);
           Vj_In : in  STD_LOGIC_VECTOR (31 downto 0);
           Qj_In : in  STD_LOGIC_VECTOR (4 downto 0);
           Vk_In : in  STD_LOGIC_VECTOR (31 downto 0);
           Qk_In : in  STD_LOGIC_VECTOR (4 downto 0);
           Busy_WE : in  STD_LOGIC;
           Op_WE : in  STD_LOGIC;
           Vj_WE : in  STD_LOGIC;
           Qj_WE : in  STD_LOGIC;
           Vk_WE : in  STD_LOGIC;
           Qk_WE : in  STD_LOGIC;
           Busy_Out : out  STD_LOGIC:= '0';
           Op_Out : out  STD_LOGIC_VECTOR (3 downto 0):= "0000";
           Vj_Out : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
           Qj_Out : out  STD_LOGIC_VECTOR (4 downto 0):= "00000";
           Vk_Out : out  STD_LOGIC_VECTOR (31 downto 0):= "00000000000000000000000000000000";
           Qk_Out : out  STD_LOGIC_VECTOR (4 downto 0):= "00000");
end RS_Registers_Module;

architecture Behavioral of RS_Registers_Module is

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
	Busy_Reg: Reg_1 PORT MAP(
		CLK => CLK,
		WE => Busy_WE,
		RST => RST,
		Data => Busy_In,
		Dout => Busy_Out
	);
	
	Op_Reg: Reg_4 PORT MAP(
		CLK => CLK,
		WE => Op_WE,
		RST => RST,
		Data => Op_In,
		Dout => Op_Out
	);
	
	Vj_Reg: Reg_32 PORT MAP(
		CLK => CLK,
		WE => Vj_WE,
		RST => RST,
		Data => Vj_In,
		Dout => Vj_Out
	);
	
	Qj_Reg: Reg_5 PORT MAP(
		CLK => CLK,
		WE => Qj_WE,
		RST => RST,
		Data => Qj_In,
		Dout => Qj_Out
	);

	Vk_Reg: Reg_32 PORT MAP(
		CLK => CLK,
		WE => Vk_WE,
		RST => RST,
		Data => Vk_In,
		Dout => Vk_Out
	);

	Qk_Reg: Reg_5 PORT MAP(
		CLK => CLK,
		WE => Qk_WE,
		RST => RST,
		Data => Qk_In,
		Dout => Qk_Out
	);
end Behavioral;