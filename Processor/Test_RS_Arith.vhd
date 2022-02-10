LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_RS_Arith IS
END Test_RS_Arith;
 
ARCHITECTURE behavior OF Test_RS_Arith IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS_Arith
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         RS_WE : IN  std_logic;
         CDB_V : IN  std_logic_vector(31 downto 0);
         CDB_Q : IN  std_logic_vector(4 downto 0);
         Issue_Op : IN  std_logic_vector(3 downto 0);
         Issue_Tag : IN  std_logic_vector(4 downto 0);
         RF_Vj : IN  std_logic_vector(31 downto 0);
         RF_Qj : IN  std_logic_vector(4 downto 0);
         RF_Vk : IN  std_logic_vector(31 downto 0);
         RF_Qk : IN  std_logic_vector(4 downto 0);
         RS0_Busy : OUT  std_logic;
         RS1_Busy : OUT  std_logic;
         RS2_Busy : OUT  std_logic;
         RS_Ready : OUT  std_logic;
         RS_Data : OUT  std_logic_vector(72 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal RS_WE : std_logic := '0';
   signal CDB_V : std_logic_vector(31 downto 0) := (others => '0');
   signal CDB_Q : std_logic_vector(4 downto 0) := (others => '0');
   signal Issue_Op : std_logic_vector(3 downto 0) := (others => '0');
   signal Issue_Tag : std_logic_vector(4 downto 0) := (others => '0');
   signal RF_Vj : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_Qj : std_logic_vector(4 downto 0) := (others => '0');
   signal RF_Vk : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_Qk : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal RS0_Busy : std_logic;
   signal RS1_Busy : std_logic;
   signal RS2_Busy : std_logic;
   signal RS_Ready : std_logic;
   signal RS_Data : std_logic_vector(72 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RS_Arith PORT MAP (
          Clk => Clk,
          Reset => Reset,
          RS_WE => RS_WE,
          CDB_V => CDB_V,
          CDB_Q => CDB_Q,
          Issue_Op => Issue_Op,
          Issue_Tag => Issue_Tag,
          RF_Vj => RF_Vj,
          RF_Qj => RF_Qj,
          RF_Vk => RF_Vk,
          RF_Qk => RF_Qk,
          RS0_Busy => RS0_Busy,
          RS1_Busy => RS1_Busy,
          RS2_Busy => RS2_Busy,
          RS_Ready => RS_Ready,
          RS_Data => RS_Data
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
		Reset <= '0';
		RS_WE <= '0';
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_Op <= "0000";
		Issue_Tag <= "00000";
		RF_Vj <= "00000000000000000000000000000000";
		RF_Qj <= "00000";
		RF_Vk <= "00000000000000000000000000000000";
		RF_Qk <= "00000";
      wait for CLK_period;
		
		RS_WE <= '1';
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_Op <= "0010";
		Issue_Tag <= "01001";
		RF_Vj <= "00000000000000000000000000001100";
		RF_Qj <= "00001";
		RF_Vk <= "00000000000000000000000000001110";
		RF_Qk <= "00011";
      wait for CLK_period;
		
		RS_WE <= '1';
		CDB_V <= "00000000000000000000000000000011";
		CDB_Q <= "00001";
		Issue_Op <= "0001";
		Issue_Tag <= "01010";
		RF_Vj <= "00000000000000000000000000101000";
		RF_Qj <= "00010";
		RF_Vk <= "00000000000000000000000000000100";
		RF_Qk <= "00010";
      wait for CLK_period;
		
		RS_WE <= '1';
		CDB_V <= "00000000000000000000000000110011";
		CDB_Q <= "00010";
		Issue_Op <= "1011";
		Issue_Tag <= "01011";
		RF_Vj <= "00000000000000000000000000001010";
		RF_Qj <= "00010";
		RF_Vk <= "00000000000000000000000000000101";
		RF_Qk <= "00000";
      wait for CLK_period;
		
		RS_WE <= '0';
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_Op <= "0000";
		Issue_Tag <= "00000";
		RF_Vj <= "00000000000000000000000000000000";
		RF_Qj <= "00000";
		RF_Vk <= "00000000000000000000000000000000";
		RF_Qk <= "00000";
      wait for CLK_period*3;
		
		RS_WE <= '0';
		CDB_V <= "00000000000000000000000000000111";
		CDB_Q <= "01010";
		Issue_Op <= "0000";
		Issue_Tag <= "00000";
		RF_Vj <= "00000000000000000000000000000000";
		RF_Qj <= "00000";
		RF_Vk <= "00000000000000000000000000000000";
		RF_Qk <= "00000";
      wait for CLK_period;
		
		RS_WE <= '1';
		CDB_V <= "00000000000000000000000000110011";
		CDB_Q <= "00010";
		Issue_Op <= "1011";
		Issue_Tag <= "01010";
		RF_Vj <= "00000000000000000000000000001010";
		RF_Qj <= "00010";
		RF_Vk <= "00000000000000000000000000000101";
		RF_Qk <= "00000";
      wait for CLK_period;
		
		RS_WE <= '0';
		CDB_V <= "00000000000000000000000000000111";
		CDB_Q <= "01010";
		Issue_Op <= "0000";
		Issue_Tag <= "00000";
		RF_Vj <= "00000000000000000000000000000000";
		RF_Qj <= "00000";
		RF_Vk <= "00000000000000000000000000000000";
		RF_Qk <= "00000";
      wait for CLK_period;
		
		RS_WE <= '0';
		CDB_V <= "00000000000000000000000000000111";
		CDB_Q <= "01011";
		Issue_Op <= "0000";
		Issue_Tag <= "00000";
		RF_Vj <= "00000000000000000000000000000000";
		RF_Qj <= "00000";
		RF_Vk <= "00000000000000000000000000000000";
		RF_Qk <= "00000";
      wait for CLK_period;
		
		RS_WE <= '0';
		CDB_V <= "00000000000000000000000000000111";
		CDB_Q <= "01010";
		Issue_Op <= "0000";
		Issue_Tag <= "00000";
		RF_Vj <= "00000000000000000000000000000000";
		RF_Qj <= "00000";
		RF_Vk <= "00000000000000000000000000000000";
		RF_Qk <= "00000";
      wait for CLK_period;
      wait;
   end process;
END;