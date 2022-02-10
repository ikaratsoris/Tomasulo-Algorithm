LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_CDB IS
END Test_CDB;
 
ARCHITECTURE behavior OF Test_CDB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CDB
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         Req_Arith : IN  std_logic;
         Req_Logic : IN  std_logic;
         Req_LS : IN  std_logic;
         Arith_Tag : IN  std_logic_vector(4 downto 0);
         Logic_Tag : IN  std_logic_vector(4 downto 0);
         LS_Tag : IN  std_logic_vector(4 downto 0);
         Arith_Data : IN  std_logic_vector(31 downto 0);
         Logic_Data : IN  std_logic_vector(31 downto 0);
         LS_Data : IN  std_logic_vector(31 downto 0);
         Grant_Arith : OUT  std_logic;
         Grant_Logic : OUT  std_logic;
         Grant_LS : OUT  std_logic;
         CDB_Q : OUT  std_logic_vector(4 downto 0);
         CDB_V : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal Req_Arith : std_logic := '0';
   signal Req_Logic : std_logic := '0';
   signal Req_LS : std_logic := '0';
   signal Arith_Tag : std_logic_vector(4 downto 0) := (others => '0');
   signal Logic_Tag : std_logic_vector(4 downto 0) := (others => '0');
   signal LS_Tag : std_logic_vector(4 downto 0) := (others => '0');
   signal Arith_Data : std_logic_vector(31 downto 0) := (others => '0');
   signal Logic_Data : std_logic_vector(31 downto 0) := (others => '0');
   signal LS_Data : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Grant_Arith : std_logic;
   signal Grant_Logic : std_logic;
   signal Grant_LS : std_logic;
   signal CDB_Q : std_logic_vector(4 downto 0);
   signal CDB_V : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CDB PORT MAP (
          Clk => Clk,
          Rst => Rst,
          Req_Arith => Req_Arith,
          Req_Logic => Req_Logic,
          Req_LS => Req_LS,
          Arith_Tag => Arith_Tag,
          Logic_Tag => Logic_Tag,
          LS_Tag => LS_Tag,
          Arith_Data => Arith_Data,
          Logic_Data => Logic_Data,
          LS_Data => LS_Data,
          Grant_Arith => Grant_Arith,
          Grant_Logic => Grant_Logic,
          Grant_LS => Grant_LS,
          CDB_Q => CDB_Q,
          CDB_V => CDB_V
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
		Rst <= '1';
		Req_Arith <= '0';
		Req_Logic <= '0';
		Req_LS <= '0';
		Arith_Tag <= "00000";
		Logic_Tag <= "00000";
		LS_Tag <= "00000";
		Arith_Data <= "00000000000000000000000000000000";
		Logic_Data <= "00000000000000000000000000000000";
		LS_Data <= "00000000000000000000000000000000";
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '1';
		Req_Logic <= '0';
		Req_LS <= '0';
      Arith_Tag <= "01001";
		Logic_Tag <= "00001";
		LS_Tag <= "11001";
		Arith_Data <= "00000000000000000000000000000111";
		Logic_Data <= "00000000000000000000000000001110";
		LS_Data <= "00000000000000000000000000011100";
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '1';
		Req_Logic <= '1';
		Req_LS <= '0';
      Arith_Tag <= "01001";
		Logic_Tag <= "00001";
		LS_Tag <= "11001";
		Arith_Data <= "00000000000000000000000000000111";
		Logic_Data <= "00000000000000000000000000001110";
		LS_Data <= "00000000000000000000000000011100";
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '1';
		Req_Logic <= '1';
		Req_LS <= '0';
      Arith_Tag <= "01001";
		Logic_Tag <= "00001";
		LS_Tag <= "11001";
		Arith_Data <= "00000000000000000000000000000111";
		Logic_Data <= "00000000000000000000000000001110";
		LS_Data <= "00000000000000000000000000011100";
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '1';
		Req_Logic <= '1';
		Req_LS <= '1';
      Arith_Tag <= "01001";
		Logic_Tag <= "00001";
		LS_Tag <= "11001";
		Arith_Data <= "00000000000000000000000000000111";
		Logic_Data <= "00000000000000000000000000001110";
		LS_Data <= "00000000000000000000000000011100";
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '1';
		Req_Logic <= '1';
		Req_LS <= '1';
      Arith_Tag <= "01001";
		Logic_Tag <= "00001";
		LS_Tag <= "11001";
		Arith_Data <= "00000000000000000000000000000111";
		Logic_Data <= "00000000000000000000000000001110";
		LS_Data <= "00000000000000000000000000011100";
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '1';
		Req_Logic <= '1';
		Req_LS <= '1';
      Arith_Tag <= "01001";
		Logic_Tag <= "00001";
		LS_Tag <= "11001";
		Arith_Data <= "00000000000000000000000000000111";
		Logic_Data <= "00000000000000000000000000001110";
		LS_Data <= "00000000000000000000000000011100";
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '0';
		Req_Logic <= '0';
		Req_LS <= '0';
      Arith_Tag <= "01001";
		Logic_Tag <= "00001";
		LS_Tag <= "11001";
		Arith_Data <= "00000000000000000000000000000111";
		Logic_Data <= "00000000000000000000000000001110";
		LS_Data <= "00000000000000000000000000011100";
      wait for CLK_period*4;
		
		Rst <= '0';
		Req_Arith <= '0';
		Req_Logic <= '0';
		Req_LS <= '1';
      Arith_Tag <= "01001";
		Logic_Tag <= "00001";
		LS_Tag <= "11001";
		Arith_Data <= "00000000000000000000000000000111";
		Logic_Data <= "00000000000000000000000000001110";
		LS_Data <= "00000000000000000000000000011100";
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '0';
		Req_Logic <= '0';
		Req_LS <= '1';
		Arith_Tag <= "01001";
		Logic_Tag <= "00001";
		LS_Tag <= "11001";
		Arith_Data <= "00000000000000000000000000000111";
		Logic_Data <= "00000000000000000000000000001110";
		LS_Data <= "00000000000000000000000000011100";
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '0';
		Req_Logic <= '1';
		Req_LS <= '0';
      Arith_Tag <= "01001";
		Logic_Tag <= "00001";
		LS_Tag <= "11001";
		Arith_Data <= "00000000000000000000000000000111";
		Logic_Data <= "00000000000000000000000000001110";
		LS_Data <= "00000000000000000000000000011100";
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '0';
		Req_Logic <= '1';
		Req_LS <= '0';
      Arith_Tag <= "01001";
		Logic_Tag <= "00001";
		LS_Tag <= "11001";
		Arith_Data <= "00000000000000000000000000000111";
		Logic_Data <= "00000000000000000000000000001110";
		LS_Data <= "00000000000000000000000000011100";
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '0';
		Req_Logic <= '0';
		Req_LS <= '0';
      Arith_Tag <= "01001";
		Logic_Tag <= "00001";
		LS_Tag <= "11001";
		Arith_Data <= "00000000000000000000000000000111";
		Logic_Data <= "00000000000000000000000000001110";
		LS_Data <= "00000000000000000000000000011100";
      wait for CLK_period;
      wait;
   end process;
END;