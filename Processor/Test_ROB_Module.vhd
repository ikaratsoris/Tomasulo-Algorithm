LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_ROB_Module IS
END Test_ROB_Module;
 
ARCHITECTURE behavior OF Test_ROB_Module IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROB_Module
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         Insert_En : IN  std_logic;
         Remove_En : IN  std_logic;
         CDB_V : IN  std_logic_vector(31 downto 0);
         CDB_Q : IN  std_logic_vector(4 downto 0);
         Instr_Rj : IN  std_logic_vector(4 downto 0);
         Instr_Rk : IN  std_logic_vector(4 downto 0);
         Instr_PC : IN  std_logic_vector(31 downto 0);
         Instr_Type : IN  std_logic_vector(3 downto 0);
         Instr_Dest : IN  std_logic_vector(4 downto 0);
         Instr_Tag : IN  std_logic_vector(4 downto 0);
         Reg_PC_Out : OUT  std_logic_vector(31 downto 0);
         Reg_Dest_Out : OUT  std_logic_vector(4 downto 0);
         Reg_Value_Out : OUT  std_logic_vector(31 downto 0);
         Reg_Tag_Out : OUT  std_logic_vector(4 downto 0);
         Reg_Done_Out : OUT  std_logic;
         Valid_Bit_Rj : OUT  std_logic;
         Valid_Bit_Rk : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Insert_En : std_logic := '0';
   signal Remove_En : std_logic := '0';
   signal CDB_V : std_logic_vector(31 downto 0) := (others => '0');
   signal CDB_Q : std_logic_vector(4 downto 0) := (others => '0');
   signal Instr_Rj : std_logic_vector(4 downto 0) := (others => '0');
   signal Instr_Rk : std_logic_vector(4 downto 0) := (others => '0');
   signal Instr_PC : std_logic_vector(31 downto 0) := (others => '0');
   signal Instr_Type : std_logic_vector(3 downto 0) := (others => '0');
   signal Instr_Dest : std_logic_vector(4 downto 0) := (others => '0');
   signal Instr_Tag : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal Reg_PC_Out : std_logic_vector(31 downto 0);
   signal Reg_Dest_Out : std_logic_vector(4 downto 0);
   signal Reg_Value_Out : std_logic_vector(31 downto 0);
   signal Reg_Tag_Out : std_logic_vector(4 downto 0);
   signal Reg_Done_Out : std_logic;
   signal Valid_Bit_Rj : std_logic;
   signal Valid_Bit_Rk : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROB_Module PORT MAP (
          Clk => Clk,
          Reset => Reset,
          Insert_En => Insert_En,
          Remove_En => Remove_En,
          CDB_V => CDB_V,
          CDB_Q => CDB_Q,
          Instr_Rj => Instr_Rj,
          Instr_Rk => Instr_Rk,
          Instr_PC => Instr_PC,
          Instr_Type => Instr_Type,
          Instr_Dest => Instr_Dest,
          Instr_Tag => Instr_Tag,
          Reg_PC_Out => Reg_PC_Out,
          Reg_Dest_Out => Reg_Dest_Out,
          Reg_Value_Out => Reg_Value_Out,
          Reg_Tag_Out => Reg_Tag_Out,
          Reg_Done_Out => Reg_Done_Out,
          Valid_Bit_Rj => Valid_Bit_Rj,
          Valid_Bit_Rk => Valid_Bit_Rk
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '1';
		wait for CLK_period/2;
		CLK <= '0';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		-- insert stimulus here
		Reset <= '1';
		Insert_En <= '0';
		Remove_En <= '0';
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Instr_Rj <= "00000";
      Instr_Rk <= "00000";
		Instr_PC <= "00000000000000000000000000000000";
		Instr_Type <= "0000";
		Instr_Dest <= "00000";
		Instr_Tag <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		Insert_En <= '0';
		Remove_En <= '0';
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Instr_Rj <= "00000";
      Instr_Rk <= "00000";
		Instr_PC <= "00000000000000000000000000000000";
		Instr_Type <= "0000";
		Instr_Dest <= "00000";
		Instr_Tag <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		Insert_En <= '1';
		Remove_En <= '0';
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Instr_Rj <= "00000";
      Instr_Rk <= "00000";
		Instr_PC <= "00000000000000000000000000000001";
		Instr_Type <= "0101";
		Instr_Dest <= "00001";
		Instr_Tag <= "01001";
      wait for CLK_period;
		
		Reset <= '0';
		Insert_En <= '0';
		Remove_En <= '0';
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Instr_Rj <= "00001";
      Instr_Rk <= "00001";
		Instr_PC <= "00000000000000000000000000000010";
		Instr_Type <= "0001";
		Instr_Dest <= "01010";
		Instr_Tag <= "00001";
      wait for CLK_period;
		
		Reset <= '0';
		Insert_En <= '0';
		Remove_En <= '0';
		CDB_V <= "00000000000000000000000000011111";
		CDB_Q <= "01001";
		Instr_Rj <= "01100";
      Instr_Rk <= "01100";
		Instr_PC <= "00000000000000000000000000000011";
		Instr_Type <= "0111";
		Instr_Dest <= "00011";
		Instr_Tag <= "00010";
      wait for CLK_period;
		
		Reset <= '0';
		Insert_En <= '0';
		Remove_En <= '1';
		CDB_V <= "00000000000000000000000000011000";
		CDB_Q <= "01011";
		Instr_Rj <= "00100";
      Instr_Rk <= "00010";
		Instr_PC <= "00000000000000000000000000000100";
		Instr_Type <= "0011";
		Instr_Dest <= "00100";
		Instr_Tag <= "00011";
      wait for CLK_period;
		
		Reset <= '0';
		Insert_En <= '0';
		Remove_En <= '0';
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Instr_Rj <= "00001";
      Instr_Rk <= "00000";
		Instr_PC <= "00000000000000000000000000000000";
		Instr_Type <= "0000";
		Instr_Dest <= "00000";
		Instr_Tag <= "00000";
      wait for CLK_period;
      wait;
   end process;
END;