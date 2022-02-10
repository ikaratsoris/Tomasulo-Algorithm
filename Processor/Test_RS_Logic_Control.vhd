LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_RS_Logic_Control IS
END Test_RS_Logic_Control;
 
ARCHITECTURE behavior OF Test_RS_Logic_Control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS_Logic_Control
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         RS0_Ready : IN  std_logic;
         RS1_Ready : IN  std_logic;
         CDB_Q : IN  std_logic_vector(4 downto 0);
         Mux_Sel : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal RS0_Ready : std_logic := '0';
   signal RS1_Ready : std_logic := '0';
   signal CDB_Q : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal Mux_Sel : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RS_Logic_Control PORT MAP (
          Clk => Clk,
          Reset => Reset,
          RS0_Ready => RS0_Ready,
          RS1_Ready => RS1_Ready,
          CDB_Q => CDB_Q,
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
		Reset <= '1';
		RS0_Ready <= '0';
		RS1_Ready<= '0';
		CDB_Q <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		RS0_Ready <= '1';
		RS1_Ready<= '0';
		CDB_Q <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		RS0_Ready <= '0';
		RS1_Ready<= '1';
		CDB_Q <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		RS0_Ready <= '1';
		RS1_Ready<= '1';
		CDB_Q <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		RS0_Ready <= '1';
		RS1_Ready<= '1';
		CDB_Q <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		RS0_Ready <= '1';
		RS1_Ready<= '1';
		CDB_Q <= "00001";
      wait for CLK_period;
		
		Reset <= '0';
		RS0_Ready <= '0';
		RS1_Ready<= '1';
		CDB_Q <= "00010";
      wait for CLK_period;
		
		Reset <= '0';
		RS0_Ready <= '0';
		RS1_Ready<= '0';
		CDB_Q <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		RS0_Ready <= '0';
		RS1_Ready<= '1';
		CDB_Q <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		RS0_Ready <= '1';
		RS1_Ready<= '1';
		CDB_Q <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		RS0_Ready <= '1';
		RS1_Ready<= '1';
		CDB_Q <= "00001";
      wait for CLK_period;
		
		Reset <= '0';
		RS0_Ready <= '0';
		RS1_Ready<= '1';
		CDB_Q <= "00010";
      wait for CLK_period;
		
		Reset <= '0';
		RS0_Ready <= '1';
		RS1_Ready<= '1';
		CDB_Q <= "00000";
      wait for CLK_period;
		
		Reset <= '0';
		RS0_Ready <= '1';
		RS1_Ready<= '1';
		CDB_Q <= "00001";
      wait for CLK_period;
		
		Reset <= '0';
		RS0_Ready <= '0';
		RS1_Ready<= '1';
		CDB_Q <= "00010";
      wait for CLK_period;
      wait;
   end process;
END;