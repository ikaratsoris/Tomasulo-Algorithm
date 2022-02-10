LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_FU_Logic IS
END Test_FU_Logic;
 
ARCHITECTURE behavior OF Test_FU_Logic IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FU_Logic
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         RS_Logic_Rdy : IN  std_logic;
         RS_Logic_Dt : IN  std_logic_vector(72 downto 0);
         CDB_Response : IN  std_logic;
         CDB_Request : OUT  std_logic;
         CDB_V : OUT  std_logic_vector(31 downto 0);
         CDB_Q : OUT  std_logic_vector(4 downto 0);
         ALU_Zero : OUT  std_logic;
         ALU_Cout : OUT  std_logic;
         ALU_Ovf : OUT  std_logic;
         Exce_Tag : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal RS_Logic_Rdy : std_logic := '0';
   signal RS_Logic_Dt : std_logic_vector(72 downto 0) := (others => '0');
   signal CDB_Response : std_logic := '0';

 	--Outputs
   signal CDB_Request : std_logic;
   signal CDB_V : std_logic_vector(31 downto 0);
   signal CDB_Q : std_logic_vector(4 downto 0);
   signal ALU_Zero : std_logic;
   signal ALU_Cout : std_logic;
   signal ALU_Ovf : std_logic;
   signal Exce_Tag : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FU_Logic PORT MAP (
          Clk => Clk,
          Reset => Reset,
          RS_Logic_Rdy => RS_Logic_Rdy,
          RS_Logic_Dt => RS_Logic_Dt,
          CDB_Response => CDB_Response,
          CDB_Request => CDB_Request,
          CDB_V => CDB_V,
          CDB_Q => CDB_Q,
          ALU_Zero => ALU_Zero,
          ALU_Cout => ALU_Cout,
          ALU_Ovf => ALU_Ovf,
          Exce_Tag => Exce_Tag
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
		RS_Logic_Rdy <= '0';
      RS_Logic_Dt <= "0000000000000000000000000000000000000000000000000000000000000000000000000";
		CDB_Response <= '0';
      wait for Clk_period;
		
		RS_Logic_Rdy <= '1';
      RS_Logic_Dt <= "0100000000000000000000000000000000000000100000000000000000000000000000011";
		CDB_Response <= '0';
      wait for Clk_period;
		
		RS_Logic_Rdy <= '1';
      RS_Logic_Dt <= "1100000000000000000000000000000000000001100000000000000000000000000000111";
		CDB_Response <= '0';
      wait for Clk_period;
		
		RS_Logic_Rdy <= '1';
      RS_Logic_Dt <= "0101000000000000000000000000000000000010100000000000000000000000000001011";
		CDB_Response <= '0';
      wait for Clk_period;
		
		RS_Logic_Rdy <= '1';
      RS_Logic_Dt <= "0110000000000000000000000000000000001000100000000000000000000000000100011";
		CDB_Response <= '0';
      wait for Clk_period;
		
		RS_Logic_Rdy <= '1';
      RS_Logic_Dt <= "1110000000000000000000000000000010000001100000000000000000000000001000111";
		CDB_Response <= '0';
      wait for Clk_period;
		
		RS_Logic_Rdy <= '0';
      RS_Logic_Dt <= "0000000000000000000000000000000000000000000000000000000000000000000000000";
		CDB_Response <= '1';
      wait for Clk_period;
		
		RS_Logic_Rdy <= '0';
      RS_Logic_Dt <= "0000000000000000000000000000000000000000000000000000000000000000000000000";
		CDB_Response <= '0';
      wait for Clk_period;
		
		RS_Logic_Rdy <= '1';
      RS_Logic_Dt <= "0110000000000000000000000000000000001000100000000000000000000000000100011";
		CDB_Response <= '0';
      wait for Clk_period;
		
		RS_Logic_Rdy <= '1';
      RS_Logic_Dt <= "1110000000000000000000000000000010000001100000000000000000000000001000111";
		CDB_Response <= '1';
      wait for Clk_period;
		
		RS_Logic_Rdy <= '1';
      RS_Logic_Dt <= "1110000000000000000000000000000010000001100000000000000000000000001000111";
		CDB_Response <= '0';
      wait for Clk_period;
		
		RS_Logic_Rdy <= '0';
      RS_Logic_Dt <= "0000000000000000000000000000000000000000000000000000000000000000000000000";
		CDB_Response <= '1';
      wait for Clk_period*2;
		
		RS_Logic_Rdy <= '0';
      RS_Logic_Dt <= "0000000000000000000000000000000000000000000000000000000000000000000000000";
		CDB_Response <= '0';
      wait for Clk_period;
      wait;
   end process;
END;