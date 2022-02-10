LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_RS_Write_Control IS
END Test_RS_Write_Control;
 
ARCHITECTURE behavior OF Test_RS_Write_Control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS_Write_Control
    PORT(
         RS_WE : IN  std_logic;
         Local_Tag : IN  std_logic_vector(4 downto 0);
         CDB_V : IN  std_logic_vector(31 downto 0);
         CDB_Q : IN  std_logic_vector(4 downto 0);
         Issue_Op : IN  std_logic_vector(3 downto 0);
         Issue_Tag : IN  std_logic_vector(4 downto 0);
         RF_Vj : IN  std_logic_vector(31 downto 0);
         RF_Qj : IN  std_logic_vector(4 downto 0);
         RF_Vk : IN  std_logic_vector(31 downto 0);
         RF_Qk : IN  std_logic_vector(4 downto 0);
         RS_Qj : IN  std_logic_vector(4 downto 0);
         RS_Qk : IN  std_logic_vector(4 downto 0);
         WE_Busy : OUT  std_logic;
         WE_Op : OUT  std_logic;
         WE_Vj : OUT  std_logic;
         WE_Qj : OUT  std_logic;
         WE_Vk : OUT  std_logic;
         WE_Qk : OUT  std_logic;
         Busy : OUT  std_logic;
         Op : OUT  std_logic_vector(3 downto 0);
         Vj : OUT  std_logic_vector(31 downto 0);
         Qj : OUT  std_logic_vector(4 downto 0);
         Vk : OUT  std_logic_vector(31 downto 0);
         Qk : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RS_WE : std_logic := '0';
   signal Local_Tag : std_logic_vector(4 downto 0) := (others => '0');
   signal CDB_V : std_logic_vector(31 downto 0) := (others => '0');
   signal CDB_Q : std_logic_vector(4 downto 0) := (others => '0');
   signal Issue_Op : std_logic_vector(3 downto 0) := (others => '0');
   signal Issue_Tag : std_logic_vector(4 downto 0) := (others => '0');
   signal RF_Vj : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_Qj : std_logic_vector(4 downto 0) := (others => '0');
   signal RF_Vk : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_Qk : std_logic_vector(4 downto 0) := (others => '0');
   signal RS_Qj : std_logic_vector(4 downto 0) := (others => '0');
   signal RS_Qk : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal WE_Busy : std_logic;
   signal WE_Op : std_logic;
   signal WE_Vj : std_logic;
   signal WE_Qj : std_logic;
   signal WE_Vk : std_logic;
   signal WE_Qk : std_logic;
   signal Busy : std_logic;
   signal Op : std_logic_vector(3 downto 0);
   signal Vj : std_logic_vector(31 downto 0);
   signal Qj : std_logic_vector(4 downto 0);
   signal Vk : std_logic_vector(31 downto 0);
   signal Qk : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RS_Write_Control PORT MAP (
          RS_WE => RS_WE,
          Local_Tag => Local_Tag,
          CDB_V => CDB_V,
          CDB_Q => CDB_Q,
          Issue_Op => Issue_Op,
          Issue_Tag => Issue_Tag,
          RF_Vj => RF_Vj,
          RF_Qj => RF_Qj,
          RF_Vk => RF_Vk,
          RF_Qk => RF_Qk,
          RS_Qj => RS_Qj,
          RS_Qk => RS_Qk,
          WE_Busy => WE_Busy,
          WE_Op => WE_Op,
          WE_Vj => WE_Vj,
          WE_Qj => WE_Qj,
          WE_Vk => WE_Vk,
          WE_Qk => WE_Qk,
          Busy => Busy,
          Op => Op,
          Vj => Vj,
          Qj => Qj,
          Vk => Vk,
          Qk => Qk
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
		RS_WE <= '0';
		Local_Tag <= "00000";
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_Op <= "0000";
		Issue_Tag <= "00000";
		RF_Vj <= "00000000000000000000000000000000";
		RF_Qj <= "00000";
		RF_Vk <= "00000000000000000000000000000000";
		RF_Qk <= "00000";
		RS_Qj <= "00000";
		RS_Qk <= "00000";
		wait for 10 ns;
		
		RS_WE <= '1';
		Local_Tag <= "01001";
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_Op <= "0001";
		Issue_Tag <= "01001";
		RF_Vj <= "00000000000000000000000000000011";
		RF_Qj <= "00010";
		RF_Vk <= "00000000000000000000000000000100";
		RF_Qk <= "00100";
		RS_Qj <= "00000";
		RS_Qk <= "00000";
		wait for 10 ns;
		
		RS_WE <= '1';
		Local_Tag <= "01001";
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_Op <= "0011";
		Issue_Tag <= "01001";
		RF_Vj <= "00000000000000000000000000001011";
		RF_Qj <= "00111";
		RF_Vk <= "00000000000000000000000000010100";
		RF_Qk <= "01100";
		RS_Qj <= "00010";
		RS_Qk <= "00100";
		wait for 10 ns;
		
		RS_WE <= '1';
		Local_Tag <= "01001";
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_Op <= "0001";
		Issue_Tag <= "01001";
		RF_Vj <= "00000000000000000000000000001110";
		RF_Qj <= "01110";
		RF_Vk <= "00000000000000000000000000011000";
		RF_Qk <= "00101";
		RS_Qj <= "00111";
		RS_Qk <= "01100";
		wait for 10 ns;
		
		RS_WE <= '1';
		Local_Tag <= "01001";
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_Op <= "0001";
		Issue_Tag <= "01001";
		RF_Vj <= "00000000000000000000000000001110";
		RF_Qj <= "01110";
		RF_Vk <= "00000000000000000000000000011000";
		RF_Qk <= "00101";
		RS_Qj <= "01110";
		RS_Qk <= "00101";
		wait for 10 ns;
		
		RS_WE <= '1';
		Local_Tag <= "01001";
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_Op <= "0011";
		Issue_Tag <= "01001";
		RF_Vj <= "00000000000000000000000000001100";
		RF_Qj <= "00010";
		RF_Vk <= "00000000000000000000000000001001";
		RF_Qk <= "00011";
		RS_Qj <= "01110";
		RS_Qk <= "00101";
		wait for 10 ns;
		
		RS_WE <= '0';
		Local_Tag <= "01001";
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_Op <= "0010";
		Issue_Tag <= "01001";
		RF_Vj <= "00000000000000000000000000001000";
		RF_Qj <= "00011";
		RF_Vk <= "00000000000000000000000000011000";
		RF_Qk <= "00111";
		RS_Qj <= "00010";
		RS_Qk <= "00011";
		wait for 10 ns;
		
		RS_WE <= '0';
		Local_Tag <= "01001";
		CDB_V <= "00000000000000000000000000001000";
		CDB_Q <= "00010";
		Issue_Op <= "0001";
		Issue_Tag <= "01001";
		RF_Vj <= "00000000000000000000000000001110";
		RF_Qj <= "01110";
		RF_Vk <= "00000000000000000000000000011000";
		RF_Qk <= "00101";
		RS_Qj <= "00010";
		RS_Qk <= "00011";
		wait for 10 ns;
		
		RS_WE <= '0';
		Local_Tag <= "01001";
		CDB_V <= "00000000000000000000000000010001";
		CDB_Q <= "00011";
		Issue_Op <= "0001";
		Issue_Tag <= "01001";
		RF_Vj <= "00000000000000000000000000001110";
		RF_Qj <= "01110";
		RF_Vk <= "00000000000000000000000000011000";
		RF_Qk <= "00101";
		RS_Qj <= "00000";
		RS_Qk <= "00011";
		wait for 10 ns;
		
		RS_WE <= '1';
		Local_Tag <= "01001";
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_Op <= "0011";
		Issue_Tag <= "01001";
		RF_Vj <= "00000000000000000000000000001100";
		RF_Qj <= "00010";
		RF_Vk <= "00000000000000000000000000001001";
		RF_Qk <= "00011";
		RS_Qj <= "00000";
		RS_Qk <= "00000";
		wait for 10 ns;
		
		RS_WE <= '1';
		Local_Tag <= "01001";
		CDB_V <= "00000000000000000000000000001110";
		CDB_Q <= "01101";
		Issue_Op <= "0011";
		Issue_Tag <= "01001";
		RF_Vj <= "00000000000000000000000000001100";
		RF_Qj <= "00100";
		RF_Vk <= "00000000000000000000000000001001";
		RF_Qk <= "01101";
		RS_Qj <= "00010";
		RS_Qk <= "00011";
		wait for 10 ns;
		
		RS_WE <= '1';
		Local_Tag <= "01001";
		CDB_V <= "00000000000000000000000000011000";
		CDB_Q <= "10100";
		Issue_Op <= "0011";
		Issue_Tag <= "01001";
		RF_Vj <= "00000000000000000000000000001100";
		RF_Qj <= "10100";
		RF_Vk <= "00000000000000000000000000001001";
		RF_Qk <= "00111";
		RS_Qj <= "00100";
		RS_Qk <= "00000";
		wait for 10 ns;
		
		RS_WE <= '1';
		Local_Tag <= "01001";
		CDB_V <= "00000000000000000000000000000110";
		CDB_Q <= "10001";
		Issue_Op <= "0011";
		Issue_Tag <= "01001";
		RF_Vj <= "00000000000000000000000000001100";
		RF_Qj <= "10001";
		RF_Vk <= "00000000000000000000000000001001";
		RF_Qk <= "10001";
		RS_Qj <= "00000";
		RS_Qk <= "00111";
		wait for 10 ns;
		
		RS_WE <= '0';
		Local_Tag <= "01001";
		CDB_V <= "00000000000000000000000000010011";
		CDB_Q <= "01001";
		Issue_Op <= "0001";
		Issue_Tag <= "01001";
		RF_Vj <= "00000000000000000000000000001110";
		RF_Qj <= "01110";
		RF_Vk <= "00000000000000000000000000011000";
		RF_Qk <= "00101";
		RS_Qj <= "00000";
		RS_Qk <= "00000";
		wait for 10 ns;
		
		RS_WE <= '0';
		Local_Tag <= "00000";
		CDB_V <= "00000000000000000000000000000000";
		CDB_Q <= "00000";
		Issue_Op <= "0000";
		Issue_Tag <= "00000";
		RF_Vj <= "00000000000000000000000000000000";
		RF_Qj <= "00000";
		RF_Vk <= "00000000000000000000000000000000";
		RF_Qk <= "00000";
		RS_Qj <= "00000";
		RS_Qk <= "00000";
		wait for 10 ns;
      wait;
   end process;
END;