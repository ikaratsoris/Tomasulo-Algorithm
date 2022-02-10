LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_ROB_Mux_Control IS
END Test_ROB_Mux_Control;
 
ARCHITECTURE behavior OF Test_ROB_Mux_Control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROB_Mux_Control
    PORT(
         Tail_FIFO : IN  std_logic_vector(2 downto 0);
         Valid_Bit_0 : IN  std_logic;
         Valid_Bit_1 : IN  std_logic;
         Valid_Bit_2 : IN  std_logic;
         Valid_Bit_3 : IN  std_logic;
         Valid_Bit_4 : IN  std_logic;
         Valid_Bit_5 : IN  std_logic;
         Valid_Bit_6 : IN  std_logic;
         Valid_Bit_7 : IN  std_logic;
         Mux_Sel_Reg_ROB : OUT  std_logic_vector(2 downto 0);
         MUX_Sel_ROB_MEM : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Tail_FIFO : std_logic_vector(2 downto 0) := (others => '0');
   signal Valid_Bit_0 : std_logic := '0';
   signal Valid_Bit_1 : std_logic := '0';
   signal Valid_Bit_2 : std_logic := '0';
   signal Valid_Bit_3 : std_logic := '0';
   signal Valid_Bit_4 : std_logic := '0';
   signal Valid_Bit_5 : std_logic := '0';
   signal Valid_Bit_6 : std_logic := '0';
   signal Valid_Bit_7 : std_logic := '0';

 	--Outputs
   signal Mux_Sel_Reg_ROB : std_logic_vector(2 downto 0);
   signal MUX_Sel_ROB_MEM : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROB_Mux_Control PORT MAP (
          Tail_FIFO => Tail_FIFO,
          Valid_Bit_0 => Valid_Bit_0,
          Valid_Bit_1 => Valid_Bit_1,
          Valid_Bit_2 => Valid_Bit_2,
          Valid_Bit_3 => Valid_Bit_3,
          Valid_Bit_4 => Valid_Bit_4,
          Valid_Bit_5 => Valid_Bit_5,
          Valid_Bit_6 => Valid_Bit_6,
          Valid_Bit_7 => Valid_Bit_7,
          Mux_Sel_Reg_ROB => Mux_Sel_Reg_ROB,
          MUX_Sel_ROB_MEM => MUX_Sel_ROB_MEM
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
		Tail_FIFO <= "000";
		Valid_Bit_0 <= '0';
		Valid_Bit_1 <= '0';
		Valid_Bit_2 <= '0';
		Valid_Bit_3 <= '0';
		Valid_Bit_4 <= '0';
		Valid_Bit_5 <= '0';
		Valid_Bit_6 <= '0';
		Valid_Bit_7 <= '0';
		wait for 10 ns;
		
		Tail_FIFO <= "001";
		Valid_Bit_0 <= '0';
		Valid_Bit_1 <= '1';
		Valid_Bit_2 <= '0';
		Valid_Bit_3 <= '1';
		Valid_Bit_4 <= '0';
		Valid_Bit_5 <= '0';
		Valid_Bit_6 <= '1';
		Valid_Bit_7 <= '0';
		wait for 10 ns;
		
		Tail_FIFO <= "010";
		Valid_Bit_0 <= '1';
		Valid_Bit_1 <= '0';
		Valid_Bit_2 <= '1';
		Valid_Bit_3 <= '0';
		Valid_Bit_4 <= '1';
		Valid_Bit_5 <= '0';
		Valid_Bit_6 <= '1';
		Valid_Bit_7 <= '0';
		wait for 10 ns;
		
		Tail_FIFO <= "011";
		Valid_Bit_0 <= '1';
		Valid_Bit_1 <= '1';
		Valid_Bit_2 <= '1';
		Valid_Bit_3 <= '1';
		Valid_Bit_4 <= '1';
		Valid_Bit_5 <= '1';
		Valid_Bit_6 <= '1';
		Valid_Bit_7 <= '1';
		wait for 10 ns;
		
		Tail_FIFO <= "100";
		Valid_Bit_0 <= '1';
		Valid_Bit_1 <= '0';
		Valid_Bit_2 <= '1';
		Valid_Bit_3 <= '0';
		Valid_Bit_4 <= '1';
		Valid_Bit_5 <= '0';
		Valid_Bit_6 <= '1';
		Valid_Bit_7 <= '0';
		wait for 10 ns;
		
		Tail_FIFO <= "000";
		Valid_Bit_0 <= '0';
		Valid_Bit_1 <= '0';
		Valid_Bit_2 <= '0';
		Valid_Bit_3 <= '0';
		Valid_Bit_4 <= '0';
		Valid_Bit_5 <= '0';
		Valid_Bit_6 <= '0';
		Valid_Bit_7 <= '0';
		wait for 10 ns;
      wait;
   end process;
END;