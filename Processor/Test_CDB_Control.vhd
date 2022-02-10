LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_CDB_Control IS
END Test_CDB_Control;
 
ARCHITECTURE behavior OF Test_CDB_Control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CDB_Control
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         Req_Arith : IN  std_logic;
         Req_Logic : IN  std_logic;
         Req_LS : IN  std_logic;
         Grant_Arith : OUT  std_logic;
         Grant_Logic : OUT  std_logic;
         Grant_LS : OUT  std_logic;
         Mux_Sel : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal Req_Arith : std_logic := '0';
   signal Req_Logic : std_logic := '0';
   signal Req_LS : std_logic := '0';

 	--Outputs
   signal Grant_Arith : std_logic;
   signal Grant_Logic : std_logic;
   signal Grant_LS : std_logic;
   signal Mux_Sel : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CDB_Control PORT MAP (
          Clk => Clk,
          Rst => Rst,
          Req_Arith => Req_Arith,
          Req_Logic => Req_Logic,
          Req_LS => Req_LS,
          Grant_Arith => Grant_Arith,
          Grant_Logic => Grant_Logic,
          Grant_LS => Grant_LS,
          Mux_Sel => Mux_Sel
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
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '1';
		Req_Logic <= '0';
		Req_LS <= '0';
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '1';
		Req_Logic <= '1';
		Req_LS <= '0';
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '1';
		Req_Logic <= '1';
		Req_LS <= '0';
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '1';
		Req_Logic <= '1';
		Req_LS <= '1';
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '1';
		Req_Logic <= '1';
		Req_LS <= '1';
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '1';
		Req_Logic <= '1';
		Req_LS <= '1';
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '0';
		Req_Logic <= '0';
		Req_LS <= '0';
      wait for CLK_period*4;
		
		Rst <= '0';
		Req_Arith <= '0';
		Req_Logic <= '0';
		Req_LS <= '1';
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '0';
		Req_Logic <= '0';
		Req_LS <= '1';
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '0';
		Req_Logic <= '1';
		Req_LS <= '0';
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '0';
		Req_Logic <= '1';
		Req_LS <= '0';
      wait for CLK_period;
		
		Rst <= '0';
		Req_Arith <= '0';
		Req_Logic <= '0';
		Req_LS <= '0';
      wait for CLK_period;
      wait;
   end process;
END;