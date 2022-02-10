LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_Excep_PC_Control IS
END Test_Excep_PC_Control;
 
ARCHITECTURE behavior OF Test_Excep_PC_Control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Excep_PC_Control
    PORT(
         Arith_Excep_En : IN  std_logic;
         Logic_Excep_En : IN  std_logic;
         Arith_Excep_PC : IN  std_logic_vector(31 downto 0);
         Logic_Excep_PC : IN  std_logic_vector(31 downto 0);
         Ex_En : OUT  std_logic;
         Ex_PC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Arith_Excep_En : std_logic := '0';
   signal Logic_Excep_En : std_logic := '0';
   signal Arith_Excep_PC : std_logic_vector(31 downto 0) := (others => '0');
   signal Logic_Excep_PC : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Ex_En : std_logic;
   signal Ex_PC : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Excep_PC_Control PORT MAP (
          Arith_Excep_En => Arith_Excep_En,
          Logic_Excep_En => Logic_Excep_En,
          Arith_Excep_PC => Arith_Excep_PC,
          Logic_Excep_PC => Logic_Excep_PC,
          Ex_En => Ex_En,
          Ex_PC => Ex_PC
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
		Arith_Excep_En <= '0';
		Logic_Excep_En <= '0';
		Arith_Excep_PC <= "01011001010111001101111010111100";
		Logic_Excep_PC <= "10110111000110100110010000000110";
		wait for 10 ns;
		
		Arith_Excep_En <= '1';
		Logic_Excep_En <= '0';
		Arith_Excep_PC <= "01011001010111001101111010111100";
		Logic_Excep_PC <= "10110111000110100110010000000110";
		wait for 10 ns;
		
		Arith_Excep_En <= '0';
		Logic_Excep_En <= '1';
		Arith_Excep_PC <= "01011001010111001101111010111100";
		Logic_Excep_PC <= "10110111000110100110010000000110";
		wait for 10 ns;
		
		Arith_Excep_En <= '1';
		Logic_Excep_En <= '1';
		Arith_Excep_PC <= "01011001010111001101111010111100";
		Logic_Excep_PC <= "10110111000110100110010000000110";
		wait for 10 ns;
		
		Arith_Excep_En <= '0';
		Logic_Excep_En <= '0';
		Arith_Excep_PC <= "01011001010111001101111010111100";
		Logic_Excep_PC <= "10110111000110100110010000000110";
		wait for 10 ns;
      wait;
   end process;
END;