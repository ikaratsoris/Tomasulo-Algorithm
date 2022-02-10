LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_RS_Module IS
END Test_RS_Module;
 
ARCHITECTURE behavior OF Test_RS_Module IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS_Module
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         RS_WrEn : IN  std_logic;
         RS_Local_Tag : IN  std_logic_vector(4 downto 0);
         CDB_V_In : IN  std_logic_vector(31 downto 0);
         CDB_Q_In : IN  std_logic_vector(4 downto 0);
         Op_In : IN  std_logic_vector(3 downto 0);
         Tag_In : IN  std_logic_vector(4 downto 0);
         RF_Vj_In : IN  std_logic_vector(31 downto 0);
         RF_Qj_In : IN  std_logic_vector(4 downto 0);
         RF_Vk_In : IN  std_logic_vector(31 downto 0);
         RF_Qk_In : IN  std_logic_vector(4 downto 0);
         RS_Q_Ready_Out : OUT  std_logic;
         RS_Busy_Out : OUT  std_logic;
         RS_Ready_Out : OUT  std_logic;
         RS_Data_Out : OUT  std_logic_vector(72 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal RS_WrEn : std_logic := '0';
   signal RS_Local_Tag : std_logic_vector(4 downto 0) := (others => '0');
   signal CDB_V_In : std_logic_vector(31 downto 0) := (others => '0');
   signal CDB_Q_In : std_logic_vector(4 downto 0) := (others => '0');
   signal Op_In : std_logic_vector(3 downto 0) := (others => '0');
   signal Tag_In : std_logic_vector(4 downto 0) := (others => '0');
   signal RF_Vj_In : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_Qj_In : std_logic_vector(4 downto 0) := (others => '0');
   signal RF_Vk_In : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_Qk_In : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal RS_Q_Ready_Out : std_logic;
   signal RS_Busy_Out : std_logic;
   signal RS_Ready_Out : std_logic;
   signal RS_Data_Out : std_logic_vector(72 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RS_Module PORT MAP (
          Clk => Clk,
          Reset => Reset,
          RS_WrEn => RS_WrEn,
          RS_Local_Tag => RS_Local_Tag,
          CDB_V_In => CDB_V_In,
          CDB_Q_In => CDB_Q_In,
          Op_In => Op_In,
          Tag_In => Tag_In,
          RF_Vj_In => RF_Vj_In,
          RF_Qj_In => RF_Qj_In,
          RF_Vk_In => RF_Vk_In,
          RF_Qk_In => RF_Qk_In,
          RS_Q_Ready_Out => RS_Q_Ready_Out,
          RS_Busy_Out => RS_Busy_Out,
          RS_Ready_Out => RS_Ready_Out,
          RS_Data_Out => RS_Data_Out
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
		Reset <= '0';
		RS_WrEn <= '0';
		RS_Local_Tag <= "00000";
		CDB_V_In <= "00000000000000000000000000000000";
		CDB_Q_In <= "00000";
		Op_In <= "0000";
		Tag_In <= "00000";
		RF_Vj_In <= "00000000000000000000000000000000";
		RF_Qj_In <= "00000";
		RF_Vk_In <= "00000000000000000000000000000000";
		RF_Qk_In <= "00000";
		wait for 10 ns;
		
		RS_WrEn <= '1';
		RS_Local_Tag <= "01001";
		CDB_V_In <= "00000000000000000000000000000000";
		CDB_Q_In <= "00000";
		Op_In <= "0001";
		Tag_In <= "01001";
		RF_Vj_In <= "00000000000000000000000000000011";
		RF_Qj_In <= "00010";
		RF_Vk_In <= "00000000000000000000000000000100";
		RF_Qk_In <= "00100";
		wait for 10 ns;
		
		RS_WrEn <= '1';
		RS_Local_Tag <= "01001";
		CDB_V_In <= "00000000000000000000000000000000";
		CDB_Q_In <= "00000";
		Op_In <= "0011";
		Tag_In <= "01001";
		RF_Vj_In <= "00000000000000000000000000001011";
		RF_Qj_In <= "00111";
		RF_Vk_In <= "00000000000000000000000000010100";
		RF_Qk_In <= "01100";
		wait for 10 ns;
		
		RS_WrEn <= '1';
		RS_Local_Tag <= "01001";
		CDB_V_In <= "00000000000000000000000000000000";
		CDB_Q_In <= "00000";
		Op_In <= "0001";
		Tag_In <= "01001";
		RF_Vj_In <= "00000000000000000000000000001110";
		RF_Qj_In <= "01110";
		RF_Vk_In <= "00000000000000000000000000011000";
		RF_Qk_In <= "00101";
		wait for 10 ns;
		
		RS_WrEn <= '1';
		RS_Local_Tag <= "01001";
		CDB_V_In <= "00000000000000000000000000000000";
		CDB_Q_In <= "00000";
		Op_In <= "0001";
		Tag_In <= "01001";
		RF_Vj_In <= "00000000000000000000000000001110";
		RF_Qj_In <= "01110";
		RF_Vk_In <= "00000000000000000000000000011000";
		RF_Qk_In <= "00101";
		wait for 10 ns;
		
		RS_WrEn <= '1';
		RS_Local_Tag <= "01001";
		CDB_V_In <= "00000000000000000000000000000000";
		CDB_Q_In <= "00000";
		Op_In <= "0011";
		Tag_In <= "01001";
		RF_Vj_In <= "00000000000000000000000000001100";
		RF_Qj_In <= "00010";
		RF_Vk_In <= "00000000000000000000000000001001";
		RF_Qk_In <= "00011";
		wait for 10 ns;
		
		RS_WrEn <= '0';
		RS_Local_Tag <= "01001";
		CDB_V_In <= "00000000000000000000000000000000";
		CDB_Q_In <= "00000";
		Op_In <= "0010";
		Tag_In <= "01001";
		RF_Vj_In <= "00000000000000000000000000001000";
		RF_Qj_In <= "00011";
		RF_Vk_In <= "00000000000000000000000000011000";
		RF_Qk_In <= "00111";
		wait for 10 ns;
		
		RS_WrEn <= '0';
		RS_Local_Tag <= "01001";
		CDB_V_In <= "00000000000000000000000000001000";
		CDB_Q_In <= "00010";
		Op_In <= "0001";
		Tag_In <= "01001";
		RF_Vj_In <= "00000000000000000000000000001110";
		RF_Qj_In <= "01110";
		RF_Vk_In <= "00000000000000000000000000011000";
		RF_Qk_In <= "00101";
		wait for 10 ns;
		
		RS_WrEn <= '0';
		RS_Local_Tag <= "01001";
		CDB_V_In <= "00000000000000000000000000010001";
		CDB_Q_In <= "00011";
		Op_In <= "0001";
		Tag_In <= "01001";
		RF_Vj_In <= "00000000000000000000000000001110";
		RF_Qj_In <= "01110";
		RF_Vk_In <= "00000000000000000000000000011000";
		RF_Qk_In <= "00101";
		wait for 10 ns;
		
		RS_WrEn <= '1';
		RS_Local_Tag <= "01001";
		CDB_V_In <= "00000000000000000000000000000000";
		CDB_Q_In <= "00000";
		Op_In <= "0011";
		Tag_In <= "01001";
		RF_Vj_In <= "00000000000000000000000000001100";
		RF_Qj_In <= "00010";
		RF_Vk_In <= "00000000000000000000000000001001";
		RF_Qk_In <= "00011";
		wait for 10 ns;
		
		RS_WrEn <= '1';
		RS_Local_Tag <= "01001";
		CDB_V_In <= "00000000000000000000000000001110";
		CDB_Q_In <= "01101";
		Op_In <= "0011";
		Tag_In <= "01001";
		RF_Vj_In <= "00000000000000000000000000001100";
		RF_Qj_In <= "00100";
		RF_Vk_In <= "00000000000000000000000000001001";
		RF_Qk_In <= "01101";
		wait for 10 ns;
		
		RS_WrEn <= '1';
		RS_Local_Tag <= "01001";
		CDB_V_In <= "00000000000000000000000000011000";
		CDB_Q_In <= "10100";
		Op_In <= "0011";
		Tag_In <= "01001";
		RF_Vj_In <= "00000000000000000000000000001100";
		RF_Qj_In <= "10100";
		RF_Vk_In <= "00000000000000000000000000001001";
		RF_Qk_In <= "00111";
		wait for 10 ns;
		
		RS_WrEn <= '1';
		RS_Local_Tag <= "01001";
		CDB_V_In <= "00000000000000000000000000000110";
		CDB_Q_In <= "10001";
		Op_In <= "0011";
		Tag_In <= "01001";
		RF_Vj_In <= "00000000000000000000000000001100";
		RF_Qj_In <= "10001";
		RF_Vk_In <= "00000000000000000000000000001001";
		RF_Qk_In <= "10001";
		wait for 10 ns;
		
		RS_WrEn <= '0';
		RS_Local_Tag <= "01001";
		CDB_V_In <= "00000000000000000000000000010011";
		CDB_Q_In <= "01011";
		Op_In <= "0001";
		Tag_In <= "01001";
		RF_Vj_In <= "00000000000000000000000000001110";
		RF_Qj_In <= "01110";
		RF_Vk_In <= "00000000000000000000000000011000";
		RF_Qk_In <= "00101";
		wait for 10 ns;
		
		Reset <= '0';
		RS_WrEn <= '0';
		RS_Local_Tag <= "01001";
		CDB_V_In <= "00000000000000000000000000000000";
		CDB_Q_In <= "01001";
		Op_In <= "0000";
		Tag_In <= "00000";
		RF_Vj_In <= "00000000000000000000000000000000";
		RF_Qj_In <= "00000";
		RF_Vk_In <= "00000000000000000000000000000000";
		RF_Qk_In <= "00000";
		wait for 10 ns;
		
		Reset <= '0';
		RS_WrEn <= '0';
		RS_Local_Tag <= "00000";
		CDB_V_In <= "00000000000000000000000000000000";
		CDB_Q_In <= "00000";
		Op_In <= "0000";
		Tag_In <= "00000";
		RF_Vj_In <= "00000000000000000000000000000000";
		RF_Qj_In <= "00000";
		RF_Vk_In <= "00000000000000000000000000000000";
		RF_Qk_In <= "00000";
		wait for 10 ns;
      wait;
   end process;
END;