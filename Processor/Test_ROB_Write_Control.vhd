LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_ROB_Write_Control IS
END Test_ROB_Write_Control;
 
ARCHITECTURE behavior OF Test_ROB_Write_Control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROB_Write_Control
    PORT(
         CDB_V : IN  std_logic_vector(31 downto 0);
         CDB_Q : IN  std_logic_vector(4 downto 0);
         Insert_En : IN  std_logic;
         Remove_En : IN  std_logic;
         Instr_PC : IN  std_logic_vector(31 downto 0);
         Instr_Type : IN  std_logic_vector(3 downto 0);
         Instr_Dest : IN  std_logic_vector(4 downto 0);
         Instr_Tag : IN  std_logic_vector(4 downto 0);
         Reg_Tag : IN  std_logic_vector(4 downto 0);
         WrEn_PC : OUT  std_logic;
         WrEn_Instr_Type : OUT  std_logic;
         WrEn_Dest : OUT  std_logic;
         WrEn_Value : OUT  std_logic;
         WrEn_Tag : OUT  std_logic;
         WrEn_Done : OUT  std_logic;
         Output_PC : OUT  std_logic_vector(31 downto 0);
         Output_Instr_Type : OUT  std_logic_vector(3 downto 0);
         Output_Dest : OUT  std_logic_vector(4 downto 0);
         Output_Value : OUT  std_logic_vector(31 downto 0);
         Output_Tag : OUT  std_logic_vector(4 downto 0);
         Output_Done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CDB_V : std_logic_vector(31 downto 0) := (others => '0');
   signal CDB_Q : std_logic_vector(4 downto 0) := (others => '0');
   signal Insert_En : std_logic := '0';
   signal Remove_En : std_logic := '0';
   signal Instr_PC : std_logic_vector(31 downto 0) := (others => '0');
   signal Instr_Type : std_logic_vector(3 downto 0) := (others => '0');
   signal Instr_Dest : std_logic_vector(4 downto 0) := (others => '0');
   signal Instr_Tag : std_logic_vector(4 downto 0) := (others => '0');
   signal Reg_Tag : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal WrEn_PC : std_logic;
   signal WrEn_Instr_Type : std_logic;
   signal WrEn_Dest : std_logic;
   signal WrEn_Value : std_logic;
   signal WrEn_Tag : std_logic;
   signal WrEn_Done : std_logic;
   signal Output_PC : std_logic_vector(31 downto 0);
   signal Output_Instr_Type : std_logic_vector(3 downto 0);
   signal Output_Dest : std_logic_vector(4 downto 0);
   signal Output_Value : std_logic_vector(31 downto 0);
   signal Output_Tag : std_logic_vector(4 downto 0);
   signal Output_Done : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROB_Write_Control PORT MAP (
          CDB_V => CDB_V,
          CDB_Q => CDB_Q,
          Insert_En => Insert_En,
          Remove_En => Remove_En,
          Instr_PC => Instr_PC,
          Instr_Type => Instr_Type,
          Instr_Dest => Instr_Dest,
          Instr_Tag => Instr_Tag,
          Reg_Tag => Reg_Tag,
          WrEn_PC => WrEn_PC,
          WrEn_Instr_Type => WrEn_Instr_Type,
          WrEn_Dest => WrEn_Dest,
          WrEn_Value => WrEn_Value,
          WrEn_Tag => WrEn_Tag,
          WrEn_Done => WrEn_Done,
          Output_PC => Output_PC,
          Output_Instr_Type => Output_Instr_Type,
          Output_Dest => Output_Dest,
          Output_Value => Output_Value,
          Output_Tag => Output_Tag,
          Output_Done => Output_Done
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		-- insert stimulus here
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Insert_En <= '0';
		Remove_En <= '0';
		Instr_PC <= "00000000000000000000000000000000";
		Instr_Type <= "0000";
		Instr_Dest <= "00000";
		Instr_Tag <= "00000";
		Reg_Tag <= "00000";
		wait for 10 ns;
		
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Insert_En <= '1';
		Remove_En <= '0';
		Instr_PC <= "00000000000000000000000000000111";
		Instr_Type <= "0101";
		Instr_Dest <= "00110";
		Instr_Tag <= "01001";
		Reg_Tag <= "00000";
		wait for 10 ns;
		
		CDB_V <= "00000000000000000000000011001100";
		CDB_Q <= "01001";
		Insert_En <= '0';
		Remove_En <= '0';
		Instr_PC <= "00000000000000000000000000000000";
		Instr_Type <= "1100";
		Instr_Dest <= "00101";
		Instr_Tag <= "00001";
		Reg_Tag <= "01001";
		wait for 10 ns;
		
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Insert_En <= '0';
		Remove_En <= '1';
		Instr_PC <= "00000000000000000000000000000000";
		Instr_Type <= "0000";
		Instr_Dest <= "00000";
		Instr_Tag <= "00000";
		Reg_Tag <= "01001";
		wait for 10 ns;
		
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Insert_En <= '0';
		Remove_En <= '0';
		Instr_PC <= "00000000000000000000000000000000";
		Instr_Type <= "0000";
		Instr_Dest <= "00000";
		Instr_Tag <= "00000";
		Reg_Tag <= "00000";
		wait for 10 ns;
      wait;
   end process;
END;