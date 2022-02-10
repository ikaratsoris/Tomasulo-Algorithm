LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_ROB_Insert_Control IS
END Test_ROB_Insert_Control;
 
ARCHITECTURE behavior OF Test_ROB_Insert_Control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROB_Insert_Control
    PORT(
         Reset : IN  std_logic;
         Issue_WrEn : IN  std_logic;
         Issue_Tag : IN  std_logic_vector(4 downto 0);
         Insert_0 : OUT  std_logic;
         Insert_1 : OUT  std_logic;
         Insert_2 : OUT  std_logic;
         Insert_3 : OUT  std_logic;
         Insert_4 : OUT  std_logic;
         Insert_5 : OUT  std_logic;
         Insert_6 : OUT  std_logic;
         Insert_7 : OUT  std_logic;
         Tail_FIFO_Out : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Issue_WrEn : std_logic := '0';
   signal Issue_Tag : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal Insert_0 : std_logic;
   signal Insert_1 : std_logic;
   signal Insert_2 : std_logic;
   signal Insert_3 : std_logic;
   signal Insert_4 : std_logic;
   signal Insert_5 : std_logic;
   signal Insert_6 : std_logic;
   signal Insert_7 : std_logic;
   signal Tail_FIFO_Out : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROB_Insert_Control PORT MAP (
          Reset => Reset,
          Issue_WrEn => Issue_WrEn,
          Issue_Tag => Issue_Tag,
          Insert_0 => Insert_0,
          Insert_1 => Insert_1,
          Insert_2 => Insert_2,
          Insert_3 => Insert_3,
          Insert_4 => Insert_4,
          Insert_5 => Insert_5,
          Insert_6 => Insert_6,
          Insert_7 => Insert_7,
          Tail_FIFO_Out => Tail_FIFO_Out
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
		Issue_WrEn <= '0';
		Issue_Tag <= "00000";
		wait for 10 ns;
		
		Reset <= '0';
		Issue_WrEn <= '1';
		Issue_Tag <= "01001";
		wait for 10 ns;
		
		Reset <= '0';
		Issue_WrEn <= '1';
		Issue_Tag <= "01010";
		wait for 10 ns;
		
		Reset <= '0';
		Issue_WrEn <= '1';
		Issue_Tag <= "01011";
		wait for 10 ns;
		
		Reset <= '0';
		Issue_WrEn <= '1';
		Issue_Tag <= "00001";
		wait for 10 ns;
		
		Reset <= '0';
		Issue_WrEn <= '1';
		Issue_Tag <= "00010";
		wait for 10 ns;
		
		Reset <= '0';
		Issue_WrEn <= '0';
		Issue_Tag <= "00000";
		wait for 10 ns;
		
		Reset <= '0';
		Issue_WrEn <= '1';
		Issue_Tag <= "01100";
		wait for 10 ns;
		
		Reset <= '0';
		Issue_WrEn <= '0';
		Issue_Tag <= "00000";
		wait for 10 ns;
		
		Reset <= '0';
		Issue_WrEn <= '1';
		Issue_Tag <= "00011";
		wait for 10 ns;
		
		Reset <= '0';
		Issue_WrEn <= '0';
		Issue_Tag <= "00000";
		wait for 10 ns;
		
		Reset <= '0';
		Issue_WrEn <= '1';
		Issue_Tag <= "10011";
		wait for 10 ns;
		
		Reset <= '0';
		Issue_WrEn <= '0';
		Issue_Tag <= "00000";
		wait for 10 ns;
      wait;
   end process;
END;