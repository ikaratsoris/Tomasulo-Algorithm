LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_ROB_MEM_Mux_Tag IS
END Test_ROB_MEM_Mux_Tag;
 
ARCHITECTURE behavior OF Test_ROB_MEM_Mux_Tag IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROB_MEM_Mux_Tag
    PORT(
         Sel : IN  std_logic;
         ROB_Tag : IN  std_logic_vector(4 downto 0);
         Mux_Tag_Out : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Sel : std_logic := '0';
   signal ROB_Tag : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal Mux_Tag_Out : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROB_MEM_Mux_Tag PORT MAP (
          Sel => Sel,
          ROB_Tag => ROB_Tag,
          Mux_Tag_Out => Mux_Tag_Out
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
		Sel <= '0';
		ROB_Tag <= "10101";
		wait for 10 ns;
		
		Sel <= '1';
		ROB_Tag <= "10101";
		wait for 10 ns;
		
		Sel <= '0';
		ROB_Tag <= "10101";
		wait for 10 ns;
      wait;
   end process;
END;