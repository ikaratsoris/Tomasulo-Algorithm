LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_RS_Read_Control IS
END Test_RS_Read_Control;
 
ARCHITECTURE behavior OF Test_RS_Read_Control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS_Read_Control
    PORT(
         Local_Tag : IN  std_logic_vector(4 downto 0);
         RS_Busy : IN  std_logic;
         RS_Op : IN  std_logic_vector(3 downto 0);
         RS_Vj : IN  std_logic_vector(31 downto 0);
         RS_Qj : IN  std_logic_vector(4 downto 0);
         RS_Vk : IN  std_logic_vector(31 downto 0);
         RS_Qk : IN  std_logic_vector(4 downto 0);
         RS_Ready : OUT  std_logic;
         RS_Out : OUT  std_logic_vector(72 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Local_Tag : std_logic_vector(4 downto 0) := (others => '0');
   signal RS_Busy : std_logic := '0';
   signal RS_Op : std_logic_vector(3 downto 0) := (others => '0');
   signal RS_Vj : std_logic_vector(31 downto 0) := (others => '0');
   signal RS_Qj : std_logic_vector(4 downto 0) := (others => '0');
   signal RS_Vk : std_logic_vector(31 downto 0) := (others => '0');
   signal RS_Qk : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal RS_Ready : std_logic;
   signal RS_Out : std_logic_vector(72 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RS_Read_Control PORT MAP (
          Local_Tag => Local_Tag,
          RS_Busy => RS_Busy,
          RS_Op => RS_Op,
          RS_Vj => RS_Vj,
          RS_Qj => RS_Qj,
          RS_Vk => RS_Vk,
          RS_Qk => RS_Qk,
          RS_Ready => RS_Ready,
          RS_Out => RS_Out
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
		Local_Tag <= "00000";
		RS_Vj <= "00000000000000000000000000000000";
		RS_Qj <= "00000";
		RS_Vk <= "00000000000000000000000000000000";
		RS_Qk <= "00000";
		RS_Op <= "0000";
		RS_Busy <= '0';
		wait for 10 ns;
		
		Local_Tag <= "01001";
		RS_Vj <= "00000000000000000000000000000111";
		RS_Qj <= "00001";
		RS_Vk <= "00000000000000000000000001100000";
		RS_Qk <= "00100";
		RS_Op <= "0010";
		RS_Busy <= '0';
		wait for 10 ns;
		
		Local_Tag <= "01001";
		RS_Vj <= "00000000000000000000000000010111";
		RS_Qj <= "00000";
		RS_Vk <= "00000000000000000000000001100010";
		RS_Qk <= "00100";
		RS_Op <= "0010";
		RS_Busy <= '1';
		wait for 10 ns;
		
		Local_Tag <= "01001";
		RS_Vj <= "00000000000000000000000000010101";
		RS_Qj <= "00010";
		RS_Vk <= "00000000000000000000000001100110";
		RS_Qk <= "00000";
		RS_Op <= "0010";
		RS_Busy <= '1';
		wait for 10 ns;
		
		Local_Tag <= "01001";
		RS_Vj <= "00000000000000000000000001010101";
		RS_Qj <= "00000";
		RS_Vk <= "00000000000000000000000000101110";
		RS_Qk <= "00000";
		RS_Op <= "0010";
		RS_Busy <= '1';
		wait for 10 ns;
		
		Local_Tag <= "01001";
		RS_Vj <= "00000000000000000000000000000111";
		RS_Qj <= "00000";
		RS_Vk <= "00000000000000000000000001100000";
		RS_Qk <= "00000";
		RS_Op <= "0010";
		RS_Busy <= '0';
		wait for 10 ns;
		
		Local_Tag <= "01001";
		RS_Vj <= "00000000000000000000000000000101";
		RS_Qj <= "00000";
		RS_Vk <= "00000000000000000000000000100010";
		RS_Qk <= "00000";
		RS_Op <= "0010";
		RS_Busy <= '1';
		wait for 10 ns;
		
		Local_Tag <= "00000";
		RS_Vj <= "00000000000000000000000000000000";
		RS_Qj <= "00000";
		RS_Vk <= "00000000000000000000000000000000";
		RS_Qk <= "00000";
		RS_Op <= "0000";
		RS_Busy <= '0';
		wait for 10 ns;
      wait;
   end process;
END;