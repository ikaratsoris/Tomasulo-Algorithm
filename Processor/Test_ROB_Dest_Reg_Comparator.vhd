LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_ROB_Dest_Reg_Comparator IS
END Test_ROB_Dest_Reg_Comparator;
 
ARCHITECTURE behavior OF Test_ROB_Dest_Reg_Comparator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROB_Dest_Reg_Comparator
    PORT(
         Rx_In : IN  std_logic_vector(4 downto 0);
         Dest_Reg_In : IN  std_logic_vector(4 downto 0);
         Valid_Bit : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Rx_In : std_logic_vector(4 downto 0) := (others => '0');
   signal Dest_Reg_In : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal Valid_Bit : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROB_Dest_Reg_Comparator PORT MAP (
          Rx_In => Rx_In,
          Dest_Reg_In => Dest_Reg_In,
          Valid_Bit => Valid_Bit
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
		Rx_In <= "00000";
      Dest_Reg_In <= "00000";
		wait for 10 ns;
		
		Rx_In <= "00001";
      Dest_Reg_In <= "00000";
		wait for 10 ns;
		
		Rx_In <= "00000";
      Dest_Reg_In <= "00001";
		wait for 10 ns;
		
		Rx_In <= "00001";
      Dest_Reg_In <= "00001";
		wait for 10 ns;
      wait;
   end process;
END;