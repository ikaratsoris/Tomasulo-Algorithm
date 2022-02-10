LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_ROB_Remove_Control IS
END Test_ROB_Remove_Control;
 
ARCHITECTURE behavior OF Test_ROB_Remove_Control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROB_Remove_Control
    PORT(
         Reset : IN  std_logic;
         Done_0 : IN  std_logic;
         Done_1 : IN  std_logic;
         Done_2 : IN  std_logic;
         Done_3 : IN  std_logic;
         Done_4 : IN  std_logic;
         Done_5 : IN  std_logic;
         Done_6 : IN  std_logic;
         Done_7 : IN  std_logic;
         Remove_0 : OUT  std_logic;
         Remove_1 : OUT  std_logic;
         Remove_2 : OUT  std_logic;
         Remove_3 : OUT  std_logic;
         Remove_4 : OUT  std_logic;
         Remove_5 : OUT  std_logic;
         Remove_6 : OUT  std_logic;
         Remove_7 : OUT  std_logic;
         Head_FIFO_Out : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Done_0 : std_logic := '0';
   signal Done_1 : std_logic := '0';
   signal Done_2 : std_logic := '0';
   signal Done_3 : std_logic := '0';
   signal Done_4 : std_logic := '0';
   signal Done_5 : std_logic := '0';
   signal Done_6 : std_logic := '0';
   signal Done_7 : std_logic := '0';

 	--Outputs
   signal Remove_0 : std_logic;
   signal Remove_1 : std_logic;
   signal Remove_2 : std_logic;
   signal Remove_3 : std_logic;
   signal Remove_4 : std_logic;
   signal Remove_5 : std_logic;
   signal Remove_6 : std_logic;
   signal Remove_7 : std_logic;
   signal Head_FIFO_Out : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROB_Remove_Control PORT MAP (
          Reset => Reset,
          Done_0 => Done_0,
          Done_1 => Done_1,
          Done_2 => Done_2,
          Done_3 => Done_3,
          Done_4 => Done_4,
          Done_5 => Done_5,
          Done_6 => Done_6,
          Done_7 => Done_7,
          Remove_0 => Remove_0,
          Remove_1 => Remove_1,
          Remove_2 => Remove_2,
          Remove_3 => Remove_3,
          Remove_4 => Remove_4,
          Remove_5 => Remove_5,
          Remove_6 => Remove_6,
          Remove_7 => Remove_7,
          Head_FIFO_Out => Head_FIFO_Out
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
		Done_0 <= '0';
		Done_1 <= '0';
		Done_2 <= '0';
		Done_3 <= '0';
		Done_4 <= '0';
		Done_5 <= '0';
		Done_6 <= '0';
		Done_7 <= '0';
		wait for 10 ns;
		
		Reset <= '0';
		Done_0 <= '1';
		Done_1 <= '0';
		Done_2 <= '0';
		Done_3 <= '0';
		Done_4 <= '0';
		Done_5 <= '0';
		Done_6 <= '0';
		Done_7 <= '0';
		wait for 10 ns;
		
		Reset <= '0';
		Done_0 <= '0';
		Done_1 <= '0';
		Done_2 <= '0';
		Done_3 <= '0';
		Done_4 <= '0';
		Done_5 <= '0';
		Done_6 <= '0';
		Done_7 <= '0';
		wait for 10 ns;
		
		Reset <= '0';
		Done_0 <= '0';
		Done_1 <= '1';
		Done_2 <= '0';
		Done_3 <= '0';
		Done_4 <= '0';
		Done_5 <= '0';
		Done_6 <= '0';
		Done_7 <= '0';
		wait for 10 ns;
		
		Reset <= '0';
		Done_0 <= '0';
		Done_1 <= '0';
		Done_2 <= '0';
		Done_3 <= '0';
		Done_4 <= '0';
		Done_5 <= '0';
		Done_6 <= '0';
		Done_7 <= '0';
		wait for 10 ns;
		
		Reset <= '0';
		Done_0 <= '0';
		Done_1 <= '0';
		Done_2 <= '1';
		Done_3 <= '0';
		Done_4 <= '0';
		Done_5 <= '0';
		Done_6 <= '0';
		Done_7 <= '0';
		wait for 10 ns;
		
		Reset <= '0';
		Done_0 <= '0';
		Done_1 <= '0';
		Done_2 <= '0';
		Done_3 <= '0';
		Done_4 <= '0';
		Done_5 <= '0';
		Done_6 <= '0';
		Done_7 <= '0';
		wait for 10 ns;
		
		Reset <= '0';
		Done_0 <= '0';
		Done_1 <= '0';
		Done_2 <= '0';
		Done_3 <= '1';
		Done_4 <= '0';
		Done_5 <= '0';
		Done_6 <= '0';
		Done_7 <= '0';
		wait for 10 ns;
		
		Reset <= '0';
		Done_0 <= '0';
		Done_1 <= '0';
		Done_2 <= '0';
		Done_3 <= '0';
		Done_4 <= '0';
		Done_5 <= '0';
		Done_6 <= '0';
		Done_7 <= '0';
		wait for 10 ns;
		
		Reset <= '0';
		Done_0 <= '0';
		Done_1 <= '0';
		Done_2 <= '0';
		Done_3 <= '0';
		Done_4 <= '1';
		Done_5 <= '0';
		Done_6 <= '0';
		Done_7 <= '0';
		wait for 10 ns;
		
		Reset <= '0';
		Done_0 <= '0';
		Done_1 <= '0';
		Done_2 <= '0';
		Done_3 <= '0';
		Done_4 <= '0';
		Done_5 <= '0';
		Done_6 <= '0';
		Done_7 <= '0';
		wait for 10 ns;
		
		Reset <= '0';
		Done_0 <= '0';
		Done_1 <= '0';
		Done_2 <= '0';
		Done_3 <= '0';
		Done_4 <= '0';
		Done_5 <= '1';
		Done_6 <= '0';
		Done_7 <= '0';
		wait for 10 ns;
		
		Reset <= '0';
		Done_0 <= '0';
		Done_1 <= '0';
		Done_2 <= '0';
		Done_3 <= '0';
		Done_4 <= '0';
		Done_5 <= '0';
		Done_6 <= '0';
		Done_7 <= '0';
		wait for 10 ns;
		
		Reset <= '0';
		Done_0 <= '0';
		Done_1 <= '0';
		Done_2 <= '0';
		Done_3 <= '0';
		Done_4 <= '0';
		Done_5 <= '0';
		Done_6 <= '1';
		Done_7 <= '0';
		wait for 10 ns;
		
		Reset <= '0';
		Done_0 <= '0';
		Done_1 <= '0';
		Done_2 <= '0';
		Done_3 <= '0';
		Done_4 <= '0';
		Done_5 <= '0';
		Done_6 <= '0';
		Done_7 <= '0';
		wait for 10 ns;
		
		Reset <= '0';
		Done_0 <= '0';
		Done_1 <= '0';
		Done_2 <= '0';
		Done_3 <= '0';
		Done_4 <= '0';
		Done_5 <= '0';
		Done_6 <= '0';
		Done_7 <= '1';
		wait for 10 ns;
		
		Reset <= '0';
		Done_0 <= '0';
		Done_1 <= '0';
		Done_2 <= '0';
		Done_3 <= '0';
		Done_4 <= '0';
		Done_5 <= '0';
		Done_6 <= '0';
		Done_7 <= '0';
		wait for 10 ns;
      wait;
   end process;
END;