LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_ROB_MEM_Mux_Data IS
END Test_ROB_MEM_Mux_Data;
 
ARCHITECTURE behavior OF Test_ROB_MEM_Mux_Data IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROB_MEM_Mux_Data
    PORT(
         Sel : IN  std_logic;
         RF_Mem_Value : IN  std_logic_vector(31 downto 0);
         ROB_Value : IN  std_logic_vector(31 downto 0);
         Mux_Data_Out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Sel : std_logic := '0';
   signal RF_Mem_Value : std_logic_vector(31 downto 0) := (others => '0');
   signal ROB_Value : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Mux_Data_Out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROB_MEM_Mux_Data PORT MAP (
          Sel => Sel,
          RF_Mem_Value => RF_Mem_Value,
          ROB_Value => ROB_Value,
          Mux_Data_Out => Mux_Data_Out
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
		RF_Mem_Value <= "01001001000011110010100111111100";
		ROB_Value <= "11100110100100111001101110111010";
		wait for 10 ns;
		
		Sel <= '1';
		RF_Mem_Value <= "01001001000011110010100111111100";
		ROB_Value <= "11100110100100111001101110111010";
		wait for 10 ns;
		
		Sel <= '0';
		RF_Mem_Value <= "01001001000011110010100111111100";
		ROB_Value <= "11100110100100111001101110111010";
		wait for 10 ns;
      wait;
   end process;
END;