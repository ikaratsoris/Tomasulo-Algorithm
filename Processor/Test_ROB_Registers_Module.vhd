LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_ROB_Registers_Module IS
END Test_ROB_Registers_Module;
 
ARCHITECTURE behavior OF Test_ROB_Registers_Module IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROB_Registers_Module
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         PC_WE : IN  std_logic;
         Instr_Type_WE : IN  std_logic;
         Dest_WE : IN  std_logic;
         Value_WE : IN  std_logic;
         Tag_WE : IN  std_logic;
         Done_WE : IN  std_logic;
         PC_In : IN  std_logic_vector(31 downto 0);
         Instr_Type_In : IN  std_logic_vector(3 downto 0);
         Dest_In : IN  std_logic_vector(4 downto 0);
         Value_In : IN  std_logic_vector(31 downto 0);
         Tag_In : IN  std_logic_vector(4 downto 0);
         Done_In : IN  std_logic;
         PC_Out : OUT  std_logic_vector(31 downto 0);
         Instr_Type_Out : OUT  std_logic_vector(3 downto 0);
         Dest_Out : OUT  std_logic_vector(4 downto 0);
         Value_Out : OUT  std_logic_vector(31 downto 0);
         Tag_Out : OUT  std_logic_vector(4 downto 0);
         Done_Out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal PC_WE : std_logic := '0';
   signal Instr_Type_WE : std_logic := '0';
   signal Dest_WE : std_logic := '0';
   signal Value_WE : std_logic := '0';
   signal Tag_WE : std_logic := '0';
   signal Done_WE : std_logic := '0';
   signal PC_In : std_logic_vector(31 downto 0) := (others => '0');
   signal Instr_Type_In : std_logic_vector(3 downto 0) := (others => '0');
   signal Dest_In : std_logic_vector(4 downto 0) := (others => '0');
   signal Value_In : std_logic_vector(31 downto 0) := (others => '0');
   signal Tag_In : std_logic_vector(4 downto 0) := (others => '0');
   signal Done_In : std_logic := '0';

 	--Outputs
   signal PC_Out : std_logic_vector(31 downto 0);
   signal Instr_Type_Out : std_logic_vector(3 downto 0);
   signal Dest_Out : std_logic_vector(4 downto 0);
   signal Value_Out : std_logic_vector(31 downto 0);
   signal Tag_Out : std_logic_vector(4 downto 0);
   signal Done_Out : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROB_Registers_Module PORT MAP (
          Clk => Clk,
          Reset => Reset,
          PC_WE => PC_WE,
          Instr_Type_WE => Instr_Type_WE,
          Dest_WE => Dest_WE,
          Value_WE => Value_WE,
          Tag_WE => Tag_WE,
          Done_WE => Done_WE,
          PC_In => PC_In,
          Instr_Type_In => Instr_Type_In,
          Dest_In => Dest_In,
          Value_In => Value_In,
          Tag_In => Tag_In,
          Done_In => Done_In,
          PC_Out => PC_Out,
          Instr_Type_Out => Instr_Type_Out,
          Dest_Out => Dest_Out,
          Value_Out => Value_Out,
          Tag_Out => Tag_Out,
          Done_Out => Done_Out
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
		PC_WE <= '0';
		PC_In <= "00000000000000000000000000000000";
		Instr_Type_WE <= '0';
		Instr_Type_In <= "0000";
		Dest_WE <= '0';
		Dest_In <= "00000";
		Value_WE <= '0';
		Value_In <= "00000000000000000000000000000000";
		Tag_WE <= '0';
		Tag_In <= "00000";
		Done_WE <= '0';
		Done_In <= '0';
      wait for CLK_period;
		
		Reset <= '0';
		PC_WE <= '0';
		PC_In <= "00000000000000000000000000000000";
		Instr_Type_WE <= '0';
		Instr_Type_In <= "0000";
		Dest_WE <= '0';
		Dest_In <= "00000";
		Value_WE <= '0';
		Value_In <= "00000000000000000000000000000000";
		Tag_WE <= '0';
		Tag_In <= "00000";
		Done_WE <= '0';
		Done_In <= '0';
      wait for CLK_period;
		
		Reset <= '0';
		PC_WE <= '1';
		PC_In <= "00000000000000000000000000000111";
		Instr_Type_WE <= '0';
		Instr_Type_In <= "0000";
		Dest_WE <= '0';
		Dest_In <= "00000";
		Value_WE <= '0';
		Value_In <= "00000000000000000000000000000000";
		Tag_WE <= '0';
		Tag_In <= "00000";
		Done_WE <= '0';
		Done_In <= '0';
      wait for CLK_period;
		
		Reset <= '0';
		PC_WE <= '0';
		PC_In <= "00000000000000000000000000000000";
		Instr_Type_WE <= '1';
		Instr_Type_In <= "0110";
		Dest_WE <= '0';
		Dest_In <= "00000";
		Value_WE <= '0';
		Value_In <= "00000000000000000000000000000000";
		Tag_WE <= '0';
		Tag_In <= "00000";
		Done_WE <= '0';
		Done_In <= '0';
      wait for CLK_period;
		
		Reset <= '0';
		PC_WE <= '0';
		PC_In <= "00000000000000000000000000000000";
		Instr_Type_WE <= '0';
		Instr_Type_In <= "0000";
		Dest_WE <= '1';
		Dest_In <= "00101";
		Value_WE <= '0';
		Value_In <= "00000000000000000000000000000000";
		Tag_WE <= '0';
		Tag_In <= "00000";
		Done_WE <= '0';
		Done_In <= '0';
      wait for CLK_period;
		
		Reset <= '0';
		PC_WE <= '0';
		PC_In <= "00000000000000000000000000000000";
		Instr_Type_WE <= '0';
		Instr_Type_In <= "0000";
		Dest_WE <= '0';
		Dest_In <= "00000";
		Value_WE <= '1';
		Value_In <= "00000000000000000000011100000000";
		Tag_WE <= '0';
		Tag_In <= "00000";
		Done_WE <= '0';
		Done_In <= '0';
      wait for CLK_period;
		
		Reset <= '0';
		PC_WE <= '0';
		PC_In <= "00000000000000000000000000000000";
		Instr_Type_WE <= '0';
		Instr_Type_In <= "0000";
		Dest_WE <= '0';
		Dest_In <= "00000";
		Value_WE <= '0';
		Value_In <= "00000000000000000000000000000000";
		Tag_WE <= '1';
		Tag_In <= "00011";
		Done_WE <= '0';
		Done_In <= '0';
      wait for CLK_period;
		
		Reset <= '0';
		PC_WE <= '0';
		PC_In <= "00000000000000000000000000000000";
		Instr_Type_WE <= '0';
		Instr_Type_In <= "0000";
		Dest_WE <= '0';
		Dest_In <= "00000";
		Value_WE <= '0';
		Value_In <= "00000000000000000000000000000000";
		Tag_WE <= '0';
		Tag_In <= "00000";
		Done_WE <= '1';
		Done_In <= '1';
      wait for CLK_period;
		
		Reset <= '0';
		PC_WE <= '1';
		PC_In <= "00000000000001100000000000000000";
		Instr_Type_WE <= '1';
		Instr_Type_In <= "0100";
		Dest_WE <= '1';
		Dest_In <= "01000";
		Value_WE <= '1';
		Value_In <= "00000000000001100000000000000000";
		Tag_WE <= '1';
		Tag_In <= "00001";
		Done_WE <= '1';
		Done_In <= '0';
      wait for CLK_period;
		
		Reset <= '1';
		PC_WE <= '0';
		PC_In <= "00000000000000000000000000000000";
		Instr_Type_WE <= '0';
		Instr_Type_In <= "0000";
		Dest_WE <= '0';
		Dest_In <= "00000";
		Value_WE <= '0';
		Value_In <= "00000000000000000000000000000000";
		Tag_WE <= '0';
		Tag_In <= "00000";
		Done_WE <= '0';
		Done_In <= '0';
      wait for CLK_period;
		
		Reset <= '0';
		PC_WE <= '0';
		PC_In <= "00000000000000000000000000000000";
		Instr_Type_WE <= '0';
		Instr_Type_In <= "0000";
		Dest_WE <= '0';
		Dest_In <= "00000";
		Value_WE <= '0';
		Value_In <= "00000000000000000000000000000000";
		Tag_WE <= '0';
		Tag_In <= "00000";
		Done_WE <= '0';
		Done_In <= '0';
      wait for CLK_period;
      wait;
   end process;
END;