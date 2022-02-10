LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_RF_Mem IS
END Test_RF_Mem;
 
ARCHITECTURE behavior OF Test_RF_Mem IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RF_Mem
    PORT(
         Clk : IN  std_logic;
         WrEn : IN  std_logic;
         Wr_Addr : IN  std_logic_vector(4 downto 0);
         Rd0_Addr : IN  std_logic_vector(4 downto 0);
         Rd1_Addr : IN  std_logic_vector(4 downto 0);
         Wr_Data : IN  std_logic_vector(31 downto 0);
         Rd0_Data : OUT  std_logic_vector(31 downto 0);
         Rd1_Data : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal WrEn : std_logic := '0';
   signal Wr_Addr : std_logic_vector(4 downto 0) := (others => '0');
   signal Rd0_Addr : std_logic_vector(4 downto 0) := (others => '0');
   signal Rd1_Addr : std_logic_vector(4 downto 0) := (others => '0');
   signal Wr_Data : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Rd0_Data : std_logic_vector(31 downto 0);
   signal Rd1_Data : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RF_Mem PORT MAP (
          Clk => Clk,
          WrEn => WrEn,
          Wr_Addr => Wr_Addr,
          Rd0_Addr => Rd0_Addr,
          Rd1_Addr => Rd1_Addr,
          Wr_Data => Wr_Data,
          Rd0_Data => Rd0_Data,
          Rd1_Data => Rd1_Data
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
		WrEn <= '0';
		Wr_Addr <= "00000";
		Rd0_Addr <= "00000";
		Rd1_Addr <= "00000";
		Wr_Data <= "01101101111100000010001000010100";
		wait for CLK_period;
		
		WrEn <= '1';
		Wr_Addr <= "00001";
		Rd0_Addr <= "00000";
		Rd1_Addr <= "00000";
		Wr_Data <= "01101101111100000010001000010100";
		wait for CLK_period;
		
		WrEn <= '0';
		Wr_Addr <= "00000";
		Rd0_Addr <= "00000";
		Rd1_Addr <= "00001";
		Wr_Data <= "00011101111110110000011110110111";
		wait for CLK_period;
		
		WrEn <= '1';
		Wr_Addr <= "00010";
		Rd0_Addr <= "00000";
		Rd1_Addr <= "00001";
		Wr_Data <= "00011101111110110000011110110111";
		wait for CLK_period;
		
		WrEn <= '0';
		Wr_Addr <= "00000";
		Rd0_Addr <= "00001";
		Rd1_Addr <= "00010";
		Wr_Data <= "11100001010110101011100011101100";
		wait for CLK_period;
		
		WrEn <= '1';
		Wr_Addr <= "00011";
		Rd0_Addr <= "00001";
		Rd1_Addr <= "00010";
		Wr_Data <= "11100001010110101011100011101100";
		wait for CLK_period;
		
		WrEn <= '0';
		Wr_Addr <= "00000";
		Rd0_Addr <= "00010";
		Rd1_Addr <= "00011";
		Wr_Data <= "00011100100000011100100001101011";
		wait for CLK_period;
		
		WrEn <= '1';
		Wr_Addr <= "00100";
		Rd0_Addr <= "00010";
		Rd1_Addr <= "00011";
		Wr_Data <= "00011100100000011100100001101011";
		wait for CLK_period;
		
		WrEn <= '0';
		Wr_Addr <= "00000";
		Rd0_Addr <= "00011";
		Rd1_Addr <= "00100";
		Wr_Data <= "00110010111000000001111001100110";
		wait for CLK_period;
		
		WrEn <= '0';
		Wr_Addr <= "00000";
		Rd0_Addr <= "00000";
		Rd1_Addr <= "00001";
		Wr_Data <= "00110010111000000001111001100110";
		wait for CLK_period;
		
		WrEn <= '0';
		Wr_Addr <= "00000";
		Rd0_Addr <= "00001";
		Rd1_Addr <= "00010";
		Wr_Data <= "00110010111000000001111001100110";
		wait for CLK_period;
		
		WrEn <= '0';
		Wr_Addr <= "00000";
		Rd0_Addr <= "00010";
		Rd1_Addr <= "00011";
		Wr_Data <= "00110010111000000001111001100110";
		wait for CLK_period;
		
		WrEn <= '0';
		Wr_Addr <= "00000";
		Rd0_Addr <= "00011";
		Rd1_Addr <= "00100";
		Wr_Data <= "00110010111000000001111001100110";
		wait for CLK_period;
		
		WrEn <= '0';
		Wr_Addr <= "00000";
		Rd0_Addr <= "00100";
		Rd1_Addr <= "00101";
		Wr_Data <= "00110010111000000001111001100110";
		wait for CLK_period;
      wait;
   end process;
END;