LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_Processor IS
END Test_Processor;
 
ARCHITECTURE behavior OF Test_Processor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Processor
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         PC_Input : IN  std_logic_vector(31 downto 0);
         Instruction : IN  std_logic_vector(19 downto 0);
         Accepted : OUT  std_logic;
         Exception_En : OUT  std_logic;
         Exception_PC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal PC_Input : std_logic_vector(31 downto 0) := (others => '0');
   signal Instruction : std_logic_vector(19 downto 0) := (others => '0');

 	--Outputs
   signal Accepted : std_logic;
   signal Exception_En : std_logic;
   signal Exception_PC : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Processor PORT MAP (
          Clk => Clk,
          Reset => Reset,
          PC_Input => PC_Input,
          Instruction => Instruction,
          Accepted => Accepted,
          Exception_En => Exception_En,
          Exception_PC => Exception_PC
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
		PC_Input <= "00000000000000000000000000000000";
		Instruction <= "00000000000000000000";
      wait for CLK_period;
		
		Reset <= '0';
		PC_Input <= "00000000000000000000000000000001";
		Instruction <= "10000000100000100011";
      wait for CLK_period;
		
		Reset <= '0';
		PC_Input <= "00000000000000000000000000000010";
		Instruction <= "10001001000000100011";
      wait for CLK_period;
		
		Reset <= '0';
		PC_Input <= "00000000000000000000000000000011";
		Instruction <= "10101001010000100011";
      wait for CLK_period;
		
		Reset <= '0';
		PC_Input <= "00000000000000000000000000000100";
		Instruction <= "10110001100000100011";
      wait for CLK_period;
		
		Reset <= '0';
		PC_Input <= "00000000000000000000000000000101";
		Instruction <= "10100001110000100011";
      wait for CLK_period;
		
		Reset <= '0';
		PC_Input <= "00000000000000000000000000000110";
		Instruction <= "10000010000000100011";
      wait for CLK_period;
		
		Reset <= '0';
		PC_Input <= "00000000000000000000000000000111";
		Instruction <= "10001010010000100011";
      wait for CLK_period;
		
		Reset <= '0';
		PC_Input <= "00000000000000000000000000001000";
		Instruction <= "10101010100010100011";
      wait for CLK_period*2;
		
		Reset <= '0';
		PC_Input <= "00000000000000000000000000001001";
		Instruction <= "10110010110000100011";
      wait for CLK_period;
		
		Reset <= '0';
		PC_Input <= "00000000000000000000000000000000";
		Instruction <= "00000000000000000000";
      wait for CLK_period;
      wait;
   end process;
END;