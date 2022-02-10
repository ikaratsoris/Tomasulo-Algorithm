--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:49:06 12/10/2017
-- Design Name:   
-- Module Name:   C:/Users/Thanos/Documents/Xilinx Projects/Processor/Test_Excep_FU_Control.vhd
-- Project Name:  Processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Excep_FU_Control
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_Excep_FU_Control IS
END Test_Excep_FU_Control;
 
ARCHITECTURE behavior OF Test_Excep_FU_Control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Excep_FU_Control
    PORT(
         Excep_En : IN  std_logic;
         Excep_Tag : IN  std_logic_vector(4 downto 0);
         ROB_PC_0 : IN  std_logic_vector(31 downto 0);
         ROB_PC_1 : IN  std_logic_vector(31 downto 0);
         ROB_PC_2 : IN  std_logic_vector(31 downto 0);
         ROB_PC_3 : IN  std_logic_vector(31 downto 0);
         ROB_PC_4 : IN  std_logic_vector(31 downto 0);
         ROB_PC_5 : IN  std_logic_vector(31 downto 0);
         ROB_PC_6 : IN  std_logic_vector(31 downto 0);
         ROB_PC_7 : IN  std_logic_vector(31 downto 0);
         ROB_Tag_0 : IN  std_logic_vector(4 downto 0);
         ROB_Tag_1 : IN  std_logic_vector(4 downto 0);
         ROB_Tag_2 : IN  std_logic_vector(4 downto 0);
         ROB_Tag_3 : IN  std_logic_vector(4 downto 0);
         ROB_Tag_4 : IN  std_logic_vector(4 downto 0);
         ROB_Tag_5 : IN  std_logic_vector(4 downto 0);
         ROB_Tag_6 : IN  std_logic_vector(4 downto 0);
         ROB_Tag_7 : IN  std_logic_vector(4 downto 0);
         ROB_Clear_0 : OUT  std_logic;
         ROB_Clear_1 : OUT  std_logic;
         ROB_Clear_2 : OUT  std_logic;
         ROB_Clear_3 : OUT  std_logic;
         ROB_Clear_4 : OUT  std_logic;
         ROB_Clear_5 : OUT  std_logic;
         ROB_Clear_6 : OUT  std_logic;
         ROB_Clear_7 : OUT  std_logic;
         Excep_PC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Excep_En : std_logic := '0';
   signal Excep_Tag : std_logic_vector(4 downto 0) := (others => '0');
   signal ROB_PC_0 : std_logic_vector(31 downto 0) := (others => '0');
   signal ROB_PC_1 : std_logic_vector(31 downto 0) := (others => '0');
   signal ROB_PC_2 : std_logic_vector(31 downto 0) := (others => '0');
   signal ROB_PC_3 : std_logic_vector(31 downto 0) := (others => '0');
   signal ROB_PC_4 : std_logic_vector(31 downto 0) := (others => '0');
   signal ROB_PC_5 : std_logic_vector(31 downto 0) := (others => '0');
   signal ROB_PC_6 : std_logic_vector(31 downto 0) := (others => '0');
   signal ROB_PC_7 : std_logic_vector(31 downto 0) := (others => '0');
   signal ROB_Tag_0 : std_logic_vector(4 downto 0) := (others => '0');
   signal ROB_Tag_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal ROB_Tag_2 : std_logic_vector(4 downto 0) := (others => '0');
   signal ROB_Tag_3 : std_logic_vector(4 downto 0) := (others => '0');
   signal ROB_Tag_4 : std_logic_vector(4 downto 0) := (others => '0');
   signal ROB_Tag_5 : std_logic_vector(4 downto 0) := (others => '0');
   signal ROB_Tag_6 : std_logic_vector(4 downto 0) := (others => '0');
   signal ROB_Tag_7 : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal ROB_Clear_0 : std_logic;
   signal ROB_Clear_1 : std_logic;
   signal ROB_Clear_2 : std_logic;
   signal ROB_Clear_3 : std_logic;
   signal ROB_Clear_4 : std_logic;
   signal ROB_Clear_5 : std_logic;
   signal ROB_Clear_6 : std_logic;
   signal ROB_Clear_7 : std_logic;
   signal Excep_PC : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Excep_FU_Control PORT MAP (
          Excep_En => Excep_En,
          Excep_Tag => Excep_Tag,
          ROB_PC_0 => ROB_PC_0,
          ROB_PC_1 => ROB_PC_1,
          ROB_PC_2 => ROB_PC_2,
          ROB_PC_3 => ROB_PC_3,
          ROB_PC_4 => ROB_PC_4,
          ROB_PC_5 => ROB_PC_5,
          ROB_PC_6 => ROB_PC_6,
          ROB_PC_7 => ROB_PC_7,
          ROB_Tag_0 => ROB_Tag_0,
          ROB_Tag_1 => ROB_Tag_1,
          ROB_Tag_2 => ROB_Tag_2,
          ROB_Tag_3 => ROB_Tag_3,
          ROB_Tag_4 => ROB_Tag_4,
          ROB_Tag_5 => ROB_Tag_5,
          ROB_Tag_6 => ROB_Tag_6,
          ROB_Tag_7 => ROB_Tag_7,
          ROB_Clear_0 => ROB_Clear_0,
          ROB_Clear_1 => ROB_Clear_1,
          ROB_Clear_2 => ROB_Clear_2,
          ROB_Clear_3 => ROB_Clear_3,
          ROB_Clear_4 => ROB_Clear_4,
          ROB_Clear_5 => ROB_Clear_5,
          ROB_Clear_6 => ROB_Clear_6,
          ROB_Clear_7 => ROB_Clear_7,
          Excep_PC => Excep_PC
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
		Excep_En <= '0';
		Excep_Tag <= "00000";
		ROB_PC_0 <= "00000000000000000000000000000000";
		ROB_PC_1 <= "00000000000000000000000000000001";
		ROB_PC_2 <= "00000000000000000000000000000010";
		ROB_PC_3 <= "00000000000000000000000000000011";
		ROB_PC_4 <= "00000000000000000000000000000100";
		ROB_PC_5 <= "00000000000000000000000000000101";
		ROB_PC_6 <= "00000000000000000000000000000110";
		ROB_PC_7 <= "00000000000000000000000000000111";
		ROB_Tag_0 <= "01001";
		ROB_Tag_1 <= "01010";
		ROB_Tag_2 <= "01011";
		ROB_Tag_3 <= "00001";
		ROB_Tag_4 <= "00010";
		ROB_Tag_5 <= "00011";
		ROB_Tag_6 <= "01100";
		ROB_Tag_7 <= "00100";
		wait for 10 ns;
		
		Excep_En <= '1';
		Excep_Tag <= "00001";
		ROB_PC_0 <= "00000000000000000000000000000000";
		ROB_PC_1 <= "00000000000000000000000000000001";
		ROB_PC_2 <= "00000000000000000000000000000010";
		ROB_PC_3 <= "00000000000000000000000000000011";
		ROB_PC_4 <= "00000000000000000000000000000100";
		ROB_PC_5 <= "00000000000000000000000000000101";
		ROB_PC_6 <= "00000000000000000000000000000110";
		ROB_PC_7 <= "00000000000000000000000000000111";
		ROB_Tag_0 <= "01001";
		ROB_Tag_1 <= "01010";
		ROB_Tag_2 <= "01011";
		ROB_Tag_3 <= "00001";
		ROB_Tag_4 <= "00010";
		ROB_Tag_5 <= "00011";
		ROB_Tag_6 <= "01100";
		ROB_Tag_7 <= "00100";
		wait for 10 ns;
		
		Excep_En <= '1';
		Excep_Tag <= "00100";
		ROB_PC_0 <= "00000000000000000000000000000000";
		ROB_PC_1 <= "00000000000000000000000000000001";
		ROB_PC_2 <= "00000000000000000000000000000010";
		ROB_PC_3 <= "00000000000000000000000000000011";
		ROB_PC_4 <= "00000000000000000000000000000100";
		ROB_PC_5 <= "00000000000000000000000000000101";
		ROB_PC_6 <= "00000000000000000000000000000110";
		ROB_PC_7 <= "00000000000000000000000000000111";
		ROB_Tag_0 <= "01001";
		ROB_Tag_1 <= "01010";
		ROB_Tag_2 <= "01011";
		ROB_Tag_3 <= "00001";
		ROB_Tag_4 <= "00010";
		ROB_Tag_5 <= "00011";
		ROB_Tag_6 <= "01100";
		ROB_Tag_7 <= "00100";
		wait for 10 ns;
		
		Excep_En <= '1';
		Excep_Tag <= "00010";
		ROB_PC_0 <= "00000000000000000000000000000000";
		ROB_PC_1 <= "00000000000000000000000000000001";
		ROB_PC_2 <= "00000000000000000000000000000010";
		ROB_PC_3 <= "00000000000000000000000000000011";
		ROB_PC_4 <= "00000000000000000000000000000100";
		ROB_PC_5 <= "00000000000000000000000000000101";
		ROB_PC_6 <= "00000000000000000000000000000110";
		ROB_PC_7 <= "00000000000000000000000000000111";
		ROB_Tag_0 <= "01001";
		ROB_Tag_1 <= "01010";
		ROB_Tag_2 <= "01011";
		ROB_Tag_3 <= "00001";
		ROB_Tag_4 <= "00010";
		ROB_Tag_5 <= "00011";
		ROB_Tag_6 <= "01100";
		ROB_Tag_7 <= "00100";
		wait for 10 ns;
		
		Excep_En <= '1';
		Excep_Tag <= "01011";
		ROB_PC_0 <= "00000000000000000000000000000000";
		ROB_PC_1 <= "00000000000000000000000000000001";
		ROB_PC_2 <= "00000000000000000000000000000010";
		ROB_PC_3 <= "00000000000000000000000000000011";
		ROB_PC_4 <= "00000000000000000000000000000100";
		ROB_PC_5 <= "00000000000000000000000000000101";
		ROB_PC_6 <= "00000000000000000000000000000110";
		ROB_PC_7 <= "00000000000000000000000000000111";
		ROB_Tag_0 <= "01001";
		ROB_Tag_1 <= "01010";
		ROB_Tag_2 <= "01011";
		ROB_Tag_3 <= "00001";
		ROB_Tag_4 <= "00010";
		ROB_Tag_5 <= "00011";
		ROB_Tag_6 <= "01100";
		ROB_Tag_7 <= "00100";
		wait for 10 ns;
		
		Excep_En <= '0';
		Excep_Tag <= "00000";
		ROB_PC_0 <= "00000000000000000000000000000000";
		ROB_PC_1 <= "00000000000000000000000000000001";
		ROB_PC_2 <= "00000000000000000000000000000010";
		ROB_PC_3 <= "00000000000000000000000000000011";
		ROB_PC_4 <= "00000000000000000000000000000100";
		ROB_PC_5 <= "00000000000000000000000000000101";
		ROB_PC_6 <= "00000000000000000000000000000110";
		ROB_PC_7 <= "00000000000000000000000000000111";
		ROB_Tag_0 <= "01001";
		ROB_Tag_1 <= "01010";
		ROB_Tag_2 <= "01011";
		ROB_Tag_3 <= "00001";
		ROB_Tag_4 <= "00010";
		ROB_Tag_5 <= "00011";
		ROB_Tag_6 <= "01100";
		ROB_Tag_7 <= "00100";
		wait for 10 ns;
      wait;
   end process;
END;