LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_ROB_Mux_Tag IS
END Test_ROB_Mux_Tag;
 
ARCHITECTURE behavior OF Test_ROB_Mux_Tag IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROB_Mux_Tag
    PORT(
         Sel : IN  std_logic_vector(2 downto 0);
         Tag_0 : IN  std_logic_vector(4 downto 0);
         Tag_1 : IN  std_logic_vector(4 downto 0);
         Tag_2 : IN  std_logic_vector(4 downto 0);
         Tag_3 : IN  std_logic_vector(4 downto 0);
         Tag_4 : IN  std_logic_vector(4 downto 0);
         Tag_5 : IN  std_logic_vector(4 downto 0);
         Tag_6 : IN  std_logic_vector(4 downto 0);
         Tag_7 : IN  std_logic_vector(4 downto 0);
         Mux_Out : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Sel : std_logic_vector(2 downto 0) := (others => '0');
   signal Tag_0 : std_logic_vector(4 downto 0) := (others => '0');
   signal Tag_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Tag_2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Tag_3 : std_logic_vector(4 downto 0) := (others => '0');
   signal Tag_4 : std_logic_vector(4 downto 0) := (others => '0');
   signal Tag_5 : std_logic_vector(4 downto 0) := (others => '0');
   signal Tag_6 : std_logic_vector(4 downto 0) := (others => '0');
   signal Tag_7 : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal Mux_Out : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROB_Mux_Tag PORT MAP (
          Sel => Sel,
          Tag_0 => Tag_0,
          Tag_1 => Tag_1,
          Tag_2 => Tag_2,
          Tag_3 => Tag_3,
          Tag_4 => Tag_4,
          Tag_5 => Tag_5,
          Tag_6 => Tag_6,
          Tag_7 => Tag_7,
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
		Tag_0 <= "10000";
		Tag_1 <= "10001";
		Tag_2 <= "10011";
		Tag_3 <= "10100";
		Tag_4 <= "11111";
		Tag_5 <= "11001";
		Tag_6 <= "10110";
		Tag_7 <= "10111";
		wait for 10 ns;
		
		Sel <= "001";
		Tag_0 <= "10000";
		Tag_1 <= "10001";
		Tag_2 <= "10011";
		Tag_3 <= "10100";
		Tag_4 <= "11111";
		Tag_5 <= "11001";
		Tag_6 <= "10110";
		Tag_7 <= "10111";
		wait for 10 ns;
		
		Sel <= "010";
		Tag_0 <= "10000";
		Tag_1 <= "10001";
		Tag_2 <= "10011";
		Tag_3 <= "10100";
		Tag_4 <= "11111";
		Tag_5 <= "11001";
		Tag_6 <= "10110";
		Tag_7 <= "10111";
		wait for 10 ns;
		
		Sel <= "011";
		Tag_0 <= "10000";
		Tag_1 <= "10001";
		Tag_2 <= "10011";
		Tag_3 <= "10100";
		Tag_4 <= "11111";
		Tag_5 <= "11001";
		Tag_6 <= "10110";
		Tag_7 <= "10111";
		wait for 10 ns;
		
		Sel <= "100";
		Tag_0 <= "10000";
		Tag_1 <= "10001";
		Tag_2 <= "10011";
		Tag_3 <= "10100";
		Tag_4 <= "11111";
		Tag_5 <= "11001";
		Tag_6 <= "10110";
		Tag_7 <= "10111";
		wait for 10 ns;
		
		Sel <= "101";
		Tag_0 <= "10000";
		Tag_1 <= "10001";
		Tag_2 <= "10011";
		Tag_3 <= "10100";
		Tag_4 <= "11111";
		Tag_5 <= "11001";
		Tag_6 <= "10110";
		Tag_7 <= "10111";
		wait for 10 ns;
		
		Sel <= "110";
		Tag_0 <= "10000";
		Tag_1 <= "10001";
		Tag_2 <= "10011";
		Tag_3 <= "10100";
		Tag_4 <= "11111";
		Tag_5 <= "11001";
		Tag_6 <= "10110";
		Tag_7 <= "10111";
		wait for 10 ns;
		
		Sel <= "111";
		Tag_0 <= "10000";
		Tag_1 <= "10001";
		Tag_2 <= "10011";
		Tag_3 <= "10100";
		Tag_4 <= "11111";
		Tag_5 <= "11001";
		Tag_6 <= "10110";
		Tag_7 <= "10111";
		wait for 10 ns;
      wait;
   end process;
END;