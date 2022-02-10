LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_CDB_Mux_Data IS
END Test_CDB_Mux_Data;
 
ARCHITECTURE behavior OF Test_CDB_Mux_Data IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CDB_Mux_Data
    PORT(
         Sel : IN  std_logic_vector(1 downto 0);
         Arith_Data : IN  std_logic_vector(31 downto 0);
         Logic_Data : IN  std_logic_vector(31 downto 0);
         LS_Data : IN  std_logic_vector(31 downto 0);
         Mux_Data_Out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Sel : std_logic_vector(1 downto 0) := (others => '0');
   signal Arith_Data : std_logic_vector(31 downto 0) := (others => '0');
   signal Logic_Data : std_logic_vector(31 downto 0) := (others => '0');
   signal LS_Data : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Mux_Data_Out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CDB_Mux_Data PORT MAP (
          Sel => Sel,
          Arith_Data => Arith_Data,
          Logic_Data => Logic_Data,
          LS_Data => LS_Data,
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
		Sel <= "00";
		Arith_Data <= "11101011100010100011001101110000";
		Logic_Data <= "11111101000101001101110011000111";
		LS_Data <= "10111110000111010000111010110011";
		wait for 10 ns;
		
		Sel <= "01";
		Arith_Data <= "11111001100110000110000000010011";
		Logic_Data <= "01010111000001001000011011111111";
		LS_Data <= "00001101010001111111000001110001";
		wait for 10 ns;
		
		Sel <= "10";
		Arith_Data <= "00110000001011111000011011110100";
		Logic_Data <= "11100111011100011111011001010010";
		LS_Data <= "00111110101110010011010100010001";
		wait for 10 ns;
		
		Sel <= "11";
		Arith_Data <= "01001011100100111000110001100011";
		Logic_Data <= "01110010000011011010101110110100";
		LS_Data <= "01101010011001100111000101001110";
		wait for 10 ns;
		
		Sel <= "01";
		Arith_Data <= "11100111011001000011001000101110";
		Logic_Data <= "11010110110101111011100101000101";
		LS_Data <= "00110110101010101011110101001000";
		wait for 10 ns;
		
		Sel <= "00";
		Arith_Data <= "10110001110001110100001100011101";
		Logic_Data <= "00101100001100000100110110110011";
		LS_Data <= "10001101101011011010011010110111";
		wait for 10 ns;
      wait;
   end process;
END;