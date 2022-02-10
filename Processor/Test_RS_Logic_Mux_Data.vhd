LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_RS_Logic_Mux_Data IS
END Test_RS_Logic_Mux_Data;
 
ARCHITECTURE behavior OF Test_RS_Logic_Mux_Data IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS_Logic_Mux_Data
    PORT(
         Sel : IN  std_logic_vector(1 downto 0);
         RS0_Data : IN  std_logic_vector(72 downto 0);
         RS1_Data : IN  std_logic_vector(72 downto 0);
         RS_Logic_Data : OUT  std_logic_vector(72 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Sel : std_logic_vector(1 downto 0) := (others => '0');
   signal RS0_Data : std_logic_vector(72 downto 0) := (others => '0');
   signal RS1_Data : std_logic_vector(72 downto 0) := (others => '0');

 	--Outputs
   signal RS_Logic_Data : std_logic_vector(72 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RS_Logic_Mux_Data PORT MAP (
          Sel => Sel,
          RS0_Data => RS0_Data,
          RS1_Data => RS1_Data,
          RS_Logic_Data => RS_Logic_Data
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
		RS0_Data <= "0111000101111001001110101011110010100000110111000011010101110001001101010";
		RS1_Data <= "1000111010101100110110010111110110101011110111101100111000011111001110111";
		Sel <= "00";
		wait for 10 ns;
		
		RS0_Data <= "0010101111111011010101111100000001010110101001010001011000101100100011000";
		RS1_Data <= "1101100101111000010101001111110001011101011100010101101011010001010100110";
		Sel <= "01";
		wait for 10 ns;
		
		RS0_Data <= "1001000001110110100010111000001111101011110010010100110110000110001001111";
		RS1_Data <= "1101100110011100000001011011011111101001100111100111111011011000100011111";
		Sel <= "10";
		wait for 10 ns;
		
		RS0_Data <= "1111001101010001111000110001110110000000011101011000100101110100110111101";
		RS1_Data <= "1001000111000101101011110100110100110011111100110111001111101010111011100";
		Sel <= "11";
		wait for 10 ns;
      wait;
   end process;
END;