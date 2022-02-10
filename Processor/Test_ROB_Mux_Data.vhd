LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_ROB_Mux_Data IS
END Test_ROB_Mux_Data;
 
ARCHITECTURE behavior OF Test_ROB_Mux_Data IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROB_Mux_Data
    PORT(
         Sel : IN  std_logic_vector(2 downto 0);
         Value_0 : IN  std_logic_vector(31 downto 0);
         Value_1 : IN  std_logic_vector(31 downto 0);
         Value_2 : IN  std_logic_vector(31 downto 0);
         Value_3 : IN  std_logic_vector(31 downto 0);
         Value_4 : IN  std_logic_vector(31 downto 0);
         Value_5 : IN  std_logic_vector(31 downto 0);
         Value_6 : IN  std_logic_vector(31 downto 0);
         Value_7 : IN  std_logic_vector(31 downto 0);
         Mux_Out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Sel : std_logic_vector(2 downto 0) := (others => '0');
   signal Value_0 : std_logic_vector(31 downto 0) := (others => '0');
   signal Value_1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Value_2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Value_3 : std_logic_vector(31 downto 0) := (others => '0');
   signal Value_4 : std_logic_vector(31 downto 0) := (others => '0');
   signal Value_5 : std_logic_vector(31 downto 0) := (others => '0');
   signal Value_6 : std_logic_vector(31 downto 0) := (others => '0');
   signal Value_7 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Mux_Out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROB_Mux_Data PORT MAP (
          Sel => Sel,
          Value_0 => Value_0,
          Value_1 => Value_1,
          Value_2 => Value_2,
          Value_3 => Value_3,
          Value_4 => Value_4,
          Value_5 => Value_5,
          Value_6 => Value_6,
          Value_7 => Value_7,
          Mux_Out => Mux_Out
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
		Sel <= "000";
		Value_0 <= "11100111000100010010000010001110";
		Value_1 <= "10000001111110010011011110001111";
		Value_2 <= "10000010101001111111010110111010";
		Value_3 <= "01010100111111100011000110100001";
		Value_4 <= "10110101000111100010110010110100";
		Value_5 <= "01101010001101001010001110000000";
		Value_6 <= "01010000000111111111110011101000";
		Value_7 <= "11010001000100110010010110000000";
		wait for 10 ns;
		
		Sel <= "001";
		Value_0 <= "11100111000100010010000010001110";
		Value_1 <= "10000001111110010011011110001111";
		Value_2 <= "10000010101001111111010110111010";
		Value_3 <= "01010100111111100011000110100001";
		Value_4 <= "10110101000111100010110010110100";
		Value_5 <= "01101010001101001010001110000000";
		Value_6 <= "01010000000111111111110011101000";
		Value_7 <= "11010001000100110010010110000000";
		wait for 10 ns;
		
		Sel <= "010";
		Value_0 <= "11100111000100010010000010001110";
		Value_1 <= "10000001111110010011011110001111";
		Value_2 <= "10000010101001111111010110111010";
		Value_3 <= "01010100111111100011000110100001";
		Value_4 <= "10110101000111100010110010110100";
		Value_5 <= "01101010001101001010001110000000";
		Value_6 <= "01010000000111111111110011101000";
		Value_7 <= "11010001000100110010010110000000";
		wait for 10 ns;
		
		Sel <= "011";
		Value_0 <= "11100111000100010010000010001110";
		Value_1 <= "10000001111110010011011110001111";
		Value_2 <= "10000010101001111111010110111010";
		Value_3 <= "01010100111111100011000110100001";
		Value_4 <= "10110101000111100010110010110100";
		Value_5 <= "01101010001101001010001110000000";
		Value_6 <= "01010000000111111111110011101000";
		Value_7 <= "11010001000100110010010110000000";
		wait for 10 ns;
		
		Sel <= "100";
		Value_0 <= "11100111000100010010000010001110";
		Value_1 <= "10000001111110010011011110001111";
		Value_2 <= "10000010101001111111010110111010";
		Value_3 <= "01010100111111100011000110100001";
		Value_4 <= "10110101000111100010110010110100";
		Value_5 <= "01101010001101001010001110000000";
		Value_6 <= "01010000000111111111110011101000";
		Value_7 <= "11010001000100110010010110000000";
		wait for 10 ns;
		
		Sel <= "101";
		Value_0 <= "11100111000100010010000010001110";
		Value_1 <= "10000001111110010011011110001111";
		Value_2 <= "10000010101001111111010110111010";
		Value_3 <= "01010100111111100011000110100001";
		Value_4 <= "10110101000111100010110010110100";
		Value_5 <= "01101010001101001010001110000000";
		Value_6 <= "01010000000111111111110011101000";
		Value_7 <= "11010001000100110010010110000000";
		wait for 10 ns;
		
		Sel <= "110";
		Value_0 <= "11100111000100010010000010001110";
		Value_1 <= "10000001111110010011011110001111";
		Value_2 <= "10000010101001111111010110111010";
		Value_3 <= "01010100111111100011000110100001";
		Value_4 <= "10110101000111100010110010110100";
		Value_5 <= "01101010001101001010001110000000";
		Value_6 <= "01010000000111111111110011101000";
		Value_7 <= "11010001000100110010010110000000";
		wait for 10 ns;
		
		Sel <= "111";
		Value_0 <= "11100111000100010010000010001110";
		Value_1 <= "10000001111110010011011110001111";
		Value_2 <= "10000010101001111111010110111010";
		Value_3 <= "01010100111111100011000110100001";
		Value_4 <= "10110101000111100010110010110100";
		Value_5 <= "01101010001101001010001110000000";
		Value_6 <= "01010000000111111111110011101000";
		Value_7 <= "11010001000100110010010110000000";
		wait for 10 ns;
      wait;
   end process;
END;