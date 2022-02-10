LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_RS_Q_Ready IS
END Test_RS_Q_Ready;
 
ARCHITECTURE behavior OF Test_RS_Q_Ready IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS_Q_Ready
    PORT(
         Reset : IN  std_logic;
         Local_Tag : IN  std_logic_vector(4 downto 0);
         WrEn_Busy : IN  std_logic;
         WrEn_Qj : IN  std_logic;
         WrEn_Qk : IN  std_logic;
         Input_Busy : IN  std_logic;
         Input_Qj : IN  std_logic_vector(4 downto 0);
         Input_Qk : IN  std_logic_vector(4 downto 0);
         RS_Ready : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Local_Tag : std_logic_vector(4 downto 0) := (others => '0');
   signal WrEn_Busy : std_logic := '0';
   signal WrEn_Qj : std_logic := '0';
   signal WrEn_Qk : std_logic := '0';
   signal Input_Busy : std_logic := '0';
   signal Input_Qj : std_logic_vector(4 downto 0) := (others => '0');
   signal Input_Qk : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal RS_Ready : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RS_Q_Ready PORT MAP (
          Reset => Reset,
          Local_Tag => Local_Tag,
          WrEn_Busy => WrEn_Busy,
          WrEn_Qj => WrEn_Qj,
          WrEn_Qk => WrEn_Qk,
          Input_Busy => Input_Busy,
          Input_Qj => Input_Qj,
          Input_Qk => Input_Qk,
          RS_Ready => RS_Ready
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
		Reset <= '1';
		WrEn_Busy <= '0';
		Input_Busy <= '0';
		WrEn_Qj <= '0';
		WrEn_Qk <= '0';
		Local_Tag <= "01001";
		Input_Qj <= "00000";
		Input_Qk <= "00000";
		wait for 10 ns;
		
		Reset <= '0';
		WrEn_Busy <= '0';
		Input_Busy <= '0';
		WrEn_Qj <= '0';
		WrEn_Qk <= '0';
		Local_Tag <= "01001";
		Input_Qj <= "00000";
		Input_Qk <= "00000";
		wait for 10 ns;
		
		Reset <= '0';
		WrEn_Busy <= '0';
		Input_Busy <= '0';
		WrEn_Qj <= '1';
		WrEn_Qk <= '1';
		Local_Tag <= "01001";
		Input_Qj <= "00001";
		Input_Qk <= "00010";
		wait for 10 ns;
		
		Reset <= '0';
		WrEn_Busy <= '0';
		Input_Busy <= '0';
		WrEn_Qj <= '1';
		WrEn_Qk <= '1';
		Local_Tag <= "01001";
		Input_Qj <= "00000";
		Input_Qk <= "00000";
		wait for 10 ns;
		
		Reset <= '0';
		WrEn_Busy <= '1';
		Input_Busy <= '0';
		WrEn_Qj <= '0';
		WrEn_Qk <= '0';
		Local_Tag <= "01001";
		Input_Qj <= "00000";
		Input_Qk <= "00000";
		wait for 10 ns;
		
		Reset <= '0';
		WrEn_Busy <= '0';
		Input_Busy <= '0';
		WrEn_Qj <= '1';
		WrEn_Qk <= '0';
		Local_Tag <= "01001";
		Input_Qj <= "00010";
		Input_Qk <= "00000";
		wait for 10 ns;
		
		Reset <= '0';
		WrEn_Busy <= '0';
		Input_Busy <= '0';
		WrEn_Qj <= '1';
		WrEn_Qk <= '0';
		Local_Tag <= "01001";
		Input_Qj <= "00000";
		Input_Qk <= "00000";
		wait for 10 ns;
		
		Reset <= '0';
		WrEn_Busy <= '0';
		Input_Busy <= '0';
		WrEn_Qj <= '0';
		WrEn_Qk <= '1';
		Local_Tag <= "01001";
		Input_Qj <= "00000";
		Input_Qk <= "00010";
		wait for 10 ns;
		
		Reset <= '0';
		WrEn_Busy <= '0';
		Input_Busy <= '0';
		WrEn_Qj <= '0';
		WrEn_Qk <= '1';
		Local_Tag <= "01001";
		Input_Qj <= "00000";
		Input_Qk <= "00000";
		wait for 10 ns;
		
		Reset <= '1';
		WrEn_Busy <= '0';
		Input_Busy <= '0';
		WrEn_Qj <= '0';
		WrEn_Qk <= '0';
		Local_Tag <= "01001";
		Input_Qj <= "00000";
		Input_Qk <= "00000";
		wait for 10 ns;
		
		Reset <= '0';
		WrEn_Busy <= '0';
		Input_Busy <= '0';
		WrEn_Qj <= '0';
		WrEn_Qk <= '0';
		Local_Tag <= "01001";
		Input_Qj <= "00000";
		Input_Qk <= "00000";
		wait for 10 ns;
      wait;
   end process;
END;