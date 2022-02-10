LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_ROB_RF_Module IS
END Test_ROB_RF_Module;
 
ARCHITECTURE behavior OF Test_ROB_RF_Module IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROB_RF_Module
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         CDB_V : IN  std_logic_vector(31 downto 0);
         CDB_Q : IN  std_logic_vector(4 downto 0);
         Issue_WE : IN  std_logic;
         Issue_Rj : IN  std_logic_vector(4 downto 0);
         Issue_Rk : IN  std_logic_vector(4 downto 0);
         Issue_PC : IN  std_logic_vector(31 downto 0);
         Issue_Type : IN  std_logic_vector(3 downto 0);
         Issue_Dest : IN  std_logic_vector(4 downto 0);
         Issue_Tag : IN  std_logic_vector(4 downto 0);
         Arith_Excep_En : IN  std_logic;
         Arith_Excep_Tag : IN  std_logic_vector(4 downto 0);
         Logic_Excep_En : IN  std_logic;
         Logic_Excep_Tag : IN  std_logic_vector(4 downto 0);
         Full_FIFO : OUT  std_logic;
         Rj_Tag : OUT  std_logic_vector(4 downto 0);
         Rk_Tag : OUT  std_logic_vector(4 downto 0);
         Rj_Value : OUT  std_logic_vector(31 downto 0);
         Rk_Value : OUT  std_logic_vector(31 downto 0);
         Excep_En : OUT  std_logic;
         Excep_PC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal CDB_V : std_logic_vector(31 downto 0) := (others => '0');
   signal CDB_Q : std_logic_vector(4 downto 0) := (others => '0');
   signal Issue_WE : std_logic := '0';
   signal Issue_Rj : std_logic_vector(4 downto 0) := (others => '0');
   signal Issue_Rk : std_logic_vector(4 downto 0) := (others => '0');
   signal Issue_PC : std_logic_vector(31 downto 0) := (others => '0');
   signal Issue_Type : std_logic_vector(3 downto 0) := (others => '0');
   signal Issue_Dest : std_logic_vector(4 downto 0) := (others => '0');
   signal Issue_Tag : std_logic_vector(4 downto 0) := (others => '0');
   signal Arith_Excep_En : std_logic := '0';
   signal Arith_Excep_Tag : std_logic_vector(4 downto 0) := (others => '0');
   signal Logic_Excep_En : std_logic := '0';
   signal Logic_Excep_Tag : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal Full_FIFO : std_logic;
   signal Rj_Tag : std_logic_vector(4 downto 0);
   signal Rk_Tag : std_logic_vector(4 downto 0);
   signal Rj_Value : std_logic_vector(31 downto 0);
   signal Rk_Value : std_logic_vector(31 downto 0);
   signal Excep_En : std_logic;
   signal Excep_PC : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROB_RF_Module PORT MAP (
          Clk => Clk,
          Reset => Reset,
          CDB_V => CDB_V,
          CDB_Q => CDB_Q,
          Issue_WE => Issue_WE,
          Issue_Rj => Issue_Rj,
          Issue_Rk => Issue_Rk,
          Issue_PC => Issue_PC,
          Issue_Type => Issue_Type,
          Issue_Dest => Issue_Dest,
          Issue_Tag => Issue_Tag,
          Arith_Excep_En => Arith_Excep_En,
          Arith_Excep_Tag => Arith_Excep_Tag,
          Logic_Excep_En => Logic_Excep_En,
          Logic_Excep_Tag => Logic_Excep_Tag,
          Full_FIFO => Full_FIFO,
          Rj_Tag => Rj_Tag,
          Rk_Tag => Rk_Tag,
          Rj_Value => Rj_Value,
          Rk_Value => Rk_Value,
          Excep_En => Excep_En,
          Excep_PC => Excep_PC
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
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_WE <= '0';
		Issue_Rj <= "00000";
		Issue_Rk <= "00000";
		Issue_PC <= "00000000000000000000000000000000";
		Issue_Type <= "0000";
		Issue_Dest <= "00000";
		Issue_Tag <= "00000";
		Arith_Excep_En <= '0';
		Arith_Excep_Tag <= "00000";
		Logic_Excep_En <= '0';
		Logic_Excep_Tag <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_WE <= '1';
		Issue_Rj <= "00000";
		Issue_Rk <= "00000";
		Issue_PC <= "00000000000000000000000000000000";
		Issue_Type <= "0101";
		Issue_Dest <= "00001";
		Issue_Tag <= "01001";
		Arith_Excep_En <= '0';
		Arith_Excep_Tag <= "00000";
		Logic_Excep_En <= '0';
		Logic_Excep_Tag <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_WE <= '1';
		Issue_Rj <= "00000";
		Issue_Rk <= "00000";
		Issue_PC <= "00000000000000000000000000000001";
		Issue_Type <= "0101";
		Issue_Dest <= "00010";
		Issue_Tag <= "01010";
		Arith_Excep_En <= '0';
		Arith_Excep_Tag <= "00000";
		Logic_Excep_En <= '0';
		Logic_Excep_Tag <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_WE <= '1';
		Issue_Rj <= "00000";
		Issue_Rk <= "00000";
		Issue_PC <= "00000000000000000000000000000010";
		Issue_Type <= "0101";
		Issue_Dest <= "00011";
		Issue_Tag <= "01011";
		Arith_Excep_En <= '0';
		Arith_Excep_Tag <= "00000";
		Logic_Excep_En <= '0';
		Logic_Excep_Tag <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_WE <= '1';
		Issue_Rj <= "00001";
		Issue_Rk <= "00000";
		Issue_PC <= "00000000000000000000000000000011";
		Issue_Type <= "0101";
		Issue_Dest <= "00100";
		Issue_Tag <= "01100";
		Arith_Excep_En <= '0';
		Arith_Excep_Tag <= "00000";
		Logic_Excep_En <= '0';
		Logic_Excep_Tag <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		CDB_V <= "01011110001001011101011010111010";
		CDB_Q <= "01001";
		Issue_WE <= '1';
		Issue_Rj <= "00010";
		Issue_Rk <= "00011";
		Issue_PC <= "00000000000000000000000000000100";
		Issue_Type <= "0101";
		Issue_Dest <= "00101";
		Issue_Tag <= "01101";
		Arith_Excep_En <= '0';
		Arith_Excep_Tag <= "00000";
		Logic_Excep_En <= '0';
		Logic_Excep_Tag <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		CDB_V <= "11110010110101100001011101001110";
		CDB_Q <= "01100";
		Issue_WE <= '1';
		Issue_Rj <= "00011";
		Issue_Rk <= "00100";
		Issue_PC <= "00000000000000000000000000000101";
		Issue_Type <= "0101";
		Issue_Dest <= "00110";
		Issue_Tag <= "01110";
		Arith_Excep_En <= '0';
		Arith_Excep_Tag <= "00000";
		Logic_Excep_En <= '0';
		Logic_Excep_Tag <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		CDB_V <= "10100010001110010001001011000010";
		CDB_Q <= "01010";
		Issue_WE <= '1';
		Issue_Rj <= "00000";
		Issue_Rk <= "00000";
		Issue_PC <= "00000000000000000000000000000110";
		Issue_Type <= "0001";
		Issue_Dest <= "00111";
		Issue_Tag <= "00110";
		Arith_Excep_En <= '0';
		Arith_Excep_Tag <= "00000";
		Logic_Excep_En <= '0';
		Logic_Excep_Tag <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		CDB_V <= "01001011010001101110111101011101";
		CDB_Q <= "01011";
		Issue_WE <= '1';
		Issue_Rj <= "00000";
		Issue_Rk <= "00000";
		Issue_PC <= "00000000000000000000000000000111";
		Issue_Type <= "0101";
		Issue_Dest <= "01000";
		Issue_Tag <= "00001";
		Arith_Excep_En <= '0';
		Arith_Excep_Tag <= "00000";
		Logic_Excep_En <= '0';
		Logic_Excep_Tag <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		CDB_V <= "00001001010001101000111101011101";
		CDB_Q <= "01101";
		Issue_WE <= '1';
		Issue_Rj <= "00001";
		Issue_Rk <= "00010";
		Issue_PC <= "00000000000000000000000000001000";
		Issue_Type <= "0101";
		Issue_Dest <= "01001";
		Issue_Tag <= "11111";
		Arith_Excep_En <= '0';
		Arith_Excep_Tag <= "00000";
		Logic_Excep_En <= '0';
		Logic_Excep_Tag <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_WE <= '0';
		Issue_Rj <= "00000";
		Issue_Rk <= "00000";
		Issue_PC <= "00000000000000000000000000000000";
		Issue_Type <= "0000";
		Issue_Dest <= "00000";
		Issue_Tag <= "00000";
		Arith_Excep_En <= '1';
		Arith_Excep_Tag <= "00001";
		Logic_Excep_En <= '0';
		Logic_Excep_Tag <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_WE <= '0';
		Issue_Rj <= "00000";
		Issue_Rk <= "00000";
		Issue_PC <= "00000000000000000000000000000000";
		Issue_Type <= "0000";
		Issue_Dest <= "00000";
		Issue_Tag <= "00000";
		Arith_Excep_En <= '0';
		Arith_Excep_Tag <= "00000";
		Logic_Excep_En <= '1';
		Logic_Excep_Tag <= "00110";
      wait for CLK_period;
		
		Reset <= '0';
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_WE <= '0';
		Issue_Rj <= "00000";
		Issue_Rk <= "00000";
		Issue_PC <= "00000000000000000000000000000000";
		Issue_Type <= "0000";
		Issue_Dest <= "00000";
		Issue_Tag <= "00000";
		Arith_Excep_En <= '0';
		Arith_Excep_Tag <= "00000";
		Logic_Excep_En <= '0';
		Logic_Excep_Tag <= "00000";
      wait for CLK_period;
      wait;
   end process;
END;