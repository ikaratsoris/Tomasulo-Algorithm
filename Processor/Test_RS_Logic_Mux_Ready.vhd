LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_RS_Logic_Mux_Ready IS
END Test_RS_Logic_Mux_Ready;
 
ARCHITECTURE behavior OF Test_RS_Logic_Mux_Ready IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS_Logic_Mux_Ready
    PORT(
         Sel : IN  std_logic_vector(1 downto 0);
         RS0_Ready : IN  std_logic;
         RS1_Ready : IN  std_logic;
         RS_Logic_Ready : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Sel : std_logic_vector(1 downto 0) := (others => '0');
   signal RS0_Ready : std_logic := '0';
   signal RS1_Ready : std_logic := '0';

 	--Outputs
   signal RS_Logic_Ready : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RS_Logic_Mux_Ready PORT MAP (
          Sel => Sel,
          RS0_Ready => RS0_Ready,
          RS1_Ready => RS1_Ready,
          RS_Logic_Ready => RS_Logic_Ready
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
		RS0_Ready <= '1';
		RS1_Ready <= '0';
		Sel <= "00";
		wait for 10 ns;
		
		RS0_Ready <= '0';
		RS1_Ready <= '1';
		Sel <= "01";
		wait for 10 ns;
		
		RS0_Ready <= '1';
		RS1_Ready <= '1';
		Sel <= "10";
		wait for 10 ns;
		
		RS0_Ready <= '1';
		RS1_Ready <= '1';
		Sel <= "11";
		wait for 10 ns;
      wait;
   end process;
END;