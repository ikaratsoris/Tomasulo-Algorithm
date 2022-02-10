LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_RF_Write_Control IS
END Test_RF_Write_Control;
 
ARCHITECTURE behavior OF Test_RF_Write_Control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RF_Write_Control
    PORT(
         ROB_Move_0 : IN  std_logic;
         ROB_Move_1 : IN  std_logic;
         ROB_Move_2 : IN  std_logic;
         ROB_Move_3 : IN  std_logic;
         ROB_Move_4 : IN  std_logic;
         ROB_Move_5 : IN  std_logic;
         ROB_Move_6 : IN  std_logic;
         ROB_Move_7 : IN  std_logic;
         ROB_Dest_0 : IN  std_logic_vector(4 downto 0);
         ROB_Dest_1 : IN  std_logic_vector(4 downto 0);
         ROB_Dest_2 : IN  std_logic_vector(4 downto 0);
         ROB_Dest_3 : IN  std_logic_vector(4 downto 0);
         ROB_Dest_4 : IN  std_logic_vector(4 downto 0);
         ROB_Dest_5 : IN  std_logic_vector(4 downto 0);
         ROB_Dest_6 : IN  std_logic_vector(4 downto 0);
         ROB_Dest_7 : IN  std_logic_vector(4 downto 0);
         ROB_Value_0 : IN  std_logic_vector(31 downto 0);
         ROB_Value_1 : IN  std_logic_vector(31 downto 0);
         ROB_Value_2 : IN  std_logic_vector(31 downto 0);
         ROB_Value_3 : IN  std_logic_vector(31 downto 0);
         ROB_Value_4 : IN  std_logic_vector(31 downto 0);
         ROB_Value_5 : IN  std_logic_vector(31 downto 0);
         ROB_Value_6 : IN  std_logic_vector(31 downto 0);
         ROB_Value_7 : IN  std_logic_vector(31 downto 0);
         RF_WrEn : OUT  std_logic;
         RF_WrAddr : OUT  std_logic_vector(4 downto 0);
         RF_WrData : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ROB_Move_0 : std_logic := '0';
   signal ROB_Move_1 : std_logic := '0';
   signal ROB_Move_2 : std_logic := '0';
   signal ROB_Move_3 : std_logic := '0';
   signal ROB_Move_4 : std_logic := '0';
   signal ROB_Move_5 : std_logic := '0';
   signal ROB_Move_6 : std_logic := '0';
   signal ROB_Move_7 : std_logic := '0';
   signal ROB_Dest_0 : std_logic_vector(4 downto 0) := (others => '0');
   signal ROB_Dest_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal ROB_Dest_2 : std_logic_vector(4 downto 0) := (others => '0');
   signal ROB_Dest_3 : std_logic_vector(4 downto 0) := (others => '0');
   signal ROB_Dest_4 : std_logic_vector(4 downto 0) := (others => '0');
   signal ROB_Dest_5 : std_logic_vector(4 downto 0) := (others => '0');
   signal ROB_Dest_6 : std_logic_vector(4 downto 0) := (others => '0');
   signal ROB_Dest_7 : std_logic_vector(4 downto 0) := (others => '0');
   signal ROB_Value_0 : std_logic_vector(31 downto 0) := (others => '0');
   signal ROB_Value_1 : std_logic_vector(31 downto 0) := (others => '0');
   signal ROB_Value_2 : std_logic_vector(31 downto 0) := (others => '0');
   signal ROB_Value_3 : std_logic_vector(31 downto 0) := (others => '0');
   signal ROB_Value_4 : std_logic_vector(31 downto 0) := (others => '0');
   signal ROB_Value_5 : std_logic_vector(31 downto 0) := (others => '0');
   signal ROB_Value_6 : std_logic_vector(31 downto 0) := (others => '0');
   signal ROB_Value_7 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal RF_WrEn : std_logic;
   signal RF_WrAddr : std_logic_vector(4 downto 0);
   signal RF_WrData : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RF_Write_Control PORT MAP (
          ROB_Move_0 => ROB_Move_0,
          ROB_Move_1 => ROB_Move_1,
          ROB_Move_2 => ROB_Move_2,
          ROB_Move_3 => ROB_Move_3,
          ROB_Move_4 => ROB_Move_4,
          ROB_Move_5 => ROB_Move_5,
          ROB_Move_6 => ROB_Move_6,
          ROB_Move_7 => ROB_Move_7,
          ROB_Dest_0 => ROB_Dest_0,
          ROB_Dest_1 => ROB_Dest_1,
          ROB_Dest_2 => ROB_Dest_2,
          ROB_Dest_3 => ROB_Dest_3,
          ROB_Dest_4 => ROB_Dest_4,
          ROB_Dest_5 => ROB_Dest_5,
          ROB_Dest_6 => ROB_Dest_6,
          ROB_Dest_7 => ROB_Dest_7,
          ROB_Value_0 => ROB_Value_0,
          ROB_Value_1 => ROB_Value_1,
          ROB_Value_2 => ROB_Value_2,
          ROB_Value_3 => ROB_Value_3,
          ROB_Value_4 => ROB_Value_4,
          ROB_Value_5 => ROB_Value_5,
          ROB_Value_6 => ROB_Value_6,
          ROB_Value_7 => ROB_Value_7,
          RF_WrEn => RF_WrEn,
          RF_WrAddr => RF_WrAddr,
          RF_WrData => RF_WrData
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
		ROB_Move_0 <= '0';
		ROB_Move_1 <= '0';
		ROB_Move_2 <= '0';
		ROB_Move_3 <= '0';
		ROB_Move_4 <= '0';
		ROB_Move_5 <= '0';
		ROB_Move_6 <= '0';
		ROB_Move_7 <= '0';
		ROB_Dest_0 <= "00000";
		ROB_Dest_1 <= "00000";
		ROB_Dest_2 <= "00000";
		ROB_Dest_3 <= "00000";
		ROB_Dest_4 <= "00000";
		ROB_Dest_5 <= "00000";
		ROB_Dest_6 <= "00000";
		ROB_Dest_7 <= "00000";
		ROB_Value_0 <= "00000000000000000000000000000000";
		ROB_Value_1 <= "00000000000000000000000000000000";
		ROB_Value_2 <= "00000000000000000000000000000000";
		ROB_Value_3 <= "00000000000000000000000000000000";
		ROB_Value_4 <= "00000000000000000000000000000000";
		ROB_Value_5 <= "00000000000000000000000000000000";
		ROB_Value_6 <= "00000000000000000000000000000000";
		ROB_Value_7 <= "00000000000000000000000000000000";
		wait for 10 ns;
		
		ROB_Move_0 <= '1';
		ROB_Move_1 <= '0';
		ROB_Move_2 <= '0';
		ROB_Move_3 <= '0';
		ROB_Move_4 <= '0';
		ROB_Move_5 <= '0';
		ROB_Move_6 <= '0';
		ROB_Move_7 <= '0';
		ROB_Dest_0 <= "00101";
		ROB_Dest_1 <= "10110";
		ROB_Dest_2 <= "00110";
		ROB_Dest_3 <= "01000";
		ROB_Dest_4 <= "11101";
		ROB_Dest_5 <= "01101";
		ROB_Dest_6 <= "10110";
		ROB_Dest_7 <= "11110";
		ROB_Value_0 <= "11110100011010001111010000100001";
		ROB_Value_1 <= "01111100000101111110100001100111";
		ROB_Value_2 <= "10110001001100011001011110101000";
		ROB_Value_3 <= "01011001010111001101111010111100";
		ROB_Value_4 <= "10101101100001101001000111010010";
		ROB_Value_5 <= "00000110001001110101000111110111";
		ROB_Value_6 <= "10110111000110100110010000000110";
		ROB_Value_7 <= "01011010110011011011000100000000";
		wait for 10 ns;
		
		ROB_Move_0 <= '0';
		ROB_Move_1 <= '1';
		ROB_Move_2 <= '0';
		ROB_Move_3 <= '0';
		ROB_Move_4 <= '0';
		ROB_Move_5 <= '0';
		ROB_Move_6 <= '0';
		ROB_Move_7 <= '0';
		ROB_Dest_0 <= "00101";
		ROB_Dest_1 <= "10110";
		ROB_Dest_2 <= "00110";
		ROB_Dest_3 <= "01000";
		ROB_Dest_4 <= "11101";
		ROB_Dest_5 <= "01101";
		ROB_Dest_6 <= "10110";
		ROB_Dest_7 <= "11110";
		ROB_Value_0 <= "11110100011010001111010000100001";
		ROB_Value_1 <= "01111100000101111110100001100111";
		ROB_Value_2 <= "10110001001100011001011110101000";
		ROB_Value_3 <= "01011001010111001101111010111100";
		ROB_Value_4 <= "10101101100001101001000111010010";
		ROB_Value_5 <= "00000110001001110101000111110111";
		ROB_Value_6 <= "10110111000110100110010000000110";
		ROB_Value_7 <= "01011010110011011011000100000000";
		wait for 10 ns;
		
		ROB_Move_0 <= '0';
		ROB_Move_1 <= '0';
		ROB_Move_2 <= '1';
		ROB_Move_3 <= '0';
		ROB_Move_4 <= '0';
		ROB_Move_5 <= '0';
		ROB_Move_6 <= '0';
		ROB_Move_7 <= '0';
		ROB_Dest_0 <= "00101";
		ROB_Dest_1 <= "10110";
		ROB_Dest_2 <= "00110";
		ROB_Dest_3 <= "01000";
		ROB_Dest_4 <= "11101";
		ROB_Dest_5 <= "01101";
		ROB_Dest_6 <= "10110";
		ROB_Dest_7 <= "11110";
		ROB_Value_0 <= "11110100011010001111010000100001";
		ROB_Value_1 <= "01111100000101111110100001100111";
		ROB_Value_2 <= "10110001001100011001011110101000";
		ROB_Value_3 <= "01011001010111001101111010111100";
		ROB_Value_4 <= "10101101100001101001000111010010";
		ROB_Value_5 <= "00000110001001110101000111110111";
		ROB_Value_6 <= "10110111000110100110010000000110";
		ROB_Value_7 <= "01011010110011011011000100000000";
		wait for 10 ns;
		
		ROB_Move_0 <= '0';
		ROB_Move_1 <= '0';
		ROB_Move_2 <= '0';
		ROB_Move_3 <= '1';
		ROB_Move_4 <= '0';
		ROB_Move_5 <= '0';
		ROB_Move_6 <= '0';
		ROB_Move_7 <= '0';
		ROB_Dest_0 <= "00101";
		ROB_Dest_1 <= "10110";
		ROB_Dest_2 <= "00110";
		ROB_Dest_3 <= "01000";
		ROB_Dest_4 <= "11101";
		ROB_Dest_5 <= "01101";
		ROB_Dest_6 <= "10110";
		ROB_Dest_7 <= "11110";
		ROB_Value_0 <= "11110100011010001111010000100001";
		ROB_Value_1 <= "01111100000101111110100001100111";
		ROB_Value_2 <= "10110001001100011001011110101000";
		ROB_Value_3 <= "01011001010111001101111010111100";
		ROB_Value_4 <= "10101101100001101001000111010010";
		ROB_Value_5 <= "00000110001001110101000111110111";
		ROB_Value_6 <= "10110111000110100110010000000110";
		ROB_Value_7 <= "01011010110011011011000100000000";
		wait for 10 ns;
		
		ROB_Move_0 <= '0';
		ROB_Move_1 <= '0';
		ROB_Move_2 <= '0';
		ROB_Move_3 <= '0';
		ROB_Move_4 <= '1';
		ROB_Move_5 <= '0';
		ROB_Move_6 <= '0';
		ROB_Move_7 <= '0';
		ROB_Dest_0 <= "00101";
		ROB_Dest_1 <= "10110";
		ROB_Dest_2 <= "00110";
		ROB_Dest_3 <= "01000";
		ROB_Dest_4 <= "11101";
		ROB_Dest_5 <= "01101";
		ROB_Dest_6 <= "10110";
		ROB_Dest_7 <= "11110";
		ROB_Value_0 <= "11110100011010001111010000100001";
		ROB_Value_1 <= "01111100000101111110100001100111";
		ROB_Value_2 <= "10110001001100011001011110101000";
		ROB_Value_3 <= "01011001010111001101111010111100";
		ROB_Value_4 <= "10101101100001101001000111010010";
		ROB_Value_5 <= "00000110001001110101000111110111";
		ROB_Value_6 <= "10110111000110100110010000000110";
		ROB_Value_7 <= "01011010110011011011000100000000";
		wait for 10 ns;
		
		ROB_Move_0 <= '0';
		ROB_Move_1 <= '0';
		ROB_Move_2 <= '0';
		ROB_Move_3 <= '0';
		ROB_Move_4 <= '0';
		ROB_Move_5 <= '1';
		ROB_Move_6 <= '0';
		ROB_Move_7 <= '0';
		ROB_Dest_0 <= "00101";
		ROB_Dest_1 <= "10110";
		ROB_Dest_2 <= "00110";
		ROB_Dest_3 <= "01000";
		ROB_Dest_4 <= "11101";
		ROB_Dest_5 <= "01101";
		ROB_Dest_6 <= "10110";
		ROB_Dest_7 <= "11110";
		ROB_Value_0 <= "11110100011010001111010000100001";
		ROB_Value_1 <= "01111100000101111110100001100111";
		ROB_Value_2 <= "10110001001100011001011110101000";
		ROB_Value_3 <= "01011001010111001101111010111100";
		ROB_Value_4 <= "10101101100001101001000111010010";
		ROB_Value_5 <= "00000110001001110101000111110111";
		ROB_Value_6 <= "10110111000110100110010000000110";
		ROB_Value_7 <= "01011010110011011011000100000000";
		wait for 10 ns;
		
		ROB_Move_0 <= '0';
		ROB_Move_1 <= '0';
		ROB_Move_2 <= '0';
		ROB_Move_3 <= '0';
		ROB_Move_4 <= '0';
		ROB_Move_5 <= '0';
		ROB_Move_6 <= '1';
		ROB_Move_7 <= '0';
		ROB_Dest_0 <= "00101";
		ROB_Dest_1 <= "10110";
		ROB_Dest_2 <= "00110";
		ROB_Dest_3 <= "01000";
		ROB_Dest_4 <= "11101";
		ROB_Dest_5 <= "01101";
		ROB_Dest_6 <= "10110";
		ROB_Dest_7 <= "11110";
		ROB_Value_0 <= "11110100011010001111010000100001";
		ROB_Value_1 <= "01111100000101111110100001100111";
		ROB_Value_2 <= "10110001001100011001011110101000";
		ROB_Value_3 <= "01011001010111001101111010111100";
		ROB_Value_4 <= "10101101100001101001000111010010";
		ROB_Value_5 <= "00000110001001110101000111110111";
		ROB_Value_6 <= "10110111000110100110010000000110";
		ROB_Value_7 <= "01011010110011011011000100000000";
		wait for 10 ns;
		
		ROB_Move_0 <= '0';
		ROB_Move_1 <= '0';
		ROB_Move_2 <= '0';
		ROB_Move_3 <= '0';
		ROB_Move_4 <= '0';
		ROB_Move_5 <= '0';
		ROB_Move_6 <= '0';
		ROB_Move_7 <= '1';
		ROB_Dest_0 <= "00101";
		ROB_Dest_1 <= "10110";
		ROB_Dest_2 <= "00110";
		ROB_Dest_3 <= "01000";
		ROB_Dest_4 <= "11101";
		ROB_Dest_5 <= "01101";
		ROB_Dest_6 <= "10110";
		ROB_Dest_7 <= "11110";
		ROB_Value_0 <= "11110100011010001111010000100001";
		ROB_Value_1 <= "01111100000101111110100001100111";
		ROB_Value_2 <= "10110001001100011001011110101000";
		ROB_Value_3 <= "01011001010111001101111010111100";
		ROB_Value_4 <= "10101101100001101001000111010010";
		ROB_Value_5 <= "00000110001001110101000111110111";
		ROB_Value_6 <= "10110111000110100110010000000110";
		ROB_Value_7 <= "01011010110011011011000100000000";
		wait for 10 ns;
		
		ROB_Move_0 <= '0';
		ROB_Move_1 <= '0';
		ROB_Move_2 <= '0';
		ROB_Move_3 <= '0';
		ROB_Move_4 <= '0';
		ROB_Move_5 <= '0';
		ROB_Move_6 <= '0';
		ROB_Move_7 <= '0';
		ROB_Dest_0 <= "00101";
		ROB_Dest_1 <= "10110";
		ROB_Dest_2 <= "00110";
		ROB_Dest_3 <= "01000";
		ROB_Dest_4 <= "11101";
		ROB_Dest_5 <= "01101";
		ROB_Dest_6 <= "10110";
		ROB_Dest_7 <= "11110";
		ROB_Value_0 <= "11110100011010001111010000100001";
		ROB_Value_1 <= "01111100000101111110100001100111";
		ROB_Value_2 <= "10110001001100011001011110101000";
		ROB_Value_3 <= "01011001010111001101111010111100";
		ROB_Value_4 <= "10101101100001101001000111010010";
		ROB_Value_5 <= "00000110001001110101000111110111";
		ROB_Value_6 <= "10110111000110100110010000000110";
		ROB_Value_7 <= "01011010110011011011000100000000";
		wait for 10 ns;
      wait;
   end process;
END;