LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_Issue IS
END Test_Issue;
 
ARCHITECTURE behavior OF Test_Issue IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Issue
    PORT(
         ROB_Full : IN  std_logic;
         Excep_En : IN  std_logic;
         RS0_Logic_Busy : IN  std_logic;
         RS1_Logic_Busy : IN  std_logic;
         RS0_Arith_Busy : IN  std_logic;
         RS1_Arith_Busy : IN  std_logic;
         RS2_Arith_Busy : IN  std_logic;
         Instruction : IN  std_logic_vector(19 downto 0);
         Accepted : OUT  std_logic;
         WrEn : OUT  std_logic;
         Op : OUT  std_logic_vector(3 downto 0);
         Ri : OUT  std_logic_vector(4 downto 0);
         Rj : OUT  std_logic_vector(4 downto 0);
         Rk : OUT  std_logic_vector(4 downto 0);
         RS_Tag : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ROB_Full : std_logic := '0';
   signal Excep_En : std_logic := '0';
   signal RS0_Logic_Busy : std_logic := '0';
   signal RS1_Logic_Busy : std_logic := '0';
   signal RS0_Arith_Busy : std_logic := '0';
   signal RS1_Arith_Busy : std_logic := '0';
   signal RS2_Arith_Busy : std_logic := '0';
   signal Instruction : std_logic_vector(19 downto 0) := (others => '0');

 	--Outputs
   signal Accepted : std_logic;
   signal WrEn : std_logic;
   signal Op : std_logic_vector(3 downto 0);
   signal Ri : std_logic_vector(4 downto 0);
   signal Rj : std_logic_vector(4 downto 0);
   signal Rk : std_logic_vector(4 downto 0);
   signal RS_Tag : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Issue PORT MAP (
          ROB_Full => ROB_Full,
          Excep_En => Excep_En,
          RS0_Logic_Busy => RS0_Logic_Busy,
          RS1_Logic_Busy => RS1_Logic_Busy,
          RS0_Arith_Busy => RS0_Arith_Busy,
          RS1_Arith_Busy => RS1_Arith_Busy,
          RS2_Arith_Busy => RS2_Arith_Busy,
          Instruction => Instruction,
          Accepted => Accepted,
          WrEn => WrEn,
          Op => Op,
          Ri => Ri,
          Rj => Rj,
          Rk => Rk,
          RS_Tag => RS_Tag
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
		ROB_Full <= '0';
      Excep_En <= '0';
		RS0_Logic_Busy <= '0';
		RS1_Logic_Busy <= '0';
		RS0_Arith_Busy <= '0';
		RS1_Arith_Busy <= '0';
		RS2_Arith_Busy <= '0';
		Instruction <= "00000000000000000000";
		wait for 10 ns;
		
		ROB_Full <= '0';
      Excep_En <= '0';
		RS0_Logic_Busy <= '0';
		RS1_Logic_Busy <= '0';
		RS0_Arith_Busy <= '0';
		RS1_Arith_Busy <= '0';
		RS2_Arith_Busy <= '0';
		Instruction <= "10001000100001000011";
		wait for 10 ns;
		
		ROB_Full <= '0';
      Excep_En <= '0';
		RS0_Logic_Busy <= '1';
		RS1_Logic_Busy <= '0';
		RS0_Arith_Busy <= '0';
		RS1_Arith_Busy <= '0';
		RS2_Arith_Busy <= '0';
		Instruction <= "10001001100001100001";
		wait for 10 ns;
		
		ROB_Full <= '0';
      Excep_En <= '0';
		RS0_Logic_Busy <= '1';
		RS1_Logic_Busy <= '1';
		RS0_Arith_Busy <= '0';
		RS1_Arith_Busy <= '0';
		RS2_Arith_Busy <= '0';
		Instruction <= "10100001000001000010";
		wait for 10 ns;
		
		ROB_Full <= '0';
      Excep_En <= '0';
		RS0_Logic_Busy <= '1';
		RS1_Logic_Busy <= '1';
		RS0_Arith_Busy <= '1';
		RS1_Arith_Busy <= '0';
		RS2_Arith_Busy <= '0';
		Instruction <= "10100011000011000110";
		wait for 10 ns;
		
		ROB_Full <= '0';
      Excep_En <= '0';
		RS0_Logic_Busy <= '1';
		RS1_Logic_Busy <= '1';
		RS0_Arith_Busy <= '1';
		RS1_Arith_Busy <= '1';
		RS2_Arith_Busy <= '0';
		Instruction <= "10100011100011100111";
		wait for 10 ns;
		
		ROB_Full <= '0';
      Excep_En <= '0';
		RS0_Logic_Busy <= '1';
		RS1_Logic_Busy <= '1';
		RS0_Arith_Busy <= '1';
		RS1_Arith_Busy <= '1';
		RS2_Arith_Busy <= '1';
		Instruction <= "10011001100001100001";
		wait for 10 ns;
		
		ROB_Full <= '0';
      Excep_En <= '0';
		RS0_Logic_Busy <= '0';
		RS1_Logic_Busy <= '0';
		RS0_Arith_Busy <= '0';
		RS1_Arith_Busy <= '0';
		RS2_Arith_Busy <= '0';
		Instruction <= "10001001100001100001";
		wait for 10 ns;
		
		ROB_Full <= '1';
      Excep_En <= '0';
		RS0_Logic_Busy <= '0';
		RS1_Logic_Busy <= '0';
		RS0_Arith_Busy <= '0';
		RS1_Arith_Busy <= '0';
		RS2_Arith_Busy <= '0';
		Instruction <= "10001001100001100001";
		wait for 10 ns;
		
		ROB_Full <= '0';
      Excep_En <= '1';
		RS0_Logic_Busy <= '0';
		RS1_Logic_Busy <= '0';
		RS0_Arith_Busy <= '0';
		RS1_Arith_Busy <= '0';
		RS2_Arith_Busy <= '0';
		Instruction <= "10001001100001100001";
		wait for 10 ns;
		
		ROB_Full <= '1';
      Excep_En <= '1';
		RS0_Logic_Busy <= '0';
		RS1_Logic_Busy <= '0';
		RS0_Arith_Busy <= '0';
		RS1_Arith_Busy <= '0';
		RS2_Arith_Busy <= '0';
		Instruction <= "10001001100001100001";
		wait for 10 ns;
      wait;
   end process;
END;