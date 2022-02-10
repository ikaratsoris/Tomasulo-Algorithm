LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_FU_Logic_ALU IS
END Test_FU_Logic_ALU;
 
ARCHITECTURE behavior OF Test_FU_Logic_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FU_Logic_ALU
    PORT(
         RS_Logic_Ready : IN  std_logic;
         RS_Logic_Data : IN  std_logic_vector(72 downto 0);
         ALU_Zero : OUT  std_logic;
         ALU_Cout : OUT  std_logic;
         ALU_Ovf : OUT  std_logic;
         ALU_V_Out : OUT  std_logic_vector(31 downto 0);
         ALU_Q_Out : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RS_Logic_Ready : std_logic := '0';
   signal RS_Logic_Data : std_logic_vector(72 downto 0) := (others => '0');

 	--Outputs
   signal ALU_Zero : std_logic;
   signal ALU_Cout : std_logic;
   signal ALU_Ovf : std_logic;
   signal ALU_V_Out : std_logic_vector(31 downto 0);
   signal ALU_Q_Out : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FU_Logic_ALU PORT MAP (
          RS_Logic_Ready => RS_Logic_Ready,
          RS_Logic_Data => RS_Logic_Data,
          ALU_Zero => ALU_Zero,
          ALU_Cout => ALU_Cout,
          ALU_Ovf => ALU_Ovf,
          ALU_V_Out => ALU_V_Out,
          ALU_Q_Out => ALU_Q_Out
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
		RS_Logic_Ready <= '0';
      RS_Logic_Data <= "0000000000000000000000000000000000000000000000000000000000000000000000000";
		wait for 10 ns;
		
		RS_Logic_Ready <= '1';
      RS_Logic_Data <= "0100000000000000000000000000000000000000100000000000000000000000000000011";
		wait for 10 ns;
		
		RS_Logic_Ready <= '1';
      RS_Logic_Data <= "1100000010000000000000000000000000000001100000000000000000000000000000111";
		wait for 10 ns;
		
		RS_Logic_Ready <= '1';
      RS_Logic_Data <= "0101000000000000000000000000000000000010100000000000000000000000000001011";
		wait for 10 ns;
		
		RS_Logic_Ready <= '1';
      RS_Logic_Data <= "0110000000000000000000000000000000001000100000000000000000000000000100011";
		wait for 10 ns;
		
		RS_Logic_Ready <= '1';
      RS_Logic_Data <= "1110000010000000000000000000000010000001100000000000000000000000001000111";
		wait for 10 ns;
      wait;
   end process;
END;