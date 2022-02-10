LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_RS_Registers_Module IS
END Test_RS_Registers_Module;
 
ARCHITECTURE behavior OF Test_RS_Registers_Module IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS_Registers_Module
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         Busy_In : IN  std_logic;
         Op_In : IN  std_logic_vector(3 downto 0);
         Vj_In : IN  std_logic_vector(31 downto 0);
         Qj_In : IN  std_logic_vector(4 downto 0);
         Vk_In : IN  std_logic_vector(31 downto 0);
         Qk_In : IN  std_logic_vector(4 downto 0);
         Busy_WE : IN  std_logic;
         Op_WE : IN  std_logic;
         Vj_WE : IN  std_logic;
         Qj_WE : IN  std_logic;
         Vk_WE : IN  std_logic;
         Qk_WE : IN  std_logic;
         Busy_Out : OUT  std_logic;
         Op_Out : OUT  std_logic_vector(3 downto 0);
         Vj_Out : OUT  std_logic_vector(31 downto 0);
         Qj_Out : OUT  std_logic_vector(4 downto 0);
         Vk_Out : OUT  std_logic_vector(31 downto 0);
         Qk_Out : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal Busy_In : std_logic := '0';
   signal Op_In : std_logic_vector(3 downto 0) := (others => '0');
   signal Vj_In : std_logic_vector(31 downto 0) := (others => '0');
   signal Qj_In : std_logic_vector(4 downto 0) := (others => '0');
   signal Vk_In : std_logic_vector(31 downto 0) := (others => '0');
   signal Qk_In : std_logic_vector(4 downto 0) := (others => '0');
   signal Busy_WE : std_logic := '0';
   signal Op_WE : std_logic := '0';
   signal Vj_WE : std_logic := '0';
   signal Qj_WE : std_logic := '0';
   signal Vk_WE : std_logic := '0';
   signal Qk_WE : std_logic := '0';

 	--Outputs
   signal Busy_Out : std_logic;
   signal Op_Out : std_logic_vector(3 downto 0);
   signal Vj_Out : std_logic_vector(31 downto 0);
   signal Qj_Out : std_logic_vector(4 downto 0);
   signal Vk_Out : std_logic_vector(31 downto 0);
   signal Qk_Out : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RS_Registers_Module PORT MAP (
          CLK => CLK,
          RST => RST,
          Busy_In => Busy_In,
          Op_In => Op_In,
          Vj_In => Vj_In,
          Qj_In => Qj_In,
          Vk_In => Vk_In,
          Qk_In => Qk_In,
          Busy_WE => Busy_WE,
          Op_WE => Op_WE,
          Vj_WE => Vj_WE,
          Qj_WE => Qj_WE,
          Vk_WE => Vk_WE,
          Qk_WE => Qk_WE,
          Busy_Out => Busy_Out,
          Op_Out => Op_Out,
          Vj_Out => Vj_Out,
          Qj_Out => Qj_Out,
          Vk_Out => Vk_Out,
          Qk_Out => Qk_Out
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '1';
		wait for CLK_period/2;
		CLK <= '0';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		-- insert stimulus here
		RST <= '0';
		Busy_WE <= '0';
		Busy_In <= '0';
		Op_WE <= '0';
		Op_In <= "0000";
		Vj_WE <= '0';
		Vj_In <= "00000000000000000000000000000000";
		Qj_WE <= '0';
		Qj_In <= "00000";
		Vk_WE <= '0';
		Vk_In <= "00000000000000000000000000000000";
		Qk_WE <= '0';
		Qk_In <= "00000";
      wait for CLK_period;
		
		Busy_WE <= '1';
		Busy_In <= '1';
		Op_WE <= '1';
		Op_In <= "0011";
		Vj_WE <= '1';
		Vj_In <= "00000000000000000000000000000111";
		Qj_WE <= '1';
		Qj_In <= "00010";
		Vk_WE <= '1';
		Vk_In <= "00000000000000000000000000001111";
		Qk_WE <= '1';
		Qk_In <= "00100";
      wait for CLK_period;
		
		Busy_WE <= '1';
		Busy_In <= '0';
		Op_WE <= '1';
		Op_In <= "1100";
		Vj_WE <= '1';
		Vj_In <= "00000000000000001110000000000111";
		Qj_WE <= '1';
		Qj_In <= "10010";
		Vk_WE <= '1';
		Vk_In <= "00000000011000000000000000001111";
		Qk_WE <= '1';
		Qk_In <= "00101";
      wait for CLK_period;
		
		Busy_WE <= '1';
		Busy_In <= '1';
		Op_WE <= '1';
		Op_In <= "1011";
		Vj_WE <= '1';
		Vj_In <= "00000011000000000000000000000111";
		Qj_WE <= '1';
		Qj_In <= "01010";
		Vk_WE <= '1';
		Vk_In <= "00000000000000000000000001101111";
		Qk_WE <= '1';
		Qk_In <= "00111";
      wait for CLK_period;
		
		Busy_WE <= '1';
		Busy_In <= '1';
		Op_WE <= '1';
		Op_In <= "0111";
		Vj_WE <= '1';
		Vj_In <= "11100000000000000000000000000111";
		Qj_WE <= '1';
		Qj_In <= "00100";
		Vk_WE <= '1';
		Vk_In <= "00000000001010000000000000000111";
		Qk_WE <= '1';
		Qk_In <= "11111";
      wait for CLK_period;
		
		Busy_WE <= '0';
		Busy_In <= '0';
		Op_WE <= '0';
		Op_In <= "0000";
		Vj_WE <= '0';
		Vj_In <= "00000000000000000000000000000000";
		Qj_WE <= '0';
		Qj_In <= "00000";
		Vk_WE <= '0';
		Vk_In <= "00000000000000000000000000000000";
		Qk_WE <= '0';
		Qk_In <= "00000";
      wait for CLK_period;
      wait;
   end process;
END;