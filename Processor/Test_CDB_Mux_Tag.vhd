LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_CDB_Mux_Tag IS
END Test_CDB_Mux_Tag;
 
ARCHITECTURE behavior OF Test_CDB_Mux_Tag IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CDB_Mux_Tag
    PORT(
         Sel : IN  std_logic_vector(1 downto 0);
         Arith_Tag : IN  std_logic_vector(4 downto 0);
         Logic_Tag : IN  std_logic_vector(4 downto 0);
         LS_Tag : IN  std_logic_vector(4 downto 0);
         Mux_Tag_Out : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Sel : std_logic_vector(1 downto 0) := (others => '0');
   signal Arith_Tag : std_logic_vector(4 downto 0) := (others => '0');
   signal Logic_Tag : std_logic_vector(4 downto 0) := (others => '0');
   signal LS_Tag : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal Mux_Tag_Out : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CDB_Mux_Tag PORT MAP (
          Sel => Sel,
          Arith_Tag => Arith_Tag,
          Logic_Tag => Logic_Tag,
          LS_Tag => LS_Tag,
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
		Sel <= "00";
		Arith_Tag <= "01100";
		Logic_Tag <= "01011";
		LS_Tag <= "10001";
		wait for 10 ns;
		
		Sel <= "01";
		Arith_Tag <= "00110";
		Logic_Tag <= "00010";
		LS_Tag <= "00101";
		wait for 10 ns;
		
		Sel <= "10";
		Arith_Tag <= "11001";
		Logic_Tag <= "11000";
		LS_Tag <= "01110";
		wait for 10 ns;
		
		Sel <= "11";
		Arith_Tag <= "01010";
		Logic_Tag <= "01001";
		LS_Tag <= "10001";
		wait for 10 ns;
		
		Sel <= "01";
		Arith_Tag <= "10101";
		Logic_Tag <= "00011";
		LS_Tag <= "11001";
		wait for 10 ns;
		
		Sel <= "00";
		Arith_Tag <= "01110";
		Logic_Tag <= "10001";
		LS_Tag <= "10111";
		wait for 10 ns;
      wait;
   end process;
END;