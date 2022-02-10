LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_ROB_FIFO_Full_Check IS
END Test_ROB_FIFO_Full_Check;
 
ARCHITECTURE behavior OF Test_ROB_FIFO_Full_Check IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROB_FIFO_Full_Check
    PORT(
         FIFO_Head : IN  std_logic_vector(2 downto 0);
         FIFO_Tail : IN  std_logic_vector(2 downto 0);
         FIFO_Full : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal FIFO_Head : std_logic_vector(2 downto 0) := (others => '0');
   signal FIFO_Tail : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal FIFO_Full : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROB_FIFO_Full_Check PORT MAP (
          FIFO_Head => FIFO_Head,
          FIFO_Tail => FIFO_Tail,
          FIFO_Full => FIFO_Full
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
		FIFO_Head <= "000";
		FIFO_Tail <= "000";
		wait for 10 ns;
		
		FIFO_Head <= "000";
		FIFO_Tail <= "001";
		wait for 10 ns;
		
		FIFO_Head <= "000";
		FIFO_Tail <= "010";
		wait for 10 ns;
		
		FIFO_Head <= "000";
		FIFO_Tail <= "011";
		wait for 10 ns;
		
		FIFO_Head <= "000";
		FIFO_Tail <= "110";
		wait for 10 ns;
		
		FIFO_Head <= "000";
		FIFO_Tail <= "111";
		wait for 10 ns;
		
		FIFO_Head <= "000";
		FIFO_Tail <= "000";
		wait for 10 ns;
		
		FIFO_Head <= "001";
		FIFO_Tail <= "000";
		wait for 10 ns;
		
		FIFO_Head <= "010";
		FIFO_Tail <= "000";
		wait for 10 ns;
		
		FIFO_Head <= "011";
		FIFO_Tail <= "000";
		wait for 10 ns;
		
		FIFO_Head <= "110";
		FIFO_Tail <= "000";
		wait for 10 ns;
		
		FIFO_Head <= "111";
		FIFO_Tail <= "000";
		wait for 10 ns;
		
		FIFO_Head <= "000";
		FIFO_Tail <= "000";
		wait for 10 ns;
		
		FIFO_Head <= "000";
		FIFO_Tail <= "001";
		wait for 10 ns;
		
		FIFO_Head <= "000";
		FIFO_Tail <= "010";
		wait for 10 ns;
		
		FIFO_Head <= "000";
		FIFO_Tail <= "011";
		wait for 10 ns;
		
		FIFO_Head <= "000";
		FIFO_Tail <= "110";
		wait for 10 ns;
		
		FIFO_Head <= "001";
		FIFO_Tail <= "110";
		wait for 10 ns;
		
		FIFO_Head <= "010";
		FIFO_Tail <= "110";
		wait for 10 ns;
		
		FIFO_Head <= "011";
		FIFO_Tail <= "110";
		wait for 10 ns;
		
		FIFO_Head <= "100";
		FIFO_Tail <= "110";
		wait for 10 ns;
		
		FIFO_Head <= "110";
		FIFO_Tail <= "110";
		wait for 10 ns;
      wait;
   end process;
END;